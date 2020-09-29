import 'package:dartz/dartz.dart';
import 'package:where_am_i/domain/entities/reservation.dart';
import 'package:where_am_i/domain/entities/user.dart';
import 'package:where_am_i/domain/entities/workstation.dart';

import '../../core/error/failure.dart';
import '../entities/authenticated_user.dart';

abstract class HomeRepository {
  Future<Either<Failure, AuthenticatedUser>> getLoggedUser();

  Future<Either<Failure, void>> removeLoggedUser();

  Future<Either<Failure, List<Workstation>>> getWorkstations(DateTime date);

  Future<Either<Failure, List<Reservation>>> getReservations(DateTime date);

  Future<Either<Failure, List<User>>> getUsers();
}
