part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitialState extends HomeState {}

class HomeLoadingState extends HomeState {}

class ListsFetchCompletedState extends HomeState {
  final List<Workstation> workstationsList;

  ListsFetchCompletedState(this.workstationsList);
}

class ListsFetchErrorState extends HomeState {}

class HomeErrorState extends HomeState {
  final String errorMessage;

  HomeErrorState({this.errorMessage});
}

class LoggedOutState extends HomeState {}
