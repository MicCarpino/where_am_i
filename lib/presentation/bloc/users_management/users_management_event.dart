part of 'users_management_bloc.dart';

@immutable
abstract class UsersManagementEvent {}

class OnUsersListFetchRequested extends UsersManagementEvent {}

class OnNewRoleAssigned extends UsersManagementEvent {
  final int roleAssigned;

  OnNewRoleAssigned({@required this.roleAssigned});
}

class OnUsersListFilterUpdated extends UsersManagementEvent {
  final String filterInput;

  OnUsersListFilterUpdated({@required this.filterInput});
}
