import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:where_am_i/core/error/failure.dart';
import 'package:where_am_i/domain/entities/workstation.dart';
import 'package:where_am_i/domain/repositories/workstation_repository.dart';

part 'workstation_actor_event.dart';

part 'workstation_actor_state.dart';

part 'workstation_actor_bloc.freezed.dart';

class WorkstationActorBloc
    extends Bloc<WorkstationActorEvent, WorkstationActorState> {
  WorkstationActorBloc({@required this.workstationRepository})
      : super(WorkstationActorState.initial());
  final WorkstationRepository workstationRepository;

  @override
  Stream<WorkstationActorState> mapEventToState(
    WorkstationActorEvent event,
  ) async* {
    event.map(
      update: (value) async* {
        yield WorkstationActorState.actionInProgress();
        final updateResult =
            await workstationRepository.update(value.workstation);
        yield updateResult.fold(
          (failure) => WorkstationActorState.actionFailure(failure),
          (workstation) => WorkstationActorState.updateSuccess(workstation),
        );
      },
      multipleUpdates: (value) async* {
        yield WorkstationActorState.actionInProgress();
        final updateResult =
            await workstationRepository.updateAll(value.updatedWorkstations);
        yield updateResult.fold(
          (failure) => WorkstationActorState.actionFailure(failure),
          (workstations) =>
              WorkstationActorState.multipleUpdateSuccess(workstations),
        );
      },
    );
  }
}
