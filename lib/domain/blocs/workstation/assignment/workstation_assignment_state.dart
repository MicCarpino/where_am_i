part of 'workstation_assignment_bloc.dart';

@freezed
abstract class WorkstationAssignmentState with _$WorkstationAssignmentState {
  const factory WorkstationAssignmentState.initial() = _Initial;

  const factory WorkstationAssignmentState.loadSuccess({
    @required int workstationCode,
    @required List<UserWithWorkstation> assignedResources,
    @required List<UserWithWorkstation> assignableResources,
  }) = _LoadSuccess;
}
