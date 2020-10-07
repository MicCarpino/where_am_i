part of 'presences_management_bloc.dart';

@immutable
abstract class PresencesManagementEvent {}

class OnExternalUserAdded extends PresencesManagementEvent {
  final Workstation externalUser;

  OnExternalUserAdded({@required this.externalUser});
}

class OnUsersPresencesFetchRequested extends PresencesManagementEvent {
  final DateTime dateToFetch;

  OnUsersPresencesFetchRequested({@required this.dateToFetch});
}

class OnUsersPresencesFilterUpdate extends PresencesManagementEvent {
  final String filterInput;

  OnUsersPresencesFilterUpdate({@required this.filterInput});
}
