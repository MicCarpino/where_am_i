import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:flutter/material.dart';
import 'package:where_am_i/core/utils/extensions.dart';
import 'package:where_am_i/core/error/failure.dart';

import 'package:where_am_i/domain/entities/reservation.dart';
import 'package:where_am_i/domain/usecases/get_reservations_by_date.dart';
import 'package:where_am_i/domain/usecases/insert_reservation.dart';

part 'reservation_event.dart';

part 'reservation_state.dart';

class ReservationsBloc extends Bloc<ReservationsEvent, ReservationState> {
  final GetReservationsByDate _getReservations;
  final InsertReservation _insertReservation;

  ReservationsBloc({
    @required GetReservationsByDate getReservations,
    @required InsertReservation insertReservation,
  })  : assert(getReservations != null),
        assert(insertReservation != null),
        _getReservations = getReservations,
        _insertReservation = insertReservation,
        super(ReservationInitial());

  @override
  Stream<ReservationState> mapEventToState(
    ReservationsEvent event,
  ) async* {
    if (event is FetchReservationsList) {
      yield* _fetchReservationsList(event.dateToFetch);
    } else if (event is InsertReservationEvent) {
      yield* _validateAndInsertReservation(event.reservation);
    }
  }

  Stream<ReservationState> _fetchReservationsList(DateTime dateToFetch) async* {
    yield ReservationsFetchLoadingState();

    print('fetching reservations for $dateToFetch');

    final reservationsList = await _getReservations(dateToFetch);

    yield reservationsList.fold((failure) {
      print(
          'workstations fail : ${failure is ServerFailure ? failure.errorMessage : failure.toString()}');
      return ReservationsFetchErrorState();
    }, (reservations) {
      print('reservations : ${reservations.toList()}');
      return ReservationsFetchCompletedState(reservations);
    });
  }

  Stream<ReservationState> _validateAndInsertReservation(
      Reservation reservation) async* {
    var reservationStartTime = TimeOfDay(
        hour: reservation.startHour, minute: reservation.startMinutes);
    var reservationEndTime =
        TimeOfDay(hour: reservation.endHour, minute: reservation.endMinutes);
    if (reservation.startHour < 9) {
      yield ReservationUpdateErrorState(
          errorMessage:
              'Non è possibile inserire una prenotazione che inizia prima delle ore 9');
    } else if (reservation.endHour >= 18 && reservation.endMinutes > 0) {
      yield ReservationUpdateErrorState(
          errorMessage:
              'Non è possibile inserire una prenotazione che finisce dopo le ore 18.00');
    } else if (reservationStartTime.isAfter(reservationEndTime)) {
      yield ReservationUpdateErrorState(
          errorMessage:
              ('Non è possibile inserire una prenotazione la cui ora di inizio è maggiore dell\'ora di fine'));
    } else if (reservationStartTime.isEqual(reservationEndTime)) {
      yield ReservationUpdateErrorState(
          errorMessage: ('L\'orario di inizio e fine prenotazione coincidono'));
    } else {
      yield ReservationUpdateSuccessState();
      final updateReservationResult = await _insertReservation(reservation);
      yield updateReservationResult.fold((failure) {
        return ReservationUpdateErrorState(
            errorMessage: (failure is ServerFailure)
                ? failure.errorMessage
                : "Boh, no so");
      }, (reservationsList) {
        return ReservationsFetchCompletedState(reservationsList);
      });
    }
  }
}
