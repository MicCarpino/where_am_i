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

  UserRepositoryImpl({
    @required this.remoteDataSource,
    @required this.localDataSource,
  });

  @override
  Future<Either<Failure, List<User>>> getAllUsers() async {
    try {
      var loggedUser = await localDataSource.getCachedUser();
      final usersList =
          await remoteDataSource.getUsers(loggedUser.authenticationToken);
      return Right(usersList);
    } on ServerException catch (error) {
      return Left(ServerFailure(error.errorMessage));
    }
  }

  @override
  Future<Either<Failure, User>> updateUser(User user) {
    throw UnimplementedError();
  }
}
