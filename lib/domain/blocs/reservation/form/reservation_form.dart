import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:formz/formz.dart';
import 'package:where_am_i/core/utils/constants.dart';
import 'package:where_am_i/domain/entities/reservation.dart';

part 'reservation_form.freezed.dart';

@freezed
abstract class ReservationForm with _$ReservationForm {
  const ReservationForm._();

  const factory ReservationForm({
    int idReservation,
    @required int idRoom,
    @required DateTime date,
    @required int idHandler,
    List<String> participants,
    int status,
    @required SubjectForm subjectForm,
    @required TimeForm startTimeForm,
    @required TimeForm endTimeForm,
  }) = _ReservationForm;

  factory ReservationForm.initial(int idRoom, DateTime date, int idHandler) =>
      ReservationForm(
        idReservation: null,
        idRoom: idRoom,
        date: date,
        idHandler: idHandler,
        participants: [],
        status: RESERVATION_PENDING,
        subjectForm: SubjectForm.pure(''),
        startTimeForm: TimeForm.pure(TimeOfDay(hour: 9, minute: 0)),
        endTimeForm: TimeForm.pure(TimeOfDay(hour: 18, minute: 0)),
      );

  factory ReservationForm.fromDomain(Reservation reservation) =>
      ReservationForm(
        idReservation: reservation.idReservation,
        idRoom: reservation.idRoom,
        date: reservation.reservationDate,
        idHandler: reservation.idHandler,participants: reservation.participants,status: reservation.status,
        subjectForm: SubjectForm.pure(reservation.description),
        startTimeForm: TimeForm.pure(
          TimeOfDay(
            hour: reservation.startHour,
            minute: reservation.startMinutes,
          ),
        ),
        endTimeForm: TimeForm.pure(
          TimeOfDay(
            hour: reservation.endHour,
            minute: reservation.endMinutes,
          ),
        ),
      );
}

enum ReservationSubjectFormError { empty, invalidTime }

class SubjectForm extends FormzInput<String, ReservationSubjectFormError> {
  SubjectForm.pure(String value) : super.pure(value);

  SubjectForm.dirty(String value) : super.dirty(value);

  @override
  ReservationSubjectFormError validator(String value) {
    return value.isEmpty ? ReservationSubjectFormError.empty : null;
  }
}

enum ReservationDateTimeError { invalid }

class TimeForm extends FormzInput<TimeOfDay, ReservationDateTimeError> {
  TimeForm.pure(TimeOfDay value) : super.pure(value);

  TimeForm.dirty(TimeOfDay value) : super.dirty(value);

  @override
  ReservationDateTimeError validator(TimeOfDay value) {
    return value.hour < 9 || value.hour > 18
        ? ReservationDateTimeError.invalid
        : null;
  }
}
