import 'package:dartz/dartz.dart';
import 'package:where_am_i/domain/entities/reservation.dart';
import 'package:where_am_i/domain/repositories/reservation_repository.dart';

import '../../core/error/failure.dart';
import '../../core/usecases/usecase.dart';

class GetReservations extends UseCase<List<Reservation>, DateTime> {
  final ReservationRepository reservationRepository;

  GetReservations(this.reservationRepository);

  Future<Either<Failure, List<Reservation>>> call(DateTime date) async {
    return await reservationRepository.getAllReservationsByDate(date);
  }
}
