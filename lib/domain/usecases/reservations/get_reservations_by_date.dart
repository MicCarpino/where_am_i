import 'package:dartz/dartz.dart';
import 'package:where_am_i/core/error/failure.dart';
import 'package:where_am_i/core/usecases/usecase.dart';
import 'package:where_am_i/domain/entities/reservation.dart';
import 'package:where_am_i/domain/repositories/reservation_repository.dart';


class GetReservationsByDate extends UseCase<List<Reservation>, DateTime> {
  final ReservationRepository _reservationRepository;

  GetReservationsByDate(this._reservationRepository);

  Future<Either<Failure, List<Reservation>>> call(DateTime date) async {
    return await _reservationRepository.getAllReservationsByDate(date);
  }
}
