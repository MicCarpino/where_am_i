import 'package:dartz/dartz.dart';
import 'package:where_am_i/domain/entities/reservation.dart';

import '../../core/error/failure.dart';

abstract class ReservationRepository {
  Future<Either<Failure, List<Reservation>>> getAllReservationsByDate(DateTime date);

  Future<Either<Failure, Reservation>> updateReservation(Reservation reservation);

  Future<Either<Failure, List<Reservation>>>insertReservation(Reservation reservation);

  Future<Either<Failure, void>> deleteReservation(int idReservation);

}
