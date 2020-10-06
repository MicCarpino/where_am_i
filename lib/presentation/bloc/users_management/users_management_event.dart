part of 'users_management_bloc.dart';

@immutable
abstract class UsersManagementEvent {}

class FetchUsersList extends UsersManagementEvent {}

class OnNewRoleAssigned extends UsersManagementEvent {
  final int roleAssigned;

  OnNewRoleAssigned({@required this.roleAssigned});
}
