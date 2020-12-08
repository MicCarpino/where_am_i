part of 'workstation_bloc.dart';

@immutable
abstract class WorkstationEvent {}

class FetchWorkstationsLists extends WorkstationEvent {
  final DateTime dateToFetch;

  FetchWorkstationsLists({@required this.dateToFetch});
}

class OnWorkstationUpdate extends WorkstationEvent {
  final Workstation workstation;

  OnWorkstationUpdate({
    @required this.workstation,
  });
}

class OnMultipleWorkstationsUpdate  extends WorkstationEvent {
  final List<Workstation> updatedWorkstations;

  OnMultipleWorkstationsUpdate({
    @required this.updatedWorkstations,
  });
}

class OnWorkstationLongClick extends WorkstationEvent {
  final int idWorkstation;

  OnWorkstationLongClick({this.idWorkstation});
}

class GetLastWorkstationsList extends WorkstationEvent {}