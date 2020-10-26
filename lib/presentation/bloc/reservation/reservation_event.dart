part of 'reservation_bloc.dart';

@immutable
abstract class ReservationsEvent {}

class FetchReservationsList extends ReservationsEvent {
  final DateTime dateToFetch;

  FetchReservationsList({@required this.dateToFetch});
}

class InsertReservationEvent extends ReservationsEvent {
  final Reservation reservation;

  InsertReservationEvent({@required this.reservation});
}

class UpdateReservationStatusEvent extends ReservationsEvent {
  final Reservation updatedReservation;

  UpdateReservationStatusEvent({@required this.updatedReservation});
}
