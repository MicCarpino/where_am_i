import 'package:dartz/dartz.dart';
import 'package:where_am_i/domain/entities/workstation.dart';
import 'package:where_am_i/domain/repositories/home_repository.dart';

import '../../core/error/failure.dart';
import '../../core/usecases/usecase.dart';

class GetWorkstations extends UseCase<List<Workstation>, DateTime> {
  final HomeRepository homeRepository;

  GetWorkstations(this.homeRepository);

  Future<Either<Failure, List<Workstation>>> call(DateTime date) async {
    return await homeRepository.getWorkstations(date);
  }
}
