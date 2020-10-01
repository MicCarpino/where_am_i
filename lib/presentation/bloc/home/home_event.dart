part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

//Drawer events
class OnHeaderImageLongClick extends HomeEvent {}

class OnLogoutButtonClick extends HomeEvent {}

//Widgets events
class OnNewDate extends HomeEvent {
  final DateTime date;

  OnNewDate({this.date});
}

class OnEventLongClick {}
