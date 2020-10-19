part of 'workstation_bloc.dart';

@immutable
abstract class WorkstationEvent {}

class FetchWorkstationsLists extends WorkstationEvent {
  final DateTime dateToFetch;

  FetchWorkstationsLists({@required this.dateToFetch});
}

class OnWorkstationAssigned extends WorkstationEvent {
  final Workstation updatedWorkstation;

  OnWorkstationAssigned({
    @required this.updatedWorkstation,
  });
}

class OnWorkstationLongClick extends WorkstationEvent {
  final int idWorkstation;

  OnWorkstationLongClick({this.idWorkstation});
}
