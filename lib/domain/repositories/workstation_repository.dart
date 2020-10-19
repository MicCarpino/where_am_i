import 'package:dartz/dartz.dart';
import 'package:where_am_i/domain/entities/user_with_workstation.dart';
import 'package:where_am_i/domain/entities/workstation.dart';

import '../../core/error/failure.dart';

abstract class WorkstationRepository {
  Future<Either<Failure, List<Workstation>>> getAllWorkstationsByDate(
      DateTime date);

  Future<Either<Failure, List<Workstation>>> getAllWorkstationsByIdResource();

  Future<Either<Failure, List<Workstation>>> updateUserWorkstations(
      List<DateTime> userPresences);

  Future<Either<Failure, List<Workstation>>> insertWorkstation(
      Workstation workstation);

  Future<Either<Failure, Workstation>> updateWorkstation(
      Workstation updatedWorkstation);

  Future<Either<Failure, List<Workstation>>> deleteWorkstation(
      int idWorkstation);
}
