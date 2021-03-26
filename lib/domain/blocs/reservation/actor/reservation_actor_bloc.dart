import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';
import 'package:where_am_i/core/error/failure.dart';
import 'package:where_am_i/domain/entities/reservation.dart';
import 'package:where_am_i/domain/repositories/reservation_repository.dart';

part 'reservation_actor_event.dart';

part 'reservation_actor_state.dart';

part 'reservation_actor_bloc.freezed.dart';

class ReservationActorBloc
    extends Bloc<ReservationActorEvent, ReservationActorState> {
  ReservationActorBloc({@required this.reservationRepository})
      : super(ReservationActorState.initial());
  final ReservationRepository reservationRepository;

  @override
  Stream<ReservationActorState> mapEventToState(
    ReservationActorEvent event,
  ) async* {
    yield* event.map(
      insert: (value) async* {
        yield ReservationActorState.actionInProgress();
        final insertResult =
            await reservationRepository.insertReservation(value.reservation);
        yield insertResult.fold(
          (failure) => ReservationActorState.actionFailure(failure),
          (reservation) => ReservationActorState.insertSuccess(reservation),
        );
      },
      update: (value) async* {
        yield ReservationActorState.actionInProgress();
        final updateResult =
            await reservationRepository.updateReservation(value.reservation);
        yield updateResult.fold(
            (failure) => ReservationActorState.actionFailure(failure),
            (reservation) => ReservationActorState.updateSuccess(reservation));
      },
      delete: (value) async* {
        yield ReservationActorState.actionInProgress();
        final deleteResult =
            await reservationRepository.deleteReservation(value.idReservation);
        yield deleteResult.fold(
          (failure) => ReservationActorState.actionFailure(failure),
          (idReservation) => ReservationActorState.deleteSuccess(idReservation),
        );
      },
    );
  }
}
