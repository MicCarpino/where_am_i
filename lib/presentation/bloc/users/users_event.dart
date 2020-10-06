part of 'users_bloc.dart';

@immutable
abstract class UsersEvent {}

class FetchUsersList extends UsersEvent {}

class OnNewRoleAssigned extends UsersEvent {
  final int roleAssigned;

  OnNewRoleAssigned({@required this.roleAssigned});
}
