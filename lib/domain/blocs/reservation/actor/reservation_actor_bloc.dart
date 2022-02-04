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

// this bloc handle the logic for the "reservations" section
// the actor bloc take care of "actions" performed on list hold by the watcher bloc
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
      //perform a reservation insert and emit the result of the operation
    insert: (value) async* {
        yield ReservationActorState.actionInProgress();
        final insertResult =
            await reservationRepository.insertReservation(value.reservation);
        yield insertResult.fold(
          (failure) => ReservationActorState.actionFailure(failure),
          (reservation) => ReservationActorState.insertSuccess(reservation),
        );
      },
      //perform a reservation update and emit the result of the operation
      update: (value) async* {
        yield ReservationActorState.actionInProgress();
        final updateResult =
            await reservationRepository.updateReservation(value.reservation);
        yield updateResult.fold(
            (failure) => ReservationActorState.actionFailure(failure),
            (reservation) => ReservationActorState.updateSuccess(reservation));
      },
      //perform a reservation delete and emit the result of the operation
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
