import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';
import 'package:where_am_i/domain/blocs/workstation/actor/workstation_actor_bloc.dart';
import 'package:where_am_i/domain/entities/user.dart';
import 'package:where_am_i/domain/entities/user_with_workstation.dart';
import 'package:where_am_i/domain/entities/workstation.dart';
import 'package:where_am_i/domain/repositories/user_repository.dart';
import 'package:where_am_i/domain/repositories/workstation_repository.dart';

part 'workstation_watcher_event.dart';

part 'workstation_watcher_state.dart';

part 'workstation_watcher_bloc.freezed.dart';

class WorkstationWatcherBloc
    extends Bloc<WorkstationWatcherEvent, WorkstationWatcherState> {
  WorkstationWatcherBloc({
    @required this.workstationRepository,
    @required this.userRepository,
    @required this.workstationActorBloc,
  }) : super(WorkstationWatcherState.initial()) {
    _workstationActorSubscription =
        workstationActorBloc.listen((state) => _handleActorStateChange(state));
  }

  final WorkstationRepository workstationRepository;
  final UserRepository userRepository;
  final WorkstationActorBloc workstationActorBloc;

  List<UserWithWorkstation> cachedUsersPresences = [];
  StreamSubscription _workstationActorSubscription;

  @override
  Stream<WorkstationWatcherState> mapEventToState(
    WorkstationWatcherEvent event,
  ) async* {
    yield WorkstationWatcherState.loadInProgress();
    print('fetching workstation for ${event.date}');
    final workstationsOrFailure =
        await workstationRepository.getAllByDate(event.date);
    final usersOrFailure = await userRepository.getAllUsers();

    yield usersOrFailure.fold(
      (usersFailure) => WorkstationWatcherState.loadFailure(
        usersFailure.getErrorMessageFromFailure(),
      ),
      (users) => workstationsOrFailure.fold(
        (workstationFailure) => WorkstationWatcherState.loadFailure(
          workstationFailure.getErrorMessageFromFailure(),
        ),
        (workstations) {
          final usersWithWorkstations =
              _mergeUserWithWorkstations(users, workstations);
          return WorkstationWatcherState.loadSuccess(usersWithWorkstations);
        },
      ),
    );
  }

  List<UserWithWorkstation> _mergeUserWithWorkstations(
      List<User> users, List<Workstation> workstations) {
    return workstations
        .where((e) => e.freeName != null)
        .map((freeName) =>
            UserWithWorkstation(user: null, workstation: freeName))
        .toList(growable: true)
          ..addAll(users.map((user) => UserWithWorkstation(
              user: user,
              workstation: workstations.singleWhereOrNull((workstation) =>
                  workstation.idResource == user.idResource))));
  }

  Stream<WorkstationWatcherState> _handleActorStateChange(
      WorkstationActorState state) async* {
    state.maybeMap(
      updateSuccess: (value) async* {
        final updatedIndex = cachedUsersPresences.indexWhere((element) =>
            element.workstation.idWorkstation ==
            value.workstation.idWorkstation);
        if (updatedIndex != -1) {
          cachedUsersPresences[updatedIndex] =
              cachedUsersPresences[updatedIndex]
                  .copyWith(workstation: value.workstation);
        }
        yield WorkstationWatcherState.loadSuccess(cachedUsersPresences);
      },
      multipleUpdateSuccess: (value) async* {
        value.workstations.map((workstation) {
          final updatedIndex = cachedUsersPresences.indexWhere((element) =>
              element.workstation.idWorkstation == workstation.idWorkstation);
          if (updatedIndex != -1) {
            cachedUsersPresences[updatedIndex] =
                cachedUsersPresences[updatedIndex]
                    .copyWith(workstation: workstation);
          }
        });
        yield WorkstationWatcherState.loadSuccess(cachedUsersPresences);
      },
      orElse: () {},
    );
  }

  @override
  Future<void> close() {
    _workstationActorSubscription.cancel();
    return super.close();
  }
}
