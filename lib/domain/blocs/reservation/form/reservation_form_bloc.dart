import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';
import 'package:where_am_i/core/error/failure.dart';
import 'package:where_am_i/domain/blocs/reservation/form/reservation_form.dart';
import 'package:where_am_i/domain/entities/reservation.dart';

part 'reservation_form_event.dart';

part 'reservation_form_state.dart';

part 'reservation_form_bloc.freezed.dart';

class ReservationFormBloc
    extends Bloc<ReservationFormEvent, ReservationFormState> {
  ReservationFormBloc() : super(ReservationFormState.initial());

  @override
  Stream<ReservationFormState> mapEventToState(
    ReservationFormEvent event,
  ) async* {
    yield* event.map(
      initializeEmpty: (value) async* {
        yield state.copyWith(
          reservationForm: ReservationForm.initial(
            value.idRoom,
            value.date,
            value.idHandler,
          ),
        );
      },
      initializeEdit: (value) async* {
        yield state.copyWith(
          reservationForm: ReservationForm.fromDomain(value.reservation),
          isEditing: true,
        );
      },
      idRoomChanged: (value) async* {
        yield state.copyWith(
          reservationForm: state.reservationForm.copyWith(idRoom: value.idRoom),
        );
      },
      startTimeChanged: (value) async* {
        yield state.copyWith(
          reservationForm: state.reservationForm
              .copyWith(startTimeForm: TimeForm.dirty(value.startTime)),
        );
      },
      endTimeChanged: (value) async* {
        yield state.copyWith(
          reservationForm: state.reservationForm
              .copyWith(endTimeForm: TimeForm.dirty(value.endTime)),
        );
      },
      descriptionChanged: (value) async* {
        yield state.copyWith(
          reservationForm: state.reservationForm
              .copyWith(subjectForm: SubjectForm.dirty(value.description)),
        );
      },
      participantsChanged: (value) async* {
        yield state.copyWith(
          reservationForm:
              state.reservationForm.copyWith(participants:value.participants),
        );
      },
      saved: (value) async* {},
    );
  }
}
