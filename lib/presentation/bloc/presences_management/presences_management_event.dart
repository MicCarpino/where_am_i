part of 'presences_management_bloc.dart';

@immutable
abstract class PresencesManagementEvent {}

class OnExternalUserAdded extends PresencesManagementEvent {
  final Workstation externalUser;

  OnExternalUserAdded({@required this.externalUser});
}

class FetchAllUserPresences extends PresencesManagementEvent {
  final DateTime dateToFetch;

  FetchAllUserPresences({@required this.dateToFetch});
}