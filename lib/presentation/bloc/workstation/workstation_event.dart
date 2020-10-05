part of 'workstation_bloc.dart';

@immutable
abstract class WorkstationEvent {}

class FetchWorkstationsLists extends WorkstationEvent {
  final DateTime dateToFetch;

  FetchWorkstationsLists({@required this.dateToFetch});
}

class OnWorkstationClick extends WorkstationEvent {
  final int idWorkstation;

  OnWorkstationClick({this.idWorkstation});
}

class OnWorkstationLongClick extends WorkstationEvent {
  final int idWorkstation;

  OnWorkstationLongClick({this.idWorkstation});
}

class FetchCurrentUserPresences extends WorkstationEvent {}

class FetchAllUserPresences extends WorkstationEvent {
  final DateTime dateToFetch;

  FetchAllUserPresences({@required this.dateToFetch});
}

class OnCurrentUserPresencesUpdate extends WorkstationEvent {
  final List<DateTime> updatedPresences;

  OnCurrentUserPresencesUpdate(this.updatedPresences);
}
