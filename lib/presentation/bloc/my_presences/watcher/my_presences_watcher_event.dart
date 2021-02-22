part of 'my_presences_watcher_bloc.dart';

@freezed
abstract class MyPresencesWatcherEvent with _$MyPresencesWatcherEvent {
  const factory MyPresencesWatcherEvent.getUserPresences() = _GetUserPresences;

  const factory MyPresencesWatcherEvent.workstationsReceived() =
      _WorkstationsReceived;
}
