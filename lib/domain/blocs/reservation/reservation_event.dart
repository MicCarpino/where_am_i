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

class UpdateReservationEvent extends ReservationsEvent {
  final Reservation updatedReservation;

  UpdateReservationEvent({@required this.updatedReservation});
}

class DeleteReservationEvent extends ReservationsEvent {
  final int idReservation;

  DeleteReservationEvent({@required this.idReservation});
}
