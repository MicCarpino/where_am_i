part of 'users_bloc.dart';

@immutable
abstract class UsersState {}

class UsersInitial extends UsersState {}

class UsersFetchErrorState extends UsersState {}

class UserFetchCompleteState extends UsersState {
  final List<User> usersList;

  UserFetchCompleteState(this.usersList);
}
