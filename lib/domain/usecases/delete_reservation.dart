import 'package:dartz/dartz.dart';
import 'package:where_am_i/domain/entities/reservation.dart';
import 'package:where_am_i/domain/repositories/reservation_repository.dart';

import '../../core/error/failure.dart';
import '../../core/usecases/usecase.dart';

class DeleteReservation extends UseCase<List<Reservation>, int> {
  final ReservationRepository _reservationRepository;

  DeleteReservation(this._reservationRepository);

  Future<Either<Failure, List<Reservation>>> call(
      int idReservation) async {
    return await _reservationRepository.deleteReservation(idReservation);
  }
}