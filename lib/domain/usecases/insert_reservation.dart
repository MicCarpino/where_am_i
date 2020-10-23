import 'package:dartz/dartz.dart';
import 'package:where_am_i/domain/entities/reservation.dart';
import 'package:where_am_i/domain/repositories/reservation_repository.dart';

import '../../core/error/failure.dart';
import '../../core/usecases/usecase.dart';

class InsertReservation
    extends UseCase<List<Reservation>, Reservation> {
  final ReservationRepository _reservationRepository ;

  InsertReservation(this._reservationRepository);

  Future<Either<Failure, List<Reservation>>> call(
      Reservation reservation) async {
    return await _reservationRepository.insertReservation(
        reservation);
  }
}