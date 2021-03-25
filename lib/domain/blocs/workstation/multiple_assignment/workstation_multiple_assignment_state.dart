part of 'workstation_multiple_assignment_cubit.dart';

@freezed
abstract class WorkstationMultipleAssignmentState
    with _$WorkstationMultipleAssignmentState {

  const factory WorkstationMultipleAssignmentState.loadingState() =
      _LoadingState;

  const factory WorkstationMultipleAssignmentState.loadedState(
      List<Workstation> presences) = _LoadedState;

  const factory WorkstationMultipleAssignmentState.errorState(Failure failure) =
      _ErrorState;
}
