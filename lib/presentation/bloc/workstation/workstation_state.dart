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

class WorkstationUpdateStatusChanged extends WorkstationState {
  final bool isLoading;
  WorkstationUpdateStatusChanged({@required this.isLoading});
}

class WorkstationUpdateErrorState extends WorkstationState {
  final String errorMessage;

  WorkstationUpdateErrorState({@required this.errorMessage});
}
