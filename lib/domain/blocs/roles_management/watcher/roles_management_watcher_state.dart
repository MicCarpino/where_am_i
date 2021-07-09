part of 'roles_management_watcher_bloc.dart';

@freezed
abstract class RolesManagementWatcherState with _$RolesManagementWatcherState {
  const factory RolesManagementWatcherState.initial() = _Initial;

  const factory RolesManagementWatcherState.loadInProgress() = _LoadInProgress;

  const factory RolesManagementWatcherState.loadSuccess(List<User> users) =
      _LoadSuccess;

  const factory RolesManagementWatcherState.loadFailure() = _LoadFailure;

  const factory RolesManagementWatcherState.filteredList({
    @required String filter,
    @required List<User> filteredList,
  }) = _FilteredList;
}
