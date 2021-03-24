part of 'presences_management_actor_bloc.dart';

@freezed
abstract class PresencesManagementActorState
    with _$PresencesManagementActorState {
  const factory PresencesManagementActorState.initial() = _Initial;

  const factory PresencesManagementActorState.actionInProgress() =
      _ActionInProgress;

  const factory PresencesManagementActorState.insertSuccess(
      Workstation workstation) = _InsertSuccess;

  const factory PresencesManagementActorState.multipleInsertSuccess(
      List<Workstation> workstations) = _MultipleInsertSuccess;

  const factory PresencesManagementActorState.deleteSuccess(int idWorkstation) =
      _DeleteSuccess;

  const factory PresencesManagementActorState.updateSuccess(
      Workstation workstation) = _UpdateSuccess;

  const factory PresencesManagementActorState.actionFailure(Failure failure) =
      _Failure;

  const factory PresencesManagementActorState.showTimeSlotDialog(DateTime date,
      [Workstation workstation, User user]) = _ShowTimeSlotDialog;
}
