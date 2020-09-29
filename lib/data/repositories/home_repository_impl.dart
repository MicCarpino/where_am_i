import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:where_am_i/core/error/exceptions.dart';
import 'package:where_am_i/core/error/failure.dart';
import 'package:where_am_i/data/datasources/local_data_source.dart';
import 'package:where_am_i/data/datasources/remote_data_source.dart';
import 'package:where_am_i/domain/entities/reservation.dart';
import 'package:where_am_i/domain/entities/authenticated_user.dart';
import 'package:where_am_i/domain/entities/user.dart';
import 'package:where_am_i/domain/entities/workstation.dart';
import 'package:where_am_i/domain/repositories/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final RemoteDataSource remoteDataSource;
  final LocalDataSource localDataSource;

  HomeRepositoryImpl({
    @required this.remoteDataSource,
    @required this.localDataSource,
  });

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
      final logoutResult = await localDataSource.deleteLoggedUser();
      return Right(logoutResult);
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, List<Workstation>>> getWorkstations(
      DateTime date) async {
    try {
      var loggedUser = await localDataSource.getCachedUser();
      final workstationsList = await remoteDataSource.getWorkstations(
          loggedUser.authenticationToken, date);
      return Right(workstationsList);
    } on ServerException catch (error) {
      return Left(ServerFailure(error.errorMessage));
    }
  }

  @override
  Future<Either<Failure, List<Reservation>>> getReservations(
      DateTime date) async {
    try {
      var loggedUser = await localDataSource.getCachedUser();
      final reservationsList = await remoteDataSource.getReservations(
          loggedUser.authenticationToken, date);
      return Right(reservationsList);
    } on ServerException catch (error) {
      return Left(ServerFailure(error.errorMessage));
    }
  }

  @override
  Future<Either<Failure, List<User>>> getUsers() async {
    try {
      var loggedUser = await localDataSource.getCachedUser();
      final usersList =
          await remoteDataSource.getUsers(loggedUser.authenticationToken);
      return Right(usersList);
    } on ServerException catch (error) {
      return Left(ServerFailure(error.errorMessage));
    }
  }

}
