import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:flutter/material.dart';
import 'package:where_am_i/core/utils/extensions.dart';

import 'package:where_am_i/domain/entities/reservation.dart';
import 'package:where_am_i/domain/usecases/reservations/delete_reservation.dart';
import 'package:where_am_i/domain/usecases/reservations/get_reservations_by_date.dart';
import 'package:where_am_i/domain/usecases/reservations/insert_reservation.dart';
import 'package:where_am_i/domain/usecases/reservations/update_reservation_status.dart';

part 'reservation_event.dart';

part 'reservation_state.dart';

class ReservationsBloc extends Bloc<ReservationsEvent, ReservationState> {
  final GetReservationsByDate _getReservations;
  final InsertReservation _insertReservation;
  final UpdateReservation _updateReservation;
  final DeleteReservation _deleteReservation;

  ReservationsBloc({
    @required GetReservationsByDate getReservations,
    @required InsertReservation insertReservation,
    @required UpdateReservation updateReservationStatus,
    @required DeleteReservation deleteReservation,
  })  : assert(getReservations != null),
        assert(insertReservation != null),
        assert(updateReservationStatus != null),
        assert(deleteReservation != null),
        _getReservations = getReservations,
        _insertReservation = insertReservation,
        _updateReservation = updateReservationStatus,
        _deleteReservation = deleteReservation,
        super(ReservationInitial());

  @override
  Stream<ReservationState> mapEventToState(
    ReservationsEvent event,
  ) async* {
    if (event is FetchReservationsList) {
      yield* _fetchReservationsList(event.dateToFetch);
    } else if (event is InsertReservationEvent) {
      yield* _validateAndInsertReservation(event.reservation);
    } else if (event is UpdateReservationEvent) {
      yield* _performReservationUpdate(event.updatedReservation);
    } else if (event is DeleteReservationEvent) {
      yield* _performDeleteReservation(event.idReservation);
    }
  }

  Stream<ReservationState> _fetchReservationsList(DateTime dateToFetch) async* {
    yield ReservationsFetchLoadingState();
    print('fetching reservations for $dateToFetch');
    final reservationsList = await _getReservations(dateToFetch);
    yield reservationsList.fold((failure) {
      return ReservationsFetchErrorState();
    }, (reservations) {
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
    } else if (reservation.endHour > 18 ||
        reservation.endHour == 18 && reservation.endMinutes > 0) {
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
      yield ReservationUpdatingState();
      final updateReservationResult = await _insertReservation(reservation);
      yield updateReservationResult.fold((failure) {
        return ReservationUpdateErrorState(
            errorMessage: failure.getErrorMessageFromFailure());
      }, (reservationsList) {
        return ReservationsFetchCompletedState(reservationsList);
      });
    }
  }

  Stream<ReservationState> _performReservationUpdate(
      Reservation updatedReservation) async* {
    final updatedList = await _updateReservation(updatedReservation);
    yield updatedList.fold((failure) {
      return ReservationUpdateErrorState(
          errorMessage: failure.getErrorMessageFromFailure());
    }, (reservations) {
      print('reservations : ${reservations.toList()}');
      return ReservationsFetchCompletedState(reservations);
    });
  }

  Stream<ReservationState> _performDeleteReservation(int idReservation) async* {
    final updatedList = await _deleteReservation(idReservation);
    yield updatedList.fold((failure) {
      return ReservationUpdateErrorState(
          errorMessage: failure.getErrorMessageFromFailure());
    }, (reservations) {
      print('reservations : ${reservations.toList()}');
      return ReservationsFetchCompletedState(reservations);
    });
  }
}
