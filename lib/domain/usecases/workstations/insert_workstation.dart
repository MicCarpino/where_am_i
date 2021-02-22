import 'package:dartz/dartz.dart';
import 'package:where_am_i/core/error/failure.dart';
import 'package:where_am_i/core/usecases/usecase.dart';

import 'package:where_am_i/domain/entities/workstation.dart';
import 'package:where_am_i/domain/repositories/workstation_repository.dart';


class InsertWorkstation extends UseCase<Workstation, Workstation> {
  final WorkstationRepository _workstationRepository;

  InsertWorkstation(this._workstationRepository);

  Future<Either<Failure, Workstation>> call(
      Workstation newWorkstation) async {
      // performing remote insert
      return await _workstationRepository.insert(newWorkstation);
  }
}
