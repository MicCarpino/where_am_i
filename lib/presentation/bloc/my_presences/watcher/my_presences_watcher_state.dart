part of 'my_presences_watcher_bloc.dart';

@freezed
abstract class MyPresencesWatcherState with _$MyPresencesWatcherState {
  const factory MyPresencesWatcherState.initial() = _Initial;
  const factory MyPresencesWatcherState.loadInProgress() = _LoadInProgress;
  const factory MyPresencesWatcherState.loadSuccess(List<Workstation> presences) = _LoadSuccess;
  const factory MyPresencesWatcherState.loadFailure(Failure failure) = _LoadFailure;
}
