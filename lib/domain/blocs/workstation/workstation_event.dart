part of 'workstation_bloc.dart';

@immutable
abstract class WorkstationEvent {}

class FetchWorkstationsLists extends WorkstationEvent {
  final DateTime dateToFetch;

  FetchWorkstationsLists({@required this.dateToFetch});
}

class OnSingleWorkstationUpdate extends WorkstationEvent {
  final Workstation workstation;

  OnSingleWorkstationUpdate({
    @required this.workstation,
  });
}

class OnMultipleWorkstationsUpdate  extends WorkstationEvent {
  final List<Workstation> updatedWorkstations;

  OnMultipleWorkstationsUpdate({
    @required this.updatedWorkstations,
  });
}
