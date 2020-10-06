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
  UsersManagementBloc({@required GetAllUsers getUsers})
      : assert(getUsers != null),
        getUsers = getUsers,
        super(UsersInitial());

  final GetAllUsers getUsers;

  @override
  Stream<UsersManagementState> mapEventToState(
      UsersManagementEvent event,) async* {
    if (event is FetchUsersList) {
      final usersList = await getUsers(NoParams());
      yield usersList.fold((failure) {
        print(
            'workstations fail : ${failure is ServerFailure ? failure
                .errorMessage : failure.toString()}');
        return UsersFetchErrorState();
      }, (users) {
        print('users : ${users.toList()}');
        return UserFetchCompleteState(users);
      });
    }
  }
}
