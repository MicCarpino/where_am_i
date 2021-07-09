part of 'roles_management_actor_bloc.dart';

@freezed
abstract class RolesManagementActorEvent with _$RolesManagementActorEvent {
  const factory RolesManagementActorEvent.onRoleUpdate(
    User user,
    int newRoleId,
  ) = _OnRoleUpdate;
}
