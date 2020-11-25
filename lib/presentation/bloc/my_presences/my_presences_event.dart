part of 'my_presences_bloc.dart';

@immutable
abstract class MyPresencesEvent {}

class FetchCurrentUserPresences extends MyPresencesEvent {}

class OnCurrentUserPresencesUpdate extends MyPresencesEvent {
  final List<DateTime> updatedPresences;

  OnCurrentUserPresencesUpdate(this.updatedPresences);
}

class OnPresenceAdded extends MyPresencesEvent {
  final PresenceNewParameters newPresenceParams;

  OnPresenceAdded(this.newPresenceParams);
}

class OnPresenceRemoved extends MyPresencesEvent {
  final int idWorkstation;

  OnPresenceRemoved(this.idWorkstation);
}

class OnPresenceUpdate extends MyPresencesEvent {
  final Workstation workstationToUpdate;
  final PresenceNewParameters newPresenceParams;

  OnPresenceUpdate(this.workstationToUpdate,this.newPresenceParams);
}
