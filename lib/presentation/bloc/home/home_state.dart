part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {}

class ListsFetchCompletedState extends HomeState {}

class ListsFetchErrorState extends HomeState {}

class HomeErrorState extends HomeState {
  final String errorMessage;

  HomeErrorState({this.errorMessage});
}

class LoggedOutState extends HomeState {}
