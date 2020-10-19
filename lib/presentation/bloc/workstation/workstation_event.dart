part of 'workstation_bloc.dart';

@immutable
abstract class WorkstationEvent {}

class FetchWorkstationsLists extends WorkstationEvent {
  final DateTime dateToFetch;

  FetchWorkstationsLists({@required this.dateToFetch});
}

class OnWorkstationAssigned extends WorkstationEvent {
  final Workstation updatedWorkstation;
  final Workstation currentWorkstation;

  OnWorkstationAssigned({
    @required this.updatedWorkstation,
    @required this.currentWorkstation,
  });
}

class OnWorkstationLongClick extends WorkstationEvent {
  final int idWorkstation;

  OnWorkstationLongClick({this.idWorkstation});
}
