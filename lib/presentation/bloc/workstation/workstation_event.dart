part of 'workstation_bloc.dart';

@immutable
abstract class WorkstationEvent {}

class FetchWorkstationsLists extends WorkstationEvent {}

class OnWorkstationClick extends WorkstationEvent {
  final int idWorkstation;

  OnWorkstationClick({this.idWorkstation});
}

class OnWorkstationLongClick extends WorkstationEvent {
  final int idWorkstation;

  OnWorkstationLongClick({this.idWorkstation});
}