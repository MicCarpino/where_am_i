import 'package:dartz/dartz.dart';
import 'package:where_am_i/core/usecases/usecase.dart';
import 'package:where_am_i/domain/entities/workstation.dart';

import '../../core/error/failure.dart';

abstract class WorkstationRepository {
  Future<Either<Failure, List<Workstation>>> getAllWorkstationsByDate(
      DateTime date);

  Future<Either<Failure, List<Workstation>>> getAllWorkstationsByIdResource(
      int idResource);

  Future<Either<Failure, List<Workstation>>>
      getAllWorkstationsByIdResourceToEndOfMonth(
          String idResource, String date);

  List<Workstation> getCachedPresences();

  Future<Either<Failure, Workstation>> insertWorkstation(
      Workstation workstation);

  Future<Either<Failure, Workstation>> updateWorkstation(
      Workstation updatedWorkstation);

  Future<Either<Failure, List<Workstation>>> updateAllWorkstations(
      List<Workstation> updatedWorkstations);

  Future<Either<Failure, int>> deleteWorkstation(int idWorkstation);

  Future<Either<Failure, Workstation>> updateWorkstationStatus(
      WorkstationStatusParameters workstationStatusParameters);

  Future<Either<Failure, List<Workstation>>> insertAllWorkstations(
      List<Workstation> newWorkstations);
}
