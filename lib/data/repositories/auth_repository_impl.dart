import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import 'package:where_am_i/core/error/exceptions.dart';
import 'package:where_am_i/core/error/failure.dart';
import 'package:where_am_i/data/datasources/local_data_source.dart';
import 'package:where_am_i/data/datasources/remote_data_source.dart';
import 'package:where_am_i/domain/entities/authenticated_user.dart';
import 'package:where_am_i/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final RemoteDataSource remoteDataSource;
  final LocalDataSource localDataSource;

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
      return Right(loggedUser);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMessage));
    } catch (e){
      return Left(UnexpectedFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, AuthenticatedUser>> getLoggedUser() async {
    try {
      final cachedUser = await localDataSource.getCachedUser();
      return Right(cachedUser);
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, void>> removeLoggedUser() async {
    try {
      final result = await localDataSource.deleteLoggedUser();
      return Right(result);
    } on CacheException {
      return Left(CacheFailure());
    }
  }
}
