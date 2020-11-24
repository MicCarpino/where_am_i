import 'package:dartz/dartz.dart';
import 'package:where_am_i/core/error/failure.dart';
import 'package:where_am_i/core/usecases/usecase.dart';
import 'package:where_am_i/domain/entities/workstation.dart';
import 'package:where_am_i/domain/repositories/workstation_repository.dart';

class UpdateUserPresence extends UseCase<Workstation, Workstation> {
  final WorkstationRepository _workstationRepository;

  UpdateUserPresence(this._workstationRepository);

  Future<Either<Failure, Workstation>> call(
      Workstation updatedWorkstation) async {
    return await _workstationRepository.updateWorkstation(updatedWorkstation);
  }
}
