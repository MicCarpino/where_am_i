part of 'reservation_actor_bloc.dart';

@freezed
abstract class ReservationActorState with _$ReservationActorState {
  const factory ReservationActorState.initial() = _Initial;

  const factory ReservationActorState.insertSuccess(Reservation reservation) =
      _InsertSuccess;

  const factory ReservationActorState.updateSuccess(Reservation reservation) =
      _UpdateSuccess;

  const factory ReservationActorState.deleteSuccess(int idReservation) =
      _DeleteSuccess;

  const factory ReservationActorState.actionInProgress() = _ActionInProgress;

  const factory ReservationActorState.actionFailure(Failure failure) =
      _ActionFailure;
}
