import 'package:dartz/dartz.dart';
import 'package:where_am_i/domain/entities/workstation.dart';
import 'package:where_am_i/domain/repositories/workstation_repository.dart';

import '../../core/error/failure.dart';
import '../../core/usecases/usecase.dart';

class UpdateUserPresences extends UseCase<List<Workstation>, List<DateTime>> {
   final WorkstationRepository _workstationRepository;

  UpdateUserPresences(this._workstationRepository);

  Future<Either<Failure, List<Workstation>>> call(List<DateTime> userPresences) async {
    return await _workstationRepository.updateWorkstationsForUser(userPresences);
  }
}
