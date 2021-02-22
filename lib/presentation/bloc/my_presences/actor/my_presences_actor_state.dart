part of 'my_presences_actor_bloc.dart';

@freezed
abstract class MyPresencesActorState with _$MyPresencesActorState {
  const factory MyPresencesActorState.initial() = _Initial;

  const factory MyPresencesActorState.actionInProgress() = _ActionInProgress;

  const factory MyPresencesActorState.insertSuccess(Workstation workstation) =
      _InsertSuccess;

  const factory MyPresencesActorState.insertFailure(Failure failure) =
      _InsertFailure;

  const factory MyPresencesActorState.deleteSuccess(int idWorkstation) =
      _DeleteSuccess;

  const factory MyPresencesActorState.deleteFailure(Failure failure) =
      _DeleteFailure;

  const factory MyPresencesActorState.updateSuccess(Workstation workstation) =
      _UpdateSuccess;

  const factory MyPresencesActorState.updateFailure(Failure failure) =
      _UpdateFailure;

  const factory MyPresencesActorState.showTimeSlotDialog(
      DateTime date, [Workstation workstation]) = _ShowTimeSlotDialog;
}
