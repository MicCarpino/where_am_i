import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:where_am_i/core/error/failure.dart';
import 'package:where_am_i/core/usecases/usecase.dart';
import 'package:where_am_i/domain/entities/user.dart';

import '../repositories/login_repository.dart';

class GetAuthenticatedUser extends UseCase<User, Params> {
  final LoginRepository loginRepository;

  GetAuthenticatedUser(this.loginRepository);

  Future<Either<Failure, User>> call(Params params) async {
    return loginRepository.performUserAuthentication(
        params.username, params.password);
  }
}

class Params extends Equatable {
  final String username;
  final String password;

  Params({@required this.username, @required this.password});

  @override
  List<Object> get props => [username, password];
}
