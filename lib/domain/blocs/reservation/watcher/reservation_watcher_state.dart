part of 'reservation_watcher_bloc.dart';

@freezed
abstract class ReservationWatcherState with _$ReservationWatcherState {
  const factory ReservationWatcherState.initial() = _Initial;

  const factory ReservationWatcherState.loadInProgress() = _LoadInProgress;

  const factory ReservationWatcherState.loadSuccess(
      List<Reservation> reservations) = _LoadSuccess;

  const factory ReservationWatcherState.loadFailure(String errorMessage) =
      _LoadFailure;
}
