import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:where_am_i/core/error/failure.dart';
import 'package:where_am_i/core/usecases/usecase.dart';
import 'package:where_am_i/domain/entities/user.dart';
import 'package:where_am_i/domain/usecases/get_users.dart';

part 'users_management_event.dart';

part 'users_management_state.dart';

class UsersManagementBloc
    extends Bloc<UsersManagementEvent, UsersManagementState> {
  final GetAllUsers getUsers;

  UsersManagementBloc({@required GetAllUsers getUsers})
      : assert(getUsers != null),
        getUsers = getUsers,
        super(UsersInitial());

  List<User> originalUsersList = List<User>();

  @override
  Stream<UsersManagementState> mapEventToState(
    UsersManagementEvent event,
  ) async* {
    if (event is OnUsersListFetchRequested) {
      yield* _fetchUsersList();
    }
    if (event is OnUsersListFilterUpdated) {
      yield* _applyFilterToList(event.filterInput);
    }
  }

  Stream<UsersManagementState> _fetchUsersList() async* {
    yield UsersListLoadingState();
    final usersList = await getUsers(NoParams());
    yield usersList.fold((failure) {
      print(
          'workstations fail : ${failure is ServerFailure ? failure.errorMessage : failure.toString()}');
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
}
