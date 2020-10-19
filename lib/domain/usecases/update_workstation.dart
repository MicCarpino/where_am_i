import 'package:dartz/dartz.dart';
import 'package:where_am_i/core/error/failure.dart';
import 'package:where_am_i/core/usecases/usecase.dart';
import 'package:where_am_i/domain/entities/workstation.dart';
import 'package:where_am_i/domain/repositories/user_repository.dart';
import 'package:where_am_i/domain/repositories/workstation_repository.dart';

class UpdateWorkstation extends UseCase<Workstation, Workstation> {
  final WorkstationRepository _workstationRepository;
  final UserRepository userRepository;

  UpdateWorkstation(this._workstationRepository, this.userRepository);

  Future<Either<Failure, Workstation>> call(
      Workstation updatedWorkstation) async {
    return await _workstationRepository.updateWorkstation(updatedWorkstation);
  }
}
