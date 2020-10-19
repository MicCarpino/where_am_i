import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:where_am_i/core/error/failure.dart';
import 'package:where_am_i/core/usecases/usecase.dart';
import 'package:where_am_i/domain/entities/user.dart';
import 'package:where_am_i/domain/usecases/get_users.dart';
import 'package:where_am_i/domain/usecases/update_user.dart';

part 'users_management_event.dart';

part 'users_management_state.dart';

class UsersManagementBloc
    extends Bloc<UsersManagementEvent, UsersManagementState> {
  final GetAllUsers _getUsers;
  final UpdateUser _updateUser;

  UsersManagementBloc({
    @required GetAllUsers getUsers,
    @required UpdateUser updateUser,
  })  : assert(getUsers != null),
        assert(updateUser != null),
        _getUsers = getUsers,
        _updateUser = updateUser,
        super(UsersInitial());

  List<User> originalUsersList = List<User>();

  @override
  Stream<UsersManagementState> mapEventToState(
    UsersManagementEvent event,
  ) async* {
    if (event is OnUsersListFetchRequested) {
      yield* _fetchUsersList();
    } else if (event is OnUsersListFilterUpdated) {
      yield* _applyFilterToList(event.filterInput);
    } else if (event is OnNewRoleAssigned) {
     yield* _updateUserRole(event.userUpdated);
    }
  }

  Stream<UsersManagementState> _fetchUsersList() async* {
    yield UsersListLoadingState();
    final usersList = await _getUsers(NoParams());
    yield usersList.fold((failure) {
      print(
          'user list fail : ${failure is ServerFailure ? failure.errorMessage : failure.toString()}');
      return UsersListErrorState();
    }, (users) {
      print('users : ${users.toList()}');
      originalUsersList = users;
      return UsersListReadyState(users);
    });
  }

  Stream<UsersManagementState> _applyFilterToList(String filterInput) async* {
    if (filterInput.isEmpty) {
      yield UsersListReadyState(originalUsersList);
    } else {
      var filteredList = originalUsersList
          .where((user) =>
              user.name.toLowerCase().contains(filterInput.toLowerCase()) ||
              user.surname.toLowerCase().contains(filterInput.toLowerCase()))
          .toList();
      yield UsersListReadyState(filteredList);
    }
  }

  Stream<UsersManagementState> _updateUserRole(User updatedUser) async*{
    var updatedUsersList = await _updateUser(updatedUser);
    yield updatedUsersList.fold((failure) {
      print(          'update user fail : ${failure is ServerFailure ? failure.errorMessage : failure.toString()}');
       return UserUpdateErrorState();
    }, (users) {
      originalUsersList = users;
      return UsersListReadyState(users);
    });
  }
}
