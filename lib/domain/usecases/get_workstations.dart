import 'package:dartz/dartz.dart';
import 'package:where_am_i/domain/entities/workstation.dart';
import 'package:where_am_i/domain/repositories/workstation_repository.dart';

import '../../core/error/failure.dart';
import '../../core/usecases/usecase.dart';

class GetWorkstations extends UseCase<List<Workstation>, DateTime> {
  final WorkstationRepository workstationRepository;

  GetWorkstations(this.workstationRepository);

  Future<Either<Failure, List<Workstation>>> call(DateTime date) async {
    return await workstationRepository.getAllWorkstationsByDate(date);
  }
}
