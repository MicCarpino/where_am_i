import 'package:dartz/dartz.dart';
import 'package:where_am_i/domain/entities/workstation.dart';

import '../../core/error/failure.dart';

abstract class WorkstationRepository {
  Future<Either<Failure, List<Workstation>>> getAllWorkstationsByDate(
      DateTime date);

  Future<Either<Failure, List<Workstation>>> getAllWorkstationsByIdResource(int idResource);

  List<Workstation> getCachedPresences();

  Future<Either<Failure, Workstation>> insertWorkstation(
      Workstation workstation);

  Future<Either<Failure, Workstation>> updateWorkstation(
      Workstation updatedWorkstation);

  Future<Either<Failure, int>> deleteWorkstation(
      int idWorkstation);
}
