import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';
import 'package:where_am_i/core/utils/constants.dart';
import 'package:where_am_i/domain/blocs/workstation/watcher/workstation_watcher_bloc.dart';
import 'package:where_am_i/domain/entities/user_with_workstation.dart';

part 'workstation_assignment_event.dart';

part 'workstation_assignment_state.dart';

part 'workstation_assignment_bloc.freezed.dart';

class WorkstationAssignmentBloc
    extends Bloc<WorkstationAssignmentEvent, WorkstationAssignmentState> {
  WorkstationAssignmentBloc({
    @required this.workstationWatcherBloc,
    @required this.workstationCode,
  }) : super(WorkstationAssignmentState.initial()) {
    workstationWatcherBloc.state.maybeMap(
      orElse: () {},
      loadSuccess: (value) => add(
        WorkstationAssignmentEvent.onListUpdated(value.usersWithWorkstations),
      ),
    );
    _workstationWatcherSubscription = workstationWatcherBloc.listen((state) {
      state.maybeMap(
        orElse: () {},
        loadSuccess: (value) => add(
          WorkstationAssignmentEvent.onListUpdated(value.usersWithWorkstations),
        ),
      );
    });
  }

  final WorkstationWatcherBloc workstationWatcherBloc;
  final int workstationCode;
  StreamSubscription _workstationWatcherSubscription;

  @override
  Stream<WorkstationAssignmentState> mapEventToState(
    WorkstationAssignmentEvent event,
  ) async* {
    yield* event.map(
      onListUpdated: (value) =>
          _filterAndPublish(value.allUsersWithWorkstations),
    );
  }

  @override
  Future<void> close() {
    _workstationWatcherSubscription.cancel();
    return super.close();
  }

  Stream<WorkstationAssignmentState> _filterAndPublish(
      List<UserWithWorkstation> allUsersWithWorkstations) async* {
    final assignedResources = allUsersWithWorkstations
        .where((element) =>
            element.workstation?.codeWorkstation ==
            this.workstationCode.toString())
        .toList();
    final assignableResources = allUsersWithWorkstations
        .where((element) =>
            element.workstation != null &&
            element.workstation.codeWorkstation == null &&
            element.workstation.status == WORKSTATION_STATUS_CONFIRMED)
        .toList();
    assignableResources.removeWhere(
      (assignable) => assignedResources.any((assigned) =>
          assigned.workstation?.startTime ==
              assignable.workstation?.startTime ||
          assigned.workstation?.endTime == assignable.workstation?.endTime),
    );
    yield WorkstationAssignmentState.loadSuccess(
      workstationCode: this.workstationCode,
      assignedResources: assignedResources,
      assignableResources: assignableResources,
    );
  }
}
