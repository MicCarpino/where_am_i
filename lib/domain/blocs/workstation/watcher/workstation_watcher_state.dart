part of 'workstation_watcher_bloc.dart';

@freezed
abstract class WorkstationWatcherState with _$WorkstationWatcherState {
  const factory WorkstationWatcherState.initial() = _Initial;

  const factory WorkstationWatcherState.loadInProgress() = _LoadInProgress;

  const factory WorkstationWatcherState.loadSuccess(
      List<UserWithWorkstation> usersWithWorkstations) = _LoadSuccess;

  const factory WorkstationWatcherState.loadFailure(
      String errorMessage) = _LoadFailure;
}
