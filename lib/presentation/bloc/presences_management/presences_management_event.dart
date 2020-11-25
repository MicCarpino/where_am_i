part of 'presences_management_bloc.dart';

@immutable
abstract class PresencesManagementEvent {}

class OnExternalUserAdded extends PresencesManagementEvent {
  final PresenceNewParameters externalUserParams;

  OnExternalUserAdded({@required this.externalUserParams});
}

class OnUsersPresencesFetchRequested extends PresencesManagementEvent {
  final DateTime dateToFetch;

  OnUsersPresencesFetchRequested({@required this.dateToFetch});
}

class OnUsersPresencesFilterUpdate extends PresencesManagementEvent {
  final String filterInput;

  OnUsersPresencesFilterUpdate({@required this.filterInput});
}

class OnPresenceAddedByManagement extends PresencesManagementEvent {
  final PresenceNewParameters newPresenceParams;

  OnPresenceAddedByManagement(this.newPresenceParams);
}

class OnPresenceRemovedByManagement extends PresencesManagementEvent {
  final int idWorkstation;

  OnPresenceRemovedByManagement(this.idWorkstation);
}

class OnPresenceUpdatedByManagement extends PresencesManagementEvent {
  final Workstation workstationToUpdate;
  final PresenceNewParameters updatedPresenceParams;

  OnPresenceUpdatedByManagement(this.workstationToUpdate,this.updatedPresenceParams);
}
