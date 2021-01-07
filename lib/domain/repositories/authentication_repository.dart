import 'package:dartz/dartz.dart';
import 'package:where_am_i/core/error/failure.dart';
import 'package:where_am_i/data/repositories/auth_repository_impl.dart';
import 'package:where_am_i/domain/entities/authenticated_user.dart';

abstract class AuthenticationRepository {
  Future<Either<Failure, AuthenticatedUser>> performUserAuthentication(
      String username, String password);

  Future<Either<Failure, AuthenticatedUser>> getLoggedUser();

  void removeLoggedUser();

  Stream<AuthenticationStatus> get status;

  void dispose();

  void storeCredentials(String username, String password);

  void removeStoredCredentials();
}
