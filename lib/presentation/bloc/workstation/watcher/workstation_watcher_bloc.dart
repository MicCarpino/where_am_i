import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';
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
  WorkstationWatcherBloc(
    this.workstationRepository,
    this.userRepository,
  ) : super(WorkstationWatcherState.initial());

  final WorkstationRepository workstationRepository;
  final UserRepository userRepository;

  List<UserWithWorkstation> cachedUsersPresences = [];

  @override
  Stream<WorkstationWatcherState> mapEventToState(
    WorkstationWatcherEvent event,
  ) async* {
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
}
