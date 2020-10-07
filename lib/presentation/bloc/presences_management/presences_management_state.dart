part of 'presences_management_bloc.dart';

@immutable
abstract class PresencesManagementState {}

class PresencesManagementInitial extends PresencesManagementState {}

class UsersPresencesLoadingState extends PresencesManagementState {}

class UserPresencesErrorState extends PresencesManagementState {}

class UsersPresencesReadyState extends PresencesManagementState {
  final List<User> allUsersPresences;

  UsersPresencesReadyState(this.allUsersPresences);
}
