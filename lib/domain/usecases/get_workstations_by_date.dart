import 'package:dartz/dartz.dart';
import 'package:where_am_i/domain/entities/workstation.dart';
import 'package:where_am_i/domain/repositories/user_repository.dart';
import 'package:where_am_i/domain/repositories/workstation_repository.dart';

import '../../core/error/failure.dart';
import '../../core/usecases/usecase.dart';

class GetWorkstationsByDate extends UseCase<List<Workstation>, DateTime> {
  final WorkstationRepository workstationRepository;
  final UserRepository userRepository;

  GetWorkstationsByDate(this.workstationRepository, this.userRepository);

  Future<Either<Failure, List<Workstation>>> call(DateTime date) async {
    var usersList = await userRepository.getAllUsers();
    var workstationsModelsList =
        await workstationRepository.getAllWorkstationsByDate(date);
    var workstationsWithUserNames = List<Workstation>();
    if (usersList.isRight() && workstationsModelsList.isRight()) {
      //merging user names and surnames in workstations by idResource
      workstationsModelsList.getOrElse(() => null).forEach((workstation) {
        var user = usersList
            .getOrElse(() => null)
            .firstWhere((user) => user.idResource == workstation.idResource);
        workstationsWithUserNames.add(Workstation(
            idWorkstation: workstation.idWorkstation,
            idResource: workstation.idResource,
            resourceName: user.name,
            resourceSurname: user.surname,
            codeWorkstation: workstation.codeWorkstation,
            freeName: workstation.freeName,
            workstationDate: workstation.workstationDate));
      });
      return Right(workstationsWithUserNames);
    } else {
      return Left(ServerFailure(""));
    }
  }

}
