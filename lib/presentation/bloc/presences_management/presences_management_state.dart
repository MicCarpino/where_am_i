part of 'presences_management_bloc.dart';

@immutable
abstract class PresencesManagementState {}

class PresencesManagementInitial extends PresencesManagementState {}

class UsersPresencesFetchLoadingState extends PresencesManagementState {}

class UserPresencesFetchErrorState extends PresencesManagementState {}

class AllUsersPresencesFetchCompleted extends PresencesManagementState {
  final List<User> allUsersPresences;

  AllUsersPresencesFetchCompleted(this.allUsersPresences);
}
