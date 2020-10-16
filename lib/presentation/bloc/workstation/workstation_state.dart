part of 'workstation_bloc.dart';

@immutable
abstract class WorkstationState {}

class WorkstationInitial extends WorkstationState {}

class WorkstationsFetchLoadingState extends WorkstationState {}

class WorkstationsFetchCompletedState extends WorkstationState {
  final List<UserWithWorkstation> usersWithWorkstations;

  WorkstationsFetchCompletedState(this.usersWithWorkstations);
}

class WorkstationsFetchErrorState extends WorkstationState {}

