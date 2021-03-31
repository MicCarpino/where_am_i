import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';
import 'package:where_am_i/core/utils/extensions.dart';
import 'package:where_am_i/domain/blocs/authentication/authentication_bloc.dart';
import 'package:where_am_i/domain/blocs/workstation/actor/workstation_actor_bloc.dart';
import 'package:where_am_i/domain/entities/user.dart';
import 'package:where_am_i/domain/entities/user_with_workstation.dart';
import 'package:where_am_i/domain/entities/workstation.dart';
import 'package:where_am_i/domain/repositories/user_repository.dart';
import 'package:where_am_i/domain/repositories/workstation_repository.dart';
import 'package:where_am_i/injection_container.dart';

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

    add(WorkstationWatcherEvent.fetchPresences(DateTime.now().zeroed()));
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
    yield* event.map(
      fetchPresences: (value) async* {
        yield WorkstationWatcherState.loadInProgress();
        print('fetching workstation for ${value.date}');
        final workstationsOrFailure =
            await workstationRepository.getAllByDate(value.date);
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
              cachedUsersPresences =
                  _mergeUserWithWorkstations(users, workstations);
              return WorkstationWatcherState.loadSuccess(cachedUsersPresences);
            },
          ),
        );
      },
      onPresencesUpdated: (value) async* {
        yield WorkstationWatcherState.loadInProgress();
        yield state.maybeMap(
            orElse: () => WorkstationWatcherState.loadSuccess(
                []..addAll(value.presences)),
            loadSuccess: (successState) => successState.copyWith(
                usersWithWorkstations: []..addAll(value.presences)));
      },
    );
  }

  List<UserWithWorkstation> _mergeUserWithWorkstations(
      List<User> users, List<Workstation> workstations) {
    if (workstations.any((element) =>
        element.workstationDate.isAtSameMomentTimeLess(DateTime.now()))) {
      // ignore: close_sinks
      final authBloc = getIt<AuthenticationBloc>();
      final assignedWorkstation = workstations
          .singleWhereOrNull(
            (e) =>
                e.idResource ==
                    authBloc.state.authenticatedUser.user.idResource &&
                e.workstationDate.zeroed() == DateTime.now().zeroed(),
          )
          ?.codeWorkstation;
      authBloc.add(
        WorkstationAssigned(assignedWorkstation != null
            ? int.tryParse(assignedWorkstation)
            : null),
      );
    }

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

  void _handleActorStateChange(WorkstationActorState actorState) {
    actorState.maybeMap(
      updateSuccess: (value) {
        final updatedIndex = cachedUsersPresences.indexWhere((element) =>
            element.workstation?.idWorkstation ==
            value.workstation.idWorkstation);
        if (updatedIndex != -1) {
          cachedUsersPresences[updatedIndex] =
              cachedUsersPresences[updatedIndex]
                  .copyWith(workstation: value.workstation);
        }
        add(WorkstationWatcherEvent.onPresencesUpdated(
            List.of(cachedUsersPresences)));
      },
      multipleUpdateSuccess: (value) {
        value.workstations.forEach((workstation) {
          final updatedIndex = cachedUsersPresences.indexWhere((element) =>
              element.workstation?.idWorkstation == workstation.idWorkstation);
          if (updatedIndex != -1) {
            cachedUsersPresences[updatedIndex] =
                cachedUsersPresences[updatedIndex]
                    .copyWith(workstation: workstation);
          }
        });
        add(WorkstationWatcherEvent.onPresencesUpdated(
            List.of(cachedUsersPresences)));
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
