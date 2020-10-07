import 'package:dartz/dartz.dart';
import 'package:where_am_i/domain/entities/workstation.dart';
import 'package:where_am_i/domain/repositories/workstation_repository.dart';

import '../../core/error/failure.dart';
import '../../core/usecases/usecase.dart';

class DeleteWorkstation extends UseCase<List<Workstation>, int> {
  final WorkstationRepository _workstationRepository;

  DeleteWorkstation(this._workstationRepository);

  Future<Either<Failure, List<Workstation>>> call(int idWorkstation) async {
    return await _workstationRepository.deleteWorkstation(idWorkstation);
  }
}
