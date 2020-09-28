part of 'reservation_bloc.dart';

@immutable
abstract class ReservationState {}

class ReservationInitial extends ReservationState {}

class ReservationsFetchLoadingState extends ReservationState {}

class ReservationsFetchCompletedState extends ReservationState {
  final List<Reservation> reservationsList;

  ReservationsFetchCompletedState(this.reservationsList);
}

class ReservationsFetchErrorState extends ReservationState {}
