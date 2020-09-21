import 'package:dartz/dartz.dart';

import '../../core/error/failure.dart';
import '../entities/user.dart';

abstract class LoginRepository {
  Future<Either<Failure, User>> performUserAuthentication(String username, String password);
}