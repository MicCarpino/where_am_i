import 'package:dartz/dartz.dart';
import 'package:where_am_i/core/usecases/usecase.dart';
import 'package:where_am_i/domain/entities/workstation.dart';

import '../../core/error/failure.dart';

abstract class WorkstationRepository {
  Future<Either<Failure, List<Workstation>>> getAllByDate(DateTime date);

  Future<Either<Failure, List<Workstation>>> getAllForCurrentUser();

  Future<Either<Failure, List<Workstation>>> getAllByIdResourceToEndOfMonth(
      String idResource, String date);

  Future<Either<Failure, Workstation>> insert(Workstation workstation);

  Future<Either<Failure, List<Workstation>>> insertAll(
      List<Workstation> newWorkstations);

  Future<Either<Failure, Workstation>> update(Workstation updatedWorkstation);

  Future<Either<Failure, List<Workstation>>> updateAll(
      List<Workstation> updatedWorkstations);

  Future<Either<Failure, Workstation>> updateStatus(
      WorkstationStatusParameters workstationStatusParameters);

  Future<Either<Failure, int>> delete(int idWorkstation);

}
