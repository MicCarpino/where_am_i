part of 'workstation_watcher_bloc.dart';

@freezed
abstract class WorkstationWatcherEvent with _$WorkstationWatcherEvent {
  const factory WorkstationWatcherEvent.fetchPresences(DateTime date) = _FetchPresences;
  const factory WorkstationWatcherEvent.onPresencesUpdated(List<UserWithWorkstation> presences) = _OnPresencesUpdated;
}
