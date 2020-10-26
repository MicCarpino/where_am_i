import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import 'package:where_am_i/core/error/exceptions.dart';
import 'package:where_am_i/core/error/failure.dart';
import 'package:where_am_i/data/datasources/local_data_source.dart';
import 'package:where_am_i/data/datasources/remote_data_source.dart';
import 'package:where_am_i/domain/entities/reservation.dart';
import 'package:where_am_i/domain/repositories/reservation_repository.dart';

class ReservationRepositoryImpl implements ReservationRepository {
  final RemoteDataSource remoteDataSource;
  final LocalDataSource localDataSource;

  static var cachedReservationList = List<Reservation>();

  ReservationRepositoryImpl({
    @required this.remoteDataSource,
    @required this.localDataSource,
  });

  @override
  Future<Either<Failure, List<Reservation>>> getAllReservationsByDate(
      DateTime date) async {
    try {
      var loggedUser = await localDataSource.getCachedUser();
      final reservationsList = await remoteDataSource.getAllReservationsByDate(
          loggedUser.authenticationToken, date);
      cachedReservationList = reservationsList;
      return Right(reservationsList);
    } on ServerException catch (error) {
      return Left(ServerFailure(error.errorMessage));
    }
  }

  @override
  Future<Either<Failure, List<Reservation>>> insertReservation(
      Reservation reservation) async {
    try {
      var loggedUser = await localDataSource.getCachedUser();
      final insertResult = await remoteDataSource.insertReservation(
          loggedUser.authenticationToken, reservation.toReservationModel());
      cachedReservationList.add(insertResult);
      return Right(cachedReservationList);
    } on ServerException catch (error) {
      return Left(ServerFailure(error.errorMessage));
    }
  }

  @override
  Future<Either<Failure, List<Reservation>>> updateReservation(
      Reservation reservation) async {
    try {
      var loggedUser = await localDataSource.getCachedUser();
      final updateResult = await remoteDataSource.updateReservation(
          loggedUser.authenticationToken, reservation.toReservationModel());
      var indexOfUpdatedReservation = cachedReservationList.indexWhere(
              (element) => element.idReservation == updateResult.idReservation);
      cachedReservationList[indexOfUpdatedReservation] = updateResult;
      return Right(cachedReservationList);
    } on ServerException catch (error) {
      return Left(ServerFailure(error.errorMessage));
    }
  }

  @override
  Future<Either<Failure, List<Reservation>>> deleteReservation(
      int idReservation) async {
    try {
      var loggedUser = await localDataSource.getCachedUser();
      await remoteDataSource.deleteReservation(
          loggedUser.authenticationToken, idReservation);
      cachedReservationList
          .removeWhere((element) => element.idReservation == idReservation);
      return Right(cachedReservationList);
    } on ServerException catch (error) {
      return Left(ServerFailure(error.errorMessage));
    }
  }
}
