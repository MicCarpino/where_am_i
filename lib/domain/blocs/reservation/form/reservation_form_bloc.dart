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

// this bloc handle the logic for the "reservation form" section
// the watcher bloc just handle list fetch and emission, while the operations
// insert/delete/update are performed from the "actor bloc", in order to
// facilitate state handling
class ReservationFormBloc
    extends Bloc<ReservationFormEvent, ReservationFormState> {
  ReservationFormBloc({
    @required this.reservationActorBloc,
    @required ReservationFormState initialState,
  }) : super(initialState) {
    //subscribe to the actor bloc in order to update the list on successful crud operations
    _reservationActorSubscription = reservationActorBloc.listen((actorState) {
      //react only on a "reservation insert/edit" failure, the success case will
      // be handled by the reservation watcher bloc
      actorState.maybeMap(
        actionFailure: (_) => add(ReservationFormEvent.saveFailed()),
        orElse: () {},
      );
    });
  }

  final ReservationActorBloc reservationActorBloc;
  StreamSubscription _reservationActorSubscription;

  @override
  Stream<ReservationFormState> mapEventToState(
    ReservationFormEvent event,
  ) async* {
    yield* event.map(
      idRoomChanged: (value) async* {
        yield state.copyWith(
          reservationForm: state.reservationForm.copyWith(idRoom: value.idRoom),
        );
      },
      //validate and emit a new state with the start time picked by the user
      startTimeChanged: (value) async* {
        yield state.copyWith(
          reservationForm: state.reservationForm
              .copyWith(startTimeForm: TimeForm.dirty(value.startTime)),
        );
      },
      //validate and emit a new state with the end time picked by the user
      endTimeChanged: (value) async* {
        yield state.copyWith(
          reservationForm: state.reservationForm
              .copyWith(endTimeForm: TimeForm.dirty(value.endTime)),
        );
      },
      //emit a new state with the description inserted by the user
      descriptionChanged: (value) async* {
        yield state.copyWith(
          reservationForm: state.reservationForm
              .copyWith(subjectForm: SubjectForm.dirty(value.description)),
        );
      },
      //emit a new state with the participants list updated by the user
      participantsChanged: (value) async* {
        yield state.copyWith(
          reservationForm:
              state.reservationForm.copyWith(participants: value.participants),
        );
      },
      //perform save operation
      saveSubmitted: (value) async* {
        yield state.copyWith(isSaving: true);
        //validate start time, end time and subject fields
        final form = Formz.validate([
          state.reservationForm.subjectForm,
          state.reservationForm.startTimeForm,
          state.reservationForm.endTimeForm,
        ]);
        if (form.isValid) {
          //create a reservation object and perform the insert or update operation
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
          //validation failed, emit the validated Formz objects
          yield state.copyWith(
              isSaving: false,
              reservationForm: state.reservationForm.copyWith(
                subjectForm: SubjectForm.dirty(
                  state.reservationForm.subjectForm.value,
                ),
              ));
        }
      },
      //event added after the actor bloc failed to perform the save operation
      saveFailed: (value) async* {
        yield state.copyWith(
            isSaving: false,
            reservationForm: state.reservationForm.copyWith(
              subjectForm: SubjectForm.dirty(
                state.reservationForm.subjectForm.value,
              ),
            ));
      },
    );
  }

  @override
  Future<void> close() {
    _reservationActorSubscription.cancel();
    return super.close();
  }
}
