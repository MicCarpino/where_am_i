part of 'presences_management_watcher_bloc.dart';

@freezed
abstract class PresencesManagementWatcherState
    with _$PresencesManagementWatcherState {
  const factory PresencesManagementWatcherState.initial() = _Initial;

  const factory PresencesManagementWatcherState.loadInProgress() =
      _LoadInProgress;

  const factory PresencesManagementWatcherState.loadSuccess(
    List<UserWithWorkstation> usersPending,
    List<UserWithWorkstation> usersConfirmed,
    List<UserWithWorkstation> usersRefusedOrAbsent,
  ) = _LoadSuccess;

  const factory PresencesManagementWatcherState.loadFailure() = _LoadFailure;

  const factory PresencesManagementWatcherState.filteredList( List<UserWithWorkstation> filteredPresences) = _FilteredList;
}
