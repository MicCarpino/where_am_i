part of 'reservation_bloc.dart';

@immutable
abstract class ReservationsEvent {}

class FetchReservationsList extends ReservationsEvent {
  final DateTime dateToFetch;

  FetchReservationsList({@required this.dateToFetch});
}
