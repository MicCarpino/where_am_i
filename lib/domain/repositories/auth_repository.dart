import 'package:dartz/dartz.dart';

import '../../core/error/failure.dart';
import '../entities/authenticated_user.dart';

abstract class AuthRepository {
  Future<Either<Failure, AuthenticatedUser>> performUserAuthentication(
      String username, String password);

  Future<Either<Failure, AuthenticatedUser>> getLoggedUser();

  Future<Either<Failure, void>> removeLoggedUser();
}
