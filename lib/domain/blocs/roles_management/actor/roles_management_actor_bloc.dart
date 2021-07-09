import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:where_am_i/core/error/failure.dart';
import 'package:where_am_i/domain/entities/user.dart';
import 'package:where_am_i/domain/repositories/user_repository.dart';

part 'roles_management_actor_bloc.freezed.dart';

part 'roles_management_actor_event.dart';

part 'roles_management_actor_state.dart';

class RolesManagementActorBloc
    extends Bloc<RolesManagementActorEvent, RolesManagementActorState> {
  RolesManagementActorBloc(this._userRepository)
      : super(RolesManagementActorState.initial());

  final UserRepository _userRepository;

  @override
  Stream<RolesManagementActorState> mapEventToState(
    RolesManagementActorEvent event,
  ) async* {
    yield* event.map(
      onRoleUpdate: (e) async* {
        yield const RolesManagementActorState.actionInProgress();
        final updatedUserOrFailure = await _userRepository
            .updateUserRole(e.user.idResource, e.newRoleId);
        yield updatedUserOrFailure.fold(
          (failure) => RolesManagementActorState.updateFailure(failure),
          (updatedUser) => RolesManagementActorState.updateSuccess(updatedUser),
        );
      },
    );
  }
}
