part of 'workstation_assignment_bloc.dart';

@freezed
abstract class WorkstationAssignmentEvent with _$WorkstationAssignmentEvent {
  const factory WorkstationAssignmentEvent.onListUpdated(
      List<UserWithWorkstation> allUsersWithWorkstations) = _OnListUpdated;
}
