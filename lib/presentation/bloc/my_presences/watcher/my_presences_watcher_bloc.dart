import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:where_am_i/core/error/failure.dart';
import 'package:where_am_i/domain/entities/workstation.dart';
import 'package:where_am_i/domain/repositories/workstation_repository.dart';
import 'package:where_am_i/presentation/bloc/my_presences/actor/my_presences_actor_bloc.dart';

part 'my_presences_watcher_event.dart';

part 'my_presences_watcher_state.dart';

part 'my_presences_watcher_bloc.freezed.dart';

class MyPresencesWatcherBloc
    extends Bloc<MyPresencesWatcherEvent, MyPresencesWatcherState> {
  MyPresencesWatcherBloc(
     this.workstationRepository,
     this.myPresencesActorBloc,
  ) : super(MyPresencesWatcherState.initial()) {
    _presencesSubscription =
        myPresencesActorBloc.listen((state) => _handleActorStateChange(state));
    add(MyPresencesWatcherEvent.getUserPresences());
  }

  final WorkstationRepository workstationRepository;
  final MyPresencesActorBloc myPresencesActorBloc;
  List<Workstation> cachedUserPresences = List.empty();

  StreamSubscription _presencesSubscription;

  @override
  Stream<MyPresencesWatcherState> mapEventToState(
      MyPresencesWatcherEvent event) async* {
    yield* event.map(
      getUserPresences: (e) async* {
        yield const MyPresencesWatcherState.loadInProgress();
        final presences = await workstationRepository.getAllForCurrentUser();
        presences
            .fold((failure) => MyPresencesWatcherState.loadFailure(failure),
                (presences) {
          cachedUserPresences = presences;
          add(MyPresencesWatcherEvent.workstationsReceived());
        });
      },
      workstationsReceived: (e) async* {
        yield MyPresencesWatcherState.loadInProgress();
        yield MyPresencesWatcherState.loadSuccess(cachedUserPresences);
      },
    );
  }

  @override
  Future<void> close() {
    _presencesSubscription.cancel();
    return super.close();
  }

  void _handleActorStateChange(MyPresencesActorState state) {
    state.maybeMap(
      insertSuccess: (value) {
        cachedUserPresences.add(value.workstation);
        add(MyPresencesWatcherEvent.workstationsReceived());
      },
      updateSuccess: (value) {
        final index = cachedUserPresences.indexWhere((element) =>
            element.idWorkstation == value.workstation.idWorkstation);
        if (index != -1) {
          cachedUserPresences[index] = value.workstation;
        }
        add(MyPresencesWatcherEvent.workstationsReceived());
      },
      deleteSuccess: (value) {
        final index = cachedUserPresences.indexWhere(
            (element) => element.idWorkstation == value.idWorkstation);
        if (index != -1) {
          cachedUserPresences.removeAt(index);
        }
        add(MyPresencesWatcherEvent.workstationsReceived());
      },
      multipleInsertSuccess: (value) {
        cachedUserPresences.addAll(value.workstations);
        add(MyPresencesWatcherEvent.workstationsReceived());
      },
      actionInProgress: (value) => state,
      orElse: () {},
    );
  }
}
