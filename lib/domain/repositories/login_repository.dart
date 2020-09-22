import 'package:dartz/dartz.dart';
import 'package:where_am_i/core/usecases/usecase.dart';

import '../../core/error/failure.dart';
import '../entities/user.dart';

abstract class LoginRepository {
  Future<Either<Failure, User>> performUserAuthentication(String username, String password);
  Future<Either<Failure, User>> isUserLogged();
}