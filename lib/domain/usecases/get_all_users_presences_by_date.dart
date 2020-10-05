import 'package:dartz/dartz.dart';
import 'package:where_am_i/core/utils/constants.dart';
import 'package:where_am_i/data/models/workstation_model.dart';
import 'package:where_am_i/domain/entities/user.dart';
import 'package:where_am_i/domain/entities/workstation.dart';
import 'package:where_am_i/domain/repositories/user_repository.dart';
import 'package:where_am_i/domain/repositories/workstation_repository.dart';

import '../../core/error/failure.dart';
import '../../core/usecases/usecase.dart';

class GetAllUserPresencesByDate extends UseCase<List<User>, DateTime> {
  final WorkstationRepository workstationRepository;
  final UserRepository userRepository;

  GetAllUserPresencesByDate(this.workstationRepository, this.userRepository);

  Future<Either<Failure, List<User>>> call(DateTime date) async {
    var usersList = await userRepository.getAllUsers();
    var workstationsModelsList =
        await workstationRepository.getAllWorkstationsByDate(date);
    List<WorkstationModel> workstations =
        workstationsModelsList.getOrElse(() => null);
    List<User> users = usersList.getOrElse(() => null);
    //assigning code workstation (if present) at each user in list
    if (usersList != null && workstations != null) {
      List<User> usersWithPresences = users.map((user) {
        Workstation relatedWorkstation = workstations.firstWhere(
            (workstation) => workstation.idResource == user.idResource,
            orElse: () => null);
        if (relatedWorkstation != null) {
          return User(
            idResource: user.idResource,
            idRole: user.idRole,
            name: user.name,
            surname: user.surname,
            idWorkstation: relatedWorkstation.idWorkstation,
          );
        }
        return user;
      }).toList();
      usersWithPresences.sort((a, b) => a.surname.compareTo(b.surname));
      //Free name users
      List<User> usersWithFreeNames = workstations
          .where((workstation) => workstation.freeName != null)
          .map((freeNameUser) => User(
                idResource: null,
                idRole: ROLE_USER,
                name: freeNameUser.freeName,
                surname: null,
                idWorkstation: freeNameUser.idWorkstation,
              ))
          .toList();
      usersWithFreeNames.sort((a, b) => a.name.compareTo(b.name));
      return Right(List.of(usersWithFreeNames..addAll(usersWithPresences)));
    } else {
      return Left(ServerFailure(""));
    }
  }
}
