import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:where_am_i/domain/blocs/reservation/actor/reservation_actor_bloc.dart';
import 'package:where_am_i/domain/entities/reservation.dart';
import 'package:where_am_i/core/utils/extensions.dart';
import 'package:where_am_i/domain/repositories/reservation_repository.dart';

part 'reservation_watcher_event.dart';

part 'reservation_watcher_state.dart';

part 'reservation_watcher_bloc.freezed.dart';

class ReservationWatcherBloc
    extends Bloc<ReservationWatcherEvent, ReservationWatcherState> {
  ReservationWatcherBloc({
    @required this.reservationRepository,
    @required this.reservationActorBloc,
  }) : super(ReservationWatcherState.initial()) {
    add(ReservationWatcherEvent.fetchReservations(DateTime.now().zeroed()));
    _reservationActorSubscription = reservationActorBloc.listen((actorState) {
      actorState.maybeMap(
          insertSuccess: (value) {
            cachedReservations.add(value.reservation);
            add(ReservationWatcherEvent.onReservationsUpdate(
                cachedReservations));
          },
          updateSuccess: (value) {
            final index = cachedReservations.indexWhere((element) =>
                element.idReservation == value.reservation.idReservation);
            if (index != -1) {
              cachedReservations[index] = value.reservation;
            }
            add(ReservationWatcherEvent.onReservationsUpdate(
                cachedReservations));
          },
          deleteSuccess: (value) {
            final index = cachedReservations.indexWhere(
                (element) => element.idReservation == value.idReservation);
            if (index != -1) {
              cachedReservations.removeAt(index);
            }
            add(ReservationWatcherEvent.onReservationsUpdate(
                cachedReservations));
          },
          orElse: () {});
    });
  }

  final ReservationRepository reservationRepository;
  final ReservationActorBloc reservationActorBloc;

  List<Reservation> cachedReservations = [];
  StreamSubscription _reservationActorSubscription;

  @override
  Stream<ReservationWatcherState> mapEventToState(
    ReservationWatcherEvent event,
  ) async* {
    yield* event.map(
      fetchReservations: (value) async* {
        yield ReservationWatcherState.loadInProgress();
        final fetchResult =
            await reservationRepository.getAllReservationsByDate(value.date);
        yield fetchResult.fold(
          (failure) => ReservationWatcherState.loadFailure(
              failure.getErrorMessageFromFailure()),
          (reservations) {
            cachedReservations = reservations;
            return ReservationWatcherState.loadSuccess(reservations);
          },
        );
      },
      onReservationsUpdate: (value) async* {
        yield ReservationWatcherState.loadInProgress();
        yield state.maybeMap(
          orElse: () => ReservationWatcherState.loadSuccess(value.reservations),
          loadSuccess: (value) =>
              value.copyWith(reservations: value.reservations),
        );
      },
    );
  }

  @override
  Future<void> close() {
    _reservationActorSubscription.cancel();
    return super.close();
  }
}
