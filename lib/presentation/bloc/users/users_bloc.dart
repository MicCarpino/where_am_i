import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:where_am_i/core/error/failure.dart';
import 'package:where_am_i/core/usecases/usecase.dart';
import 'package:where_am_i/domain/entities/user.dart';
import 'package:where_am_i/domain/usecases/get_users.dart';
import 'package:where_am_i/presentation/bloc/workstation/workstation_bloc.dart';

part 'users_event.dart';

part 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  UsersBloc({@required GetAllUsers getUsers})
      : assert(getUsers != null),
        getUsers = getUsers,
        super(UsersInitial());

  final GetAllUsers getUsers;

  @override
  Stream<UsersState> mapEventToState(
    UsersEvent event,
  ) async* {
    if (event is FetchUsersList) {
      final usersList = await getUsers(NoParams());
      yield usersList.fold((failure) {
        print(
            'workstations fail : ${failure is ServerFailure ? failure.errorMessage : failure.toString()}');
        return UsersFetchErrorState();
      }, (users) {
        print('users : ${users.toList()}');
        return UserFetchCompleteState(users);
      });
    } else if(event is OnExternalUserAdded){

    }
  }
}
