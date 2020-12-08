import 'package:dartz/dartz.dart';
import 'package:where_am_i/core/error/failure.dart';
import 'package:where_am_i/core/usecases/usecase.dart';
import 'package:where_am_i/domain/entities/workstation.dart';
import 'package:where_am_i/domain/repositories/workstation_repository.dart';

class UpdateAllWorkstations extends UseCase<List<Workstation>, List<Workstation>> {
  final WorkstationRepository _workstationRepository;

  UpdateAllWorkstations(this._workstationRepository);

  Future<Either<Failure, List<Workstation>>> call(List<Workstation> updatedWorkstation) async {
    return await _workstationRepository.updateAllWorkstations(updatedWorkstation);
  }
}
