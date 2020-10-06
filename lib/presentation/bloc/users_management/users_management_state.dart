part of 'users_management_bloc.dart';

@immutable
abstract class UsersManagementState {}

class UsersInitial extends UsersManagementState {}

class UsersFetchErrorState extends UsersManagementState {}

class UserFetchCompleteState extends UsersManagementState {
  final List<User> usersList;

  UserFetchCompleteState(this.usersList);
}
