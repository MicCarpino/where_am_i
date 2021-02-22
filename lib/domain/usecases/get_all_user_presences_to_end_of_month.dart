import 'package:dartz/dartz.dart';
import 'package:where_am_i/core/error/failure.dart';
import 'package:where_am_i/core/usecases/usecase.dart';
import 'package:where_am_i/domain/entities/user_with_workstation.dart';
import 'package:where_am_i/domain/entities/user.dart';
import 'package:where_am_i/domain/entities/workstation.dart';
import 'package:where_am_i/domain/repositories/user_repository.dart';
import 'package:where_am_i/domain/repositories/workstation_repository.dart';

class GetAllUserPresencesToEndOfMonth
    extends UseCase<List<Workstation>, PresencesToEndOfMonthParameters> {
  final WorkstationRepository _workstationRepository;

  GetAllUserPresencesToEndOfMonth(this._workstationRepository);

  Future<Either<Failure, List<Workstation>>> call(
      PresencesToEndOfMonthParameters params) async {
    return  await _workstationRepository.getAllByIdResourceToEndOfMonth(
            params.idResource, params.startingDate);
  }
}
