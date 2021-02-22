import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';
import 'package:where_am_i/core/error/failure.dart';
import 'package:where_am_i/core/utils/constants.dart';
import 'package:where_am_i/domain/entities/workstation.dart';
import 'package:where_am_i/domain/repositories/workstation_repository.dart';
import 'package:where_am_i/presentation/bloc/authentication/authentication_bloc.dart';

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
    yield* event.map(
      added: (e) async* {
        final currentUserId =
            getIt<AuthenticationBloc>().state.authenticatedUser.user.idResource;
        yield const MyPresencesActorState.actionInProgress();
        Workstation workstation = Workstation(
          idWorkstation: null,
          codeWorkstation: null,
          status: WORKSTATION_STATUS_PENDING,
          startTime: TIME_SLOT_NINE,
          endTime: TIME_SLOT_EIGHTEEN,
          workstationDate: e.date,
          idResource: currentUserId,
        );
        final insertOrFailure =
            await _workstationRepository.insert(workstation);
        yield insertOrFailure.fold(
          (failure) => MyPresencesActorState.insertFailure(failure),
          (workstation) => MyPresencesActorState.insertSuccess(workstation),
        );
      },
      removed: (e) async* {
        if (e.workstation.status != WORKSTATION_STATUS_PENDING) {
          yield MyPresencesActorState.deleteFailure(
            UnexpectedFailure(WORKSTATION_EDIT_FORBIDDEN_ERROR),
          );
        } else {
          yield const MyPresencesActorState.actionInProgress();
          final removeOrFailure =
              await _workstationRepository.delete(e.workstation.idWorkstation);
          yield removeOrFailure.fold(
            (failure) => MyPresencesActorState.deleteFailure(failure),
            (idWorkstation) =>
                MyPresencesActorState.deleteSuccess(idWorkstation),
          );
        }
      },
      updated: (e) async* {
        if (e.workstation.status != WORKSTATION_STATUS_PENDING) {
          yield MyPresencesActorState.deleteFailure(
            UnexpectedFailure(WORKSTATION_EDIT_FORBIDDEN_ERROR),
          );
        } else {
          yield const MyPresencesActorState.actionInProgress();
          final removeOrFailure =
              await _workstationRepository.update(e.workstation);
          yield removeOrFailure.fold(
            (failure) => MyPresencesActorState.updateFailure(failure),
            (workstation) => MyPresencesActorState.updateSuccess(workstation),
          );
        }
      },
      editRequested: (e) async* {
        //TODO: fix this
        yield const MyPresencesActorState.actionInProgress();
      },
    );
  }
}
