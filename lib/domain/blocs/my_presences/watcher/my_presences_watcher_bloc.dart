import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:where_am_i/core/error/failure.dart';
import 'package:where_am_i/domain/blocs/my_presences/actor/my_presences_actor_bloc.dart';
import 'package:where_am_i/domain/entities/workstation.dart';
import 'package:where_am_i/domain/repositories/workstation_repository.dart';

part 'my_presences_watcher_event.dart';

part 'my_presences_watcher_state.dart';

part 'my_presences_watcher_bloc.freezed.dart';

// this bloc handle the logic for the "my presences" section
// the watcher bloc just handle list fetch and emission, while the operations
// insert/delete/update are performed from the "actor bloc", in order to
// facilitate state handling
class MyPresencesWatcherBloc
    extends Bloc<MyPresencesWatcherEvent, MyPresencesWatcherState> {
  MyPresencesWatcherBloc(
    this.workstationRepository,
    this.myPresencesActorBloc,
  ) : super(MyPresencesWatcherState.initial()) {
    //subscribe to the actor bloc in order to update the list on successful crud operations
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
      //fetch user presences for logged user
      getUserPresences: (e) async* {
        yield const MyPresencesWatcherState.loadInProgress();
        final presences = await workstationRepository.getAllForCurrentUser();
        yield presences.fold(
          //fetch failed, emit failure state
          (failure) => MyPresencesWatcherState.loadFailure(failure),
          //fetch successful, emit state with the presences list
          (presences) {
            cachedUserPresences = presences;
            return MyPresencesWatcherState.loadSuccess(cachedUserPresences);
          },
        );
      },
      //an update occurred and the updated list has to be emitted
      workstationsReceived: (e) async* {
        yield MyPresencesWatcherState.loadInProgress();
        yield MyPresencesWatcherState.loadSuccess(cachedUserPresences);
      },
    );
  }

  //update the list with data coming from the actor bloc
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

  @override
  Future<void> close() {
    _presencesSubscription.cancel();
    return super.close();
  }
}
