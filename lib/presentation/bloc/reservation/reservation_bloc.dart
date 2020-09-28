import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:where_am_i/domain/entities/reservation.dart';
import 'package:where_am_i/domain/usecases/get_reservations.dart';

part 'reservation_event.dart';

part 'reservation_state.dart';

class ReservationsBloc extends Bloc<ReservationsEvent, ReservationState> {
  final GetReservations getReservations;

  ReservationsBloc({@required GetReservations getReservations})
      : assert(getReservations != null),
        getReservations = getReservations,
        super(ReservationInitial());

  @override
  Stream<ReservationState> mapEventToState(ReservationsEvent event,) async* {
    if (event is FetchReservationsList) {
      yield ReservationsFetchLoadingState();
      print('fetching workstations');
      final tempDate = DateTime.parse("2020-03-09");

      final reservationsList = await getReservations.homeRepository
          .getReservations(tempDate);

      yield reservationsList.fold((failure) => ReservationsFetchErrorState(),
              (reservations) =>
              ReservationsFetchCompletedState(reservations));
    }
  }
}

