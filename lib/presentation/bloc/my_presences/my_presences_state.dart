part of 'my_presences_bloc.dart';

@immutable
abstract class MyPresencesState {}

class MyPresencesInitial extends MyPresencesState {}

class CurrentUserPresencesFetchCompleted extends MyPresencesState {
  final List<Workstation> currentUserPresences;

  CurrentUserPresencesFetchCompleted(this.currentUserPresences);
}

class CurrentUserPresencesFetchErrorState extends MyPresencesState {}

class CurrentUserFetchLoadingState extends MyPresencesState {}
