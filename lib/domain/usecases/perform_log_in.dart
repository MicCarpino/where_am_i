import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:where_am_i/core/error/failure.dart';
import 'package:where_am_i/core/usecases/usecase.dart';
import 'package:where_am_i/domain/entities/authenticated_user.dart';

import '../repositories/login_repository.dart';

class PerformLogIn extends UseCase<AuthenticatedUser, LoginParams> {
  final LoginRepository loginRepository;

  PerformLogIn(this.loginRepository);

  Future<Either<Failure, AuthenticatedUser>> call(LoginParams params) async {
    return loginRepository.performUserAuthentication(
      params.username,
      params.password,
    );
  }
}

class LoginParams extends Equatable {
  final String username;
  final String password;

  LoginParams({@required this.username, @required this.password});

  @override
  List<Object> get props => [username, password];
}
