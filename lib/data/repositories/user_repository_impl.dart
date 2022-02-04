import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import 'package:where_am_i/core/error/exceptions.dart';
import 'package:where_am_i/core/error/failure.dart';
import 'package:where_am_i/data/datasources/local_data_source.dart';
import 'package:where_am_i/data/datasources/remote_data_source.dart';
import 'package:where_am_i/domain/entities/user.dart';
import 'package:where_am_i/domain/repositories/user_repository.dart';

// this repository take care of users data mediating between local and remote sources
class UserRepositoryImpl implements UserRepository {
  final RemoteDataSource remoteDataSource;
  final LocalDataSource localDataSource;

  UserRepositoryImpl({
    @required this.remoteDataSource,
    @required this.localDataSource,
  });

  //fetch all
  @override
  Future<Either<Failure, List<User>>> getAllUsers() async {
    try {
      var loggedUser = await localDataSource.getCachedUser();
      final usersList =
          await remoteDataSource.getUsers(loggedUser.authenticationToken);
      usersList.removeWhere((user) => user.surname?.toLowerCase() == "admin");

      usersList.sort((a, b) {
        if (a.surname != null && b.surname != null) {
          return a.surname.compareTo(b.surname);
        } else {
          return -1;
        }
      });
      return Right(usersList);
    } on ServerException catch (error) {
      return Left(ServerFailure(error.errorMessage));
    } on Exception catch (e) {
      return Left(UnexpectedFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, User>> updateUserRole(String idResource, int idRole) async {
    try {
      var loggedUser = await localDataSource.getCachedUser();
      final updateResult = await remoteDataSource.updateUserRole(
          loggedUser.authenticationToken, idResource, idRole);
      return Right(updateResult);
    } on ServerException catch (error) {
      return Left(ServerFailure(error.errorMessage));
    } on Exception catch (e) {
      return Left(UnexpectedFailure(e.toString()));
    }
  }
}
