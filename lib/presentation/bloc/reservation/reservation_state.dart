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

class ReservationUpdatingState extends ReservationState {}
//State forma insert and update operations in progress
class ReservationUpdateSuccessState extends ReservationState {}

// State for Insert and update operations errors
class ReservationUpdateErrorState extends ReservationState {
  final String errorMessage;

  ReservationUpdateErrorState({@required this.errorMessage});
}
