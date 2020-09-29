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

  ReservationRepositoryImpl({
    @required this.remoteDataSource,
    @required this.localDataSource,
  });

  @override
  Future<Either<Failure, List<Reservation>>> getAllReservationsByDate(
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
  Future<Either<Failure, Reservation>> insertReservation(
      Reservation reservation) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Reservation>> updateReservation(
      Reservation reservation) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> deleteReservation(int idReservation) {
    throw UnimplementedError();
  }
}