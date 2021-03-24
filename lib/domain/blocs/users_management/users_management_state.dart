part of 'users_management_bloc.dart';

@immutable
abstract class UsersManagementState {}

class UsersInitial extends UsersManagementState {}

class UsersListLoadingState extends UsersManagementState {}

class UsersListErrorState extends UsersManagementState {}

class UsersListReadyState extends UsersManagementState {
  final List<User> usersList;

  UsersListReadyState(this.usersList);
}

class UserUpdateErrorState extends UsersManagementState {
  final String errorMessage;
  UserUpdateErrorState({@required this.errorMessage});
}
