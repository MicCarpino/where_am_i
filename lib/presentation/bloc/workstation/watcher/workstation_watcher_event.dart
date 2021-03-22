part of 'workstation_watcher_bloc.dart';

@freezed
abstract class WorkstationWatcherEvent with _$WorkstationWatcherEvent {
  const factory WorkstationWatcherEvent.fetchWorkstations(DateTime date) = _FetchWorkstations;
}
