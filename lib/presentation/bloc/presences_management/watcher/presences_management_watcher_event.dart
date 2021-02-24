part of 'presences_management_watcher_bloc.dart';

@freezed
abstract class PresencesManagementWatcherEvent
    with _$PresencesManagementWatcherEvent {
  const factory PresencesManagementWatcherEvent.getAllUsersPresencesByDate(
      DateTime date) = _GetUserPresences;

  const factory PresencesManagementWatcherEvent.presencesReceived(
      List<UserWithWorkstation> usersWithWorkstations,
      ) = _PresencesReceived;

  const factory PresencesManagementWatcherEvent.onFilterUpdated(
      String filterString) = _OnFilterUpdated;
}
