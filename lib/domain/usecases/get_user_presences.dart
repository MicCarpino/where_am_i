import 'package:dartz/dartz.dart';

import 'package:where_am_i/domain/entities/workstation.dart';
import 'package:where_am_i/domain/repositories/workstation_repository.dart';
import '../../core/error/failure.dart';
import '../../core/usecases/usecase.dart';

class GetUserPresences extends UseCase<List<Workstation>, NoParams> {
  final WorkstationRepository _workstationRepository;

  GetUserPresences(this._workstationRepository);

  Future<Either<Failure, List<Workstation>>> call(NoParams params) async {
    return await _workstationRepository.getAllWorkstationsByIdResource();
  }
}
