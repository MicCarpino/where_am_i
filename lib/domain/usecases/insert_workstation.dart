import 'package:dartz/dartz.dart';
import 'package:where_am_i/domain/entities/workstation.dart';
import 'package:where_am_i/domain/repositories/workstation_repository.dart';

import '../../core/error/failure.dart';
import '../../core/usecases/usecase.dart';

class InsertWorkstation extends UseCase<List<Workstation>, Workstation> {
  final WorkstationRepository _workstationRepository;

  InsertWorkstation(this._workstationRepository);

  Future<Either<Failure, List<Workstation>>> call(Workstation workstation) async {
    return await _workstationRepository.insertWorkstation(workstation);
  }
}
