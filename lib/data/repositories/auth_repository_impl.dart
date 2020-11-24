import 'package:dartz/dartz.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';

import 'package:where_am_i/core/error/exceptions.dart';
import 'package:where_am_i/core/error/failure.dart';
import 'package:where_am_i/data/datasources/local_data_source.dart';
import 'package:where_am_i/data/datasources/remote_data_source.dart';
import 'package:where_am_i/data/user_service.dart';
import 'package:where_am_i/domain/entities/authenticated_user.dart';
import 'package:where_am_i/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final RemoteDataSource remoteDataSource;
  final LocalDataSource localDataSource;
  final serviceLocator = GetIt.instance;

  AuthRepositoryImpl({
    @required this.remoteDataSource,
    @required this.localDataSource,
  });

  @override
  Future<Either<Failure, AuthenticatedUser>> performUserAuthentication(
      String username, String password) async {
    try {
      final loggedUser =
          await remoteDataSource.performUserAuthentication(username, password);
      localDataSource.cacheLoggedUser(loggedUser);
     // serviceLocator.registerSingleton(UserService());
      serviceLocator<UserService>().setLoggedUser(loggedUser.user);
      return Right(loggedUser);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMessage));
    } on Exception catch (e) {
      return Left(UnexpectedFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, AuthenticatedUser>> getLoggedUser() async {
    try {
      final cachedUser = await localDataSource.getCachedUser();
     // serviceLocator.registerSingleton(UserService());
      serviceLocator<UserService>().setLoggedUser(cachedUser.user);
      return Right(cachedUser);
    } on CacheException {
      return Left(CacheFailure());
    } on Exception catch (e) {
      return Left(UnexpectedFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> removeLoggedUser() async {
    try {
      final result = await localDataSource.deleteLoggedUser();
      serviceLocator<UserService>().removeLoggedUser();
      return Right(result);
    } on CacheException {
      return Left(CacheFailure());
    } on Exception catch (e) {
      return Left(UnexpectedFailure(e.toString()));
    }
  }
}
