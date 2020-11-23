part of 'my_presences_bloc.dart';

@immutable
abstract class MyPresencesEvent {}

class FetchCurrentUserPresences extends MyPresencesEvent {}

class OnCurrentUserPresencesUpdate extends MyPresencesEvent {
  final List<DateTime> updatedPresences;

  OnCurrentUserPresencesUpdate(this.updatedPresences);
}

class OnPresenceAdded extends MyPresencesEvent {
  final DateTime date;
  final TimeOfDay startTime;
  final TimeOfDay endTime;

  OnPresenceAdded(this.date, this.startTime, this.endTime);
}

class OnPresenceRemoved extends MyPresencesEvent {
  final int idWorkstation;

  OnPresenceRemoved(this.idWorkstation);
}
