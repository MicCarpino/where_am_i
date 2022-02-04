import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:where_am_i/core/error/failure.dart';
import 'package:where_am_i/core/utils/constants.dart';
import 'package:where_am_i/core/utils/enums.dart';
import 'package:where_am_i/core/utils/extensions.dart';
import 'package:where_am_i/domain/entities/user.dart';
import 'package:where_am_i/domain/entities/workstation.dart';
import 'package:where_am_i/domain/repositories/workstation_repository.dart';

part 'presences_management_actor_event.dart';

part 'presences_management_actor_state.dart';

part 'presences_management_actor_bloc.freezed.dart';

// this bloc handle the logic for the "presences management" section
// the actor bloc take care of "actions" performed on list hold by the watcher bloc
class PresencesManagementActorBloc
    extends Bloc<PresencesManagementActorEvent, PresencesManagementActorState> {
  PresencesManagementActorBloc(this._workstationRepository)
      : super(PresencesManagementActorState.initial());
  final WorkstationRepository _workstationRepository;

  @override
  Stream<PresencesManagementActorState> mapEventToState(
    PresencesManagementActorEvent event,
  ) async* {
    yield const PresencesManagementActorState.actionInProgress();
    yield* event.map(
      added: (e) => _mapAddedEventToState(e),
      addedMultiple: (e) => _mapAddedMultipleToState(e),
      removed: (e) => _mapRemovedEventToState(e),
      updated: (e) => _mapUpdatedEventToState(e),
      editRequested: (e) async* {
        if (e.day.isBeforeTimeLess(DateTime.now())) {
          yield PresencesManagementActorState.actionFailure(
              UnexpectedFailure(WORKSTATION_EDIT_DATE_ERROR));
        } else if (e.workstation?.status != WORKSTATION_STATUS_PENDING) {
          yield PresencesManagementActorState.showTimeSlotDialog(
              e.day, e.workstation, e.user);
        }
      },
    );
  }

  //perform a workstation insert and emit the result of the operation
  Stream<PresencesManagementActorState> _mapAddedEventToState(_Added e) async* {
    Workstation workstation = Workstation(
      idWorkstation: null,
      codeWorkstation: null,
      status: WORKSTATION_STATUS_CONFIRMED,
      startTime: e.timeSlot.toStartTime(),
      endTime: e.timeSlot.toEndTime(),
      workstationDate: e.date,
      idResource: e.idResource,
      freeName: e.freeName,
    );
    final insertOrFailure = await _workstationRepository.insert(workstation);
    yield insertOrFailure.fold(
          (failure) => PresencesManagementActorState.actionFailure(failure),
          (workstation) => PresencesManagementActorState.insertSuccess(workstation),
    );
  }

  //perform multiple workstations insert and emit the result of the operation
  Stream<PresencesManagementActorState> _mapAddedMultipleToState(
      _AddedMultiple e) async* {
    final insertOrFailure = await _workstationRepository.insertAll(e.dates
        .map((date) => Workstation(
      idWorkstation: null,
      codeWorkstation: null,
      status: WORKSTATION_STATUS_CONFIRMED,
      startTime: e.timeSlot.toStartTime(),
      endTime: e.timeSlot.toEndTime(),
      workstationDate: date,
      idResource: e.idResource,
      freeName: e.freeName,
    ),)
        .toList());
    yield insertOrFailure.fold(
          (failure) => PresencesManagementActorState.actionFailure(failure),
          (workstations) =>
              PresencesManagementActorState.multipleInsertSuccess(workstations),
    );
  }

  //perform a workstation delete and emit the result of the operation
  Stream<PresencesManagementActorState> _mapRemovedEventToState(_Removed e) async* {
      final removeOrFailure =
      await _workstationRepository.delete(e.workstation.idWorkstation);
      yield removeOrFailure.fold(
            (failure) => PresencesManagementActorState.actionFailure(failure),
            (idWorkstation) => PresencesManagementActorState.deleteSuccess(idWorkstation),
      );
  }

  //perform a workstation update and emit the result of the operation
  Stream<PresencesManagementActorState> _mapUpdatedEventToState(_Updated e) async* {
      final updateOrFailure =
      await _workstationRepository.update(e.workstation);
      yield updateOrFailure.fold(
            (failure) => PresencesManagementActorState.actionFailure(failure),
            (workstation) => PresencesManagementActorState.updateSuccess(workstation),
      );
  }
}
