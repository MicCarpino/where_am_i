import 'package:dartz/dartz.dart';
import 'package:where_am_i/core/error/failure.dart';
import 'package:where_am_i/core/usecases/usecase.dart';

import 'package:where_am_i/domain/entities/workstation.dart';
import 'package:where_am_i/domain/repositories/workstation_repository.dart';


class InsertAllWorkstations extends UseCase<List<Workstation>, List<Workstation>> {
  final WorkstationRepository _workstationRepository;

  InsertAllWorkstations(this._workstationRepository);

  Future<Either<Failure,  List<Workstation>>> call(
      List<Workstation> newWorkstations) async {
      // performing remote insert
      return await _workstationRepository.insertAllWorkstations(newWorkstations);
  }
}
