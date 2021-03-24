import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';
import 'package:where_am_i/core/error/failure.dart';
import 'package:where_am_i/core/utils/constants.dart';
import 'package:where_am_i/core/utils/enums.dart';
import 'package:where_am_i/core/utils/extensions.dart';
import 'package:where_am_i/domain/blocs/authentication/authentication_bloc.dart';
import 'package:where_am_i/domain/entities/workstation.dart';
import 'package:where_am_i/domain/repositories/workstation_repository.dart';

import '../../../../injection_container.dart';

part 'my_presences_actor_event.dart';

part 'my_presences_actor_state.dart';

part 'my_presences_actor_bloc.freezed.dart';

class MyPresencesActorBloc
    extends Bloc<MyPresencesActorEvent, MyPresencesActorState> {
  MyPresencesActorBloc(this._workstationRepository)
      : super(MyPresencesActorState.initial());
  final WorkstationRepository _workstationRepository;

  @override
  Stream<MyPresencesActorState> mapEventToState(
    MyPresencesActorEvent event,
  ) async* {
    yield const MyPresencesActorState.actionInProgress();
    yield* event.map(
      added: (e) => _mapAddedEventToState(e),
      addedMultiple: (e) => _mapAddedMultipleToState(e),
      removed: (e) => _mapRemovedEventToState(e),
      updated: (e) => _mapUpdatedEventToState(e),
      editRequested: (e) => _mapEditRequestedEventToState(e),
    );
  }

  Stream<MyPresencesActorState> _mapAddedEventToState(_Added e) async* {
    final currentUserId =
        getIt<AuthenticationBloc>().state.authenticatedUser.user.idResource;
    Workstation workstation = Workstation(
      idWorkstation: null,
      codeWorkstation: null,
      status: WORKSTATION_STATUS_PENDING,
      startTime: e.timeslot.toStartTime(),
      endTime: e.timeslot.toEndTime(),
      workstationDate: e.date,
      idResource: currentUserId,
    );
    final insertOrFailure = await _workstationRepository.insert(workstation);
    yield insertOrFailure.fold(
      (failure) => MyPresencesActorState.insertFailure(failure),
      (workstation) => MyPresencesActorState.insertSuccess(workstation),
    );
  }

  Stream<MyPresencesActorState> _mapAddedMultipleToState(
      _AddedMultiple e) async* {
    final currentUserId =
        getIt<AuthenticationBloc>().state.authenticatedUser.user.idResource;
    final insertOrFailure = await _workstationRepository.insertAll(e.dates
        .map((date) => Workstation(
              idWorkstation: null,
              codeWorkstation: null,
              status: WORKSTATION_STATUS_PENDING,
              startTime: e.timeslot.toStartTime(),
              endTime: e.timeslot.toEndTime(),
              workstationDate: date,
              idResource: currentUserId,
            ))
        .toList());
    yield insertOrFailure.fold(
      (failure) => MyPresencesActorState.multipleInsertFailure(failure),
      (workstations) =>
          MyPresencesActorState.multipleInsertSuccess(workstations),
    );
  }

  Stream<MyPresencesActorState> _mapRemovedEventToState(_Removed e) async* {
    if (e.workstation.status != WORKSTATION_STATUS_PENDING) {
      yield MyPresencesActorState.deleteFailure(
        UnexpectedFailure(WORKSTATION_EDIT_STATUS_ERROR),
      );
    } else {
      final removeOrFailure =
          await _workstationRepository.delete(e.workstation.idWorkstation);
      yield removeOrFailure.fold(
        (failure) => MyPresencesActorState.deleteFailure(failure),
        (idWorkstation) => MyPresencesActorState.deleteSuccess(idWorkstation),
      );
    }
  }

  Stream<MyPresencesActorState> _mapUpdatedEventToState(_Updated e) async* {
    if (e.workstation.status != WORKSTATION_STATUS_PENDING) {
      yield MyPresencesActorState.updateFailure(
        UnexpectedFailure(WORKSTATION_EDIT_STATUS_ERROR),
      );
    } else {
      final removeOrFailure =
          await _workstationRepository.update(e.workstation);
      yield removeOrFailure.fold(
        (failure) => MyPresencesActorState.updateFailure(failure),
        (workstation) => MyPresencesActorState.updateSuccess(workstation),
      );
    }
  }

  Stream<MyPresencesActorState> _mapEditRequestedEventToState(
      _EditRequested e) async* {
    //date to edit previous current date
    if (!e.day.isBeforeTimeLess(DateTime.now())) {
      if (e.workstation != null &&
          e.workstation?.status != WORKSTATION_STATUS_PENDING) {
        yield MyPresencesActorState.updateFailure(
          UnexpectedFailure(WORKSTATION_EDIT_STATUS_ERROR),
        );
      } else {
        yield MyPresencesActorState.showTimeSlotDialog(e.day, e.workstation);
      }
    } else {
      yield MyPresencesActorState.updateFailure(
        UnexpectedFailure(WORKSTATION_EDIT_DATE_ERROR),
      );
    }
  }
}
