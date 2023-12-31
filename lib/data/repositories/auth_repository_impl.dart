import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'package:dartz/dartz.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:where_am_i/core/error/exceptions.dart';
import 'package:where_am_i/core/error/failure.dart';
import 'package:where_am_i/core/utils/aes_utils.dart';
import 'package:where_am_i/data/datasources/local_data_source.dart';
import 'package:where_am_i/data/datasources/remote_data_source.dart';
import 'package:where_am_i/domain/entities/authenticated_user.dart';
import 'package:where_am_i/domain/repositories/authentication_repository.dart';

enum AuthenticationStatus { unknown, authenticated, unauthenticated }

// this repository take care of app authentication mediating between local and remote sources
class AuthRepositoryImpl implements AuthenticationRepository {
  final RemoteDataSource remoteDataSource;
  final LocalDataSource localDataSource;
  final serviceLocator = GetIt.instance;

  final _controller = StreamController<AuthenticationStatus>();

  AuthRepositoryImpl({
    @required this.remoteDataSource,
    @required this.localDataSource,
  });

  //stream which propagate authentication status changes to the authentication bloc
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
      //password must be encrypted before being submitted
      final encryptedPassword = AesUtils().cryptPassword(password);
      //login api call
      final loggedUser = await remoteDataSource.performUserAuthentication(
          username, encryptedPassword);
      //login success, store the user object and emit the authenticated state
      localDataSource.cacheLoggedUser(loggedUser);
      _controller.add(AuthenticationStatus.authenticated);
      return Right(loggedUser);
    } on ServerException catch (e) {
      //error from server not related to credentials validation
      return Left(ServerFailure(e.errorMessage));
    } on UnauthorizedException catch (_) {
      //authorization error
      return Left(UnexpectedFailure("Credenziali errate"));
    } on Exception catch (e) {
      //some other error occured
      return Left(UnexpectedFailure(e.toString()));
    }
  }

  //retrieve logged user stored on device
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

  //remove loged user from device storage
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

  //crypt and save credentials on device
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

  //remove credentials stored on device
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
