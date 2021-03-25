part of 'reservation_actor_bloc.dart';

@freezed
abstract class ReservationActorEvent with _$ReservationActorEvent {
  const factory ReservationActorEvent.insert(Reservation reservation) = _Insert;

  const factory ReservationActorEvent.update(Reservation reservation) = _Update;

  const factory ReservationActorEvent.delete(int idReservation) = _Delete;
}
