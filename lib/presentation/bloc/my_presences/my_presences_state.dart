part of 'my_presences_bloc.dart';

@immutable
abstract class MyPresencesState {}

class MyPresencesInitial extends MyPresencesState {}

class PresencesFetchCompletedState extends MyPresencesState {
  final List<Workstation> currentUserPresences;

  PresencesFetchCompletedState(this.currentUserPresences);
}

class PresencesFetchErrorState extends MyPresencesState {}

class PresencesErrorMessageState extends MyPresencesState {
  final String errorMessage;

  PresencesErrorMessageState(this.errorMessage);
}

class PresencesFetchLoadingState extends MyPresencesState {}
