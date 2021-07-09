part of 'roles_management_watcher_bloc.dart';

@freezed
abstract class RolesManagementWatcherEvent with _$RolesManagementWatcherEvent {
  const factory RolesManagementWatcherEvent.getAllUsers() = _GetAllUsers;

  const factory RolesManagementWatcherEvent.onFilterUpdate(
      {@required String filter}) = _OnFilterUpdate;

  const factory RolesManagementWatcherEvent.onListUpdate() = _OnListUpdate;
}
