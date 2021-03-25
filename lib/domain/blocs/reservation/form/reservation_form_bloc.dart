import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'reservation_form_event.dart';
part 'reservation_form_state.dart';

class ReservationFormBloc extends Bloc<ReservationFormEvent, ReservationFormState> {
  ReservationFormBloc() : super(ReservationFormInitial());

  @override
  Stream<ReservationFormState> mapEventToState(
    ReservationFormEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
