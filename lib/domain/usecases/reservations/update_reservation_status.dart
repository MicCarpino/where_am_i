import 'package:dartz/dartz.dart';
import 'package:where_am_i/core/error/failure.dart';
import 'package:where_am_i/core/usecases/usecase.dart';
import 'package:where_am_i/domain/entities/reservation.dart';
import 'package:where_am_i/domain/repositories/reservation_repository.dart';

class UpdateReservation extends UseCase<List<Reservation>, Reservation> {
  final ReservationRepository _reservationRepository;

  UpdateReservation(this._reservationRepository);

  Future<Either<Failure, List<Reservation>>> call(
      Reservation reservation) async {
    return await _reservationRepository.updateReservation(reservation);
  }
}
