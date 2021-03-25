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
    _reservationActorSubscription =
        reservationActorBloc.listen((actorState) {});
  }

  final ReservationRepository reservationRepository;
  final ReservationActorBloc reservationActorBloc;
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
          (failure) => ReservationWatcherState.loadFailure(failure.getErrorMessageFromFailure()),
          (reservations) => ReservationWatcherState.loadSuccess(reservations),
        );
      },
      onReservationsUpdate: (value) async* {},
    );
  }

  @override
  Future<void> close() {
    _reservationActorSubscription.cancel();
    return super.close();
  }
}
