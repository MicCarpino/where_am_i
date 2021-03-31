import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:where_am_i/core/error/exceptions.dart';
import 'package:where_am_i/core/error/failure.dart';
import 'package:where_am_i/data/datasources/local_data_source.dart';
import 'package:where_am_i/data/datasources/remote_data_source.dart';
import 'package:where_am_i/domain/entities/authenticated_user.dart';
import 'package:where_am_i/domain/repositories/authentication_repository.dart';

enum AuthenticationStatus { unknown, authenticated, unauthenticated }

class AuthRepositoryImpl implements AuthenticationRepository {
  final RemoteDataSource remoteDataSource;
  final LocalDataSource localDataSource;
  final serviceLocator = GetIt.instance;

  final _controller = StreamController<AuthenticationStatus>();

  AuthRepositoryImpl({
    @required this.remoteDataSource,
    @required this.localDataSource,
  });

  Stream<AuthenticationStatus> get status async* {
    await Future<void>.delayed(const Duration(seconds: 1));
    final cachedUser = await localDataSource.getCachedUser();
    yield cachedUser != null
        ? AuthenticationStatus.authenticated
        : AuthenticationStatus.unauthenticated;
    yield* _controller.stream;
  }

  @override
  Future<Either<Failure, AuthenticatedUser>> performUserAuthentication(
      String username, String password) async {
    try {
      final loggedUser =
          await remoteDataSource.performUserAuthentication(username, password);
      localDataSource.cacheLoggedUser(loggedUser);
      _controller.add(AuthenticationStatus.authenticated);
      return Right(loggedUser);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMessage));
    } on UnauthorizedException catch (_) {
      return Left(UnexpectedFailure("Credenziali errate"));
    } on Exception catch (e) {
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
    } on Exception catch (e) {
      return Left(UnexpectedFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> removeLoggedUser() async {
    try {
      final result = await localDataSource.deleteLoggedUser();
      _controller.add(AuthenticationStatus.unauthenticated);
      return Right(result);
    } on CacheException {
      return Left(CacheFailure());
    } on Exception catch (e) {
      return Left(UnexpectedFailure(e.toString()));
    }
  }

  void dispose() => _controller.close();

  @override
  Future<Either<Failure, void>> storeCredentials(
      String username, String password) async {
    try {
      final result = await localDataSource.storeCredentials(username, password);
      return Right(result);
    } on CacheException {
      return Left(CacheFailure());
    } on Exception catch (e) {
      return Left(UnexpectedFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> removeStoredCredentials() async {
    try {
      final result = await localDataSource.removeStoredCredentials();
      return Right(result);
    } on CacheException {
      return Left(CacheFailure());
    } on Exception catch (e) {
      return Left(UnexpectedFailure(e.toString()));
    }
  }
}
