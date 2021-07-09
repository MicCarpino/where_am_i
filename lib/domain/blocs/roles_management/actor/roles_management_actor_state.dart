part of 'roles_management_actor_bloc.dart';

@freezed
abstract class RolesManagementActorState with _$RolesManagementActorState {
  const factory RolesManagementActorState.initial() = _Initial;

  const factory RolesManagementActorState.actionInProgress() =
      _ActionInProgress;

  const factory RolesManagementActorState.updateSuccess(User user) =
      _UpdateSuccess;

  const factory RolesManagementActorState.updateFailure(Failure failure) =
      _UpdateFailure;
}
