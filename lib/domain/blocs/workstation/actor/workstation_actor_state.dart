part of 'workstation_actor_bloc.dart';

@freezed
abstract class WorkstationActorState with _$WorkstationActorState {
  const factory WorkstationActorState.initial() = _Initial;

  const factory WorkstationActorState.actionInProgress() =
  _ActionInProgress;

  const factory WorkstationActorState.actionFailure(Failure failure) =
  _Failure;

  const factory WorkstationActorState.updateSuccess(
      Workstation workstation) = _UpdateSuccess;

  const factory WorkstationActorState.multipleUpdateSuccess(
      List<Workstation> workstations) = _MultipleUpdateSuccess;
}