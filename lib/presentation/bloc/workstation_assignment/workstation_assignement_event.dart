part of 'workstation_assignement_bloc.dart';

@immutable
abstract class WorkstationAssignmentEvent {}

class OnUserPresencesToEndOfMonthRequest extends WorkstationAssignmentEvent {
  final PresencesToEndOfMonthParameters presencesToEndOfMonthParameters;

  OnUserPresencesToEndOfMonthRequest({this.presencesToEndOfMonthParameters});
}
