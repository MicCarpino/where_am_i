import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:where_am_i/core/error/failure.dart';
import 'package:where_am_i/core/utils/enums.dart';
import 'package:where_am_i/domain/entities/user.dart';
import 'package:where_am_i/domain/entities/workstation.dart';
import 'package:where_am_i/domain/repositories/workstation_repository.dart';

part 'presences_management_actor_event.dart';

part 'presences_management_actor_state.dart';

part 'presences_management_actor_bloc.freezed.dart';

class PresencesManagementActorBloc
    extends Bloc<PresencesManagementActorEvent, PresencesManagementActorState> {
  PresencesManagementActorBloc(this._workstationRepository)
      : super(PresencesManagementActorState.initial());
  final WorkstationRepository _workstationRepository;

  @override
  Stream<PresencesManagementActorState> mapEventToState(
      PresencesManagementActorEvent event,) async* {
    yield const PresencesManagementActorState.actionInProgress();
    yield* event.map(
      added: (e) async* {},
      addedMultiple: (e) async* {},
      removed: (e) async* {},
      updated: (e) async* {},
      editRequested: (e) async* {},
    );
  }
}
