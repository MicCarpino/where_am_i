part of 'presences_management_bloc.dart';

@immutable
abstract class PresencesManagementState {}

class PresencesManagementInitial extends PresencesManagementState {}

class PresencesManagementFetchCompletedState extends PresencesManagementState {
  final List<UserWithWorkstation> allUsersPresences;

  PresencesManagementFetchCompletedState(this.allUsersPresences);
}

class PresencesManagementFetchErrorState extends PresencesManagementState {}

class PresencesManagementErrorMessageState extends PresencesManagementState {
  final String errorMessage;

  PresencesManagementErrorMessageState(this.errorMessage);
}

class PresencesManagementFetchLoadingState extends PresencesManagementState {}
