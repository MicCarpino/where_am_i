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
    // TODO: implement mapEventToState
  }
}
