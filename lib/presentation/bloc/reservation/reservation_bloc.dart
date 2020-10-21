import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:where_am_i/core/error/failure.dart';

import 'package:where_am_i/domain/entities/reservation.dart';
import 'package:where_am_i/domain/usecases/get_reservations_by_date.dart';

part 'reservation_event.dart';

part 'reservation_state.dart';

class ReservationsBloc extends Bloc<ReservationsEvent, ReservationState> {
  final GetReservationsByDate getReservations;

  ReservationsBloc({@required GetReservationsByDate getReservations})
      : assert(getReservations != null),
        getReservations = getReservations,
        super(ReservationInitial());

  @override
  Stream<ReservationState> mapEventToState(
    ReservationsEvent event,
  ) async* {
    if (event is FetchReservationsList) {
      yield* _fetchReservationsList(event.dateToFetch);
    }
  }

  Stream<ReservationState> _fetchReservationsList(DateTime dateToFetch) async* {
    yield ReservationsFetchLoadingState();

    print('fetching reservations for $dateToFetch');

    final reservationsList = await getReservations(dateToFetch);

    yield reservationsList.fold((failure) {
      print(
          'workstations fail : ${failure is ServerFailure ? failure.errorMessage : failure.toString()}');
      return ReservationsFetchErrorState();
    }, (reservations) {
      print('reservations : ${reservations.toList()}');
      return ReservationsFetchCompletedState(reservations);
    });
  }
}
