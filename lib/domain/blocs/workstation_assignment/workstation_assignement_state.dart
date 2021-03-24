part of 'workstation_assignement_bloc.dart';

@immutable
abstract class WorkstationAssignementState {}

class WorkstationAssignementInitial extends WorkstationAssignementState {}

class PresencesToEndOfMonthLoadingState extends WorkstationAssignementState {}
class PresencesToEndOfMonthCompleteState extends WorkstationAssignementState {
  final List<Workstation> presencesToEndOfMonth;
  PresencesToEndOfMonthCompleteState(this.presencesToEndOfMonth);
}
class PresencesToEndOfMonthErrorState extends WorkstationAssignementState {}
