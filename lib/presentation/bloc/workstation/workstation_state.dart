part of 'workstation_bloc.dart';

@immutable
abstract class WorkstationState {}

class WorkstationInitial extends WorkstationState {}

class WorkstationsFetchLoadingState extends WorkstationState {}

class WorkstationsFetchCompletedState extends WorkstationState {
  final List<Workstation> workstationsList;

  WorkstationsFetchCompletedState(this.workstationsList);
}

class WorkstationsFetchErrorState extends WorkstationState {}

class AllUsersPresencesFetchCompleted extends WorkstationState {
  final List<User> allUsersPresences;

  AllUsersPresencesFetchCompleted(this.allUsersPresences);
}
