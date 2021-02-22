import 'package:dartz/dartz.dart';
import 'package:where_am_i/core/error/failure.dart';
import 'package:where_am_i/core/usecases/usecase.dart';
import 'package:where_am_i/domain/entities/workstation.dart';
import 'package:where_am_i/domain/repositories/workstation_repository.dart';

class UpdateWorkstationStatus extends UseCase<Workstation, WorkstationStatusParameters> {
  final WorkstationRepository _workstationRepository;

  UpdateWorkstationStatus(this._workstationRepository);

  Future<Either<Failure, Workstation>> call(
      WorkstationStatusParameters workstationStatusParameters) async {
    return await _workstationRepository.updateStatus(workstationStatusParameters);
  }
}
