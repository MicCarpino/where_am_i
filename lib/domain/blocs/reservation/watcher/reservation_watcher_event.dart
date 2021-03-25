part of 'reservation_watcher_bloc.dart';

@freezed
abstract class ReservationWatcherEvent with _$ReservationWatcherEvent {
  const factory ReservationWatcherEvent.fetchReservations(DateTime date) = _FetchReservations;
  const factory ReservationWatcherEvent.onReservationsUpdate(List<Reservation> reservations) = _OnReservationsUpdate;
}
