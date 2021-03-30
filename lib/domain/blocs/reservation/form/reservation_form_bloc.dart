import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';
import 'package:where_am_i/core/utils/constants.dart';
import 'package:where_am_i/domain/blocs/reservation/form/reservation_form.dart';
import 'package:where_am_i/domain/blocs/reservation/actor/reservation_actor_bloc.dart';
import 'package:where_am_i/domain/entities/reservation.dart';

part 'reservation_form_event.dart';

part 'reservation_form_state.dart';

part 'reservation_form_bloc.freezed.dart';

class ReservationFormBloc
    extends Bloc<ReservationFormEvent, ReservationFormState> {
  ReservationFormBloc({@required this.reservationActorBloc})
      : super(ReservationFormState.initial()) {
    _reservationActorSubscription = reservationActorBloc.listen((actorState) {
      actorState.maybeMap(
          orElse: () {},
          actionFailure: (_) => add(ReservationFormEvent.saveFailed()));
    });
  }

  final ReservationActorBloc reservationActorBloc;
  StreamSubscription _reservationActorSubscription;

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
              state.reservationForm.copyWith(participants: value.participants),
        );
      },
      saveSubmitted: (value) async* {
        yield state.copyWith(isSaving: true);
        final form = Formz.validate([
          state.reservationForm.subjectForm,
          state.reservationForm.startTimeForm,
          state.reservationForm.endTimeForm,
        ]);
        if (form.isValid) {
          Reservation reservation = Reservation(
            idReservation: state.reservationForm.idReservation,
            idRoom: state.reservationForm.idRoom,
            description: state.reservationForm.subjectForm.value,
            status: RESERVATION_PENDING,
            idHandler: state.reservationForm.idHandler,
            participants: state.reservationForm.participants,
            reservationDate: state.reservationForm.date,
            startHour: state.reservationForm.startTimeForm.value.hour,
            startMinutes: state.reservationForm.startTimeForm.value.minute,
            endHour: state.reservationForm.endTimeForm.value.hour,
            endMinutes: state.reservationForm.endTimeForm.value.minute,
          );
          reservationActorBloc.add(
            state.isEditing
                ? ReservationActorEvent.update(reservation)
                : ReservationActorEvent.insert(reservation),
          );
        } else {
          yield state.copyWith(isSaving: false);
        }
      },
      saveFailed: (value) async* {
        yield state.copyWith(isSaving: false);
      },
    );
  }

  @override
  Future<void> close() {
    _reservationActorSubscription.cancel();
    return super.close();
  }
}
