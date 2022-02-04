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

// this bloc handle the logic for the "reservations" section
// the watcher bloc just handle list fetch and emission, while the operations
// insert/delete/update are performed from the "actor bloc", in order to
// facilitate state handling
class ReservationWatcherBloc
    extends Bloc<ReservationWatcherEvent, ReservationWatcherState> {
  ReservationWatcherBloc({
    @required this.reservationRepository,
    @required this.reservationActorBloc,
  }) : super(ReservationWatcherState.initial()) {
//fetch reservations for current date on bloc initialization
    add(ReservationWatcherEvent.fetchReservations(DateTime.now().zeroed()));

    //subscribe to the actor bloc in order to update the list on successful crud operations
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
      //fetch reservations for a specific date
      fetchReservations: (value) async* {
        yield ReservationWatcherState.loadInProgress();
        final fetchResult =
            await reservationRepository.getAllReservationsByDate(value.date);
        yield fetchResult.fold(
          //fetch failed, emit failure state
          (failure) => ReservationWatcherState.loadFailure(
              failure.getErrorMessageFromFailure()),
          //fetch successful, emit state with the reservations list
          (reservations) {
            cachedReservations = reservations;
            return ReservationWatcherState.loadSuccess(reservations);
          },
        );
      },
      //an update occurred and the updated list has to be emitted
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
