import 'package:dartz/dartz.dart';
import 'package:where_am_i/core/error/failure.dart';
import 'package:where_am_i/core/usecases/usecase.dart';
import 'package:where_am_i/domain/repositories/workstation_repository.dart';

class RemoveUserPresence extends UseCase<int, int> {
  final WorkstationRepository _workstationRepository;

  RemoveUserPresence(this._workstationRepository);

  Future<Either<Failure, int>> call(int idWorkstation) async {
    return await _workstationRepository.deleteWorkstation(idWorkstation);
  }
}
