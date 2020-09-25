part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

//Drawer events
class OnHeaderImageLongClick{}

class OnLogoutButtonClick {}

class OnMyPresencesClick {}

class OnPresencesManagementClick {}

class OnUsersManagementClick {}

//Widgets events
class OnWorkstationClick {
  int idWorkstation;

  OnWorkstationClick({this.idWorkstation});
}

class OnWorkstationLongClick {
  int idWorkstation;

  OnWorkstationLongClick({this.idWorkstation});
}

class OnDateSelected {
  DateTime date;

  OnDateSelected({this.date});
}

class OnEventLongClick {}
