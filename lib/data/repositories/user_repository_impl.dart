import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import 'package:where_am_i/core/error/exceptions.dart';
import 'package:where_am_i/core/error/failure.dart';
import 'package:where_am_i/data/datasources/local_data_source.dart';
import 'package:where_am_i/data/datasources/remote_data_source.dart';
import 'package:where_am_i/domain/entities/user.dart';
import 'package:where_am_i/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final RemoteDataSource remoteDataSource;
  final LocalDataSource localDataSource;

  static var cachedUsersList = List<User>();

  UserRepositoryImpl({
    @required this.remoteDataSource,
    @required this.localDataSource,
  });

  @override
  Future<Either<Failure, List<User>>> getAllUsers() async {
    if (cachedUsersList.isNotEmpty) {
      return Right(cachedUsersList);
    }
    try {
      var loggedUser = await localDataSource.getCachedUser();
      final usersList =
          await remoteDataSource.getUsers(loggedUser.authenticationToken);
      usersList.removeWhere((user) => user.surname.toLowerCase() == "admin");
      usersList.sort((a, b) => a.surname.compareTo(b.surname));
      cachedUsersList = usersList;
      return Right(cachedUsersList);
    } on ServerException catch (error) {
      return Left(ServerFailure(error.errorMessage));
    }
  }

  @override
  Future<Either<Failure, List<User>>> updateUser(User updatedUser) async {
    throw UnimplementedError();
    try {
      var loggedUser = await localDataSource.getCachedUser();
      var userUpdateResult = await remoteDataSource.updateUser(
          loggedUser.authenticationToken, updatedUser);
      var oldUserIndex = cachedUsersList.indexWhere(
          (element) => element.idResource == userUpdateResult.idResource);
      cachedUsersList[oldUserIndex] = userUpdateResult;
      return Right(cachedUsersList);
    } on ServerException catch (error) {
      return Left(ServerFailure(error.errorMessage));
    }
  }
}
