import 'package:dartz/dartz.dart';
import 'package:where_am_i/data/models/user_model.dart';
import 'package:where_am_i/data/models/workstation_model.dart';
import 'package:where_am_i/domain/entities/user.dart';
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
    var foldedUsersList = await userRepository.getAllUsers();
    var foldedWorkstationsList =
        await workstationRepository.getAllWorkstationsByDate(date);
    var workstationsWithUserNames = List<Workstation>();

    //merging user names and surnames in workstations by idResource
    List<Workstation> workstationsList =
        foldedWorkstationsList.getOrElse(() => null);
    List<User> usersList = foldedUsersList.getOrElse(() => null);
    if (workstationsList == null || usersList == null) {
      return Left(ServerFailure(""));
    }
    workstationsList.forEach((workstation) {
      if (workstation.idResource != null) {
        var user = usersList.firstWhere(
            (user) => user.idResource == workstation.idResource,
            orElse: () => null);
        if (user != null) {
          workstationsWithUserNames.add(Workstation(
              idWorkstation: workstation.idWorkstation,
              idResource: workstation.idResource,
              resourceName: user.name,
              resourceSurname: user.surname,
              codeWorkstation: workstation.codeWorkstation,
              workstationDate: workstation.workstationDate));
        }
      } else if (workstation.freeName != null) {
        workstationsWithUserNames.add(Workstation(
            idWorkstation: workstation.idWorkstation,
            codeWorkstation: workstation.codeWorkstation,
            freeName: workstation.freeName,
            workstationDate: workstation.workstationDate));
      }
    });
    return Right(workstationsWithUserNames);
  }
}
