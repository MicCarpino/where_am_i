import 'package:dartz/dartz.dart';
import 'package:where_am_i/domain/entities/user.dart';
import 'package:where_am_i/domain/entities/user_with_workstation.dart';
import 'package:where_am_i/domain/entities/workstation.dart';
import 'package:where_am_i/domain/repositories/user_repository.dart';
import 'package:where_am_i/domain/repositories/workstation_repository.dart';

import '../../core/error/failure.dart';
import '../../core/usecases/usecase.dart';

class DeleteWorkstation extends UseCase<List<UserWithWorkstation>, int> {
  final WorkstationRepository _workstationRepository;
  final UserRepository userRepository;

  DeleteWorkstation(this._workstationRepository,this.userRepository);

  Future<Either<Failure, List<UserWithWorkstation>>> call(int idWorkstation) async {
    var usersList = await userRepository.getAllUsers();
    var workstationsList =   await _workstationRepository.deleteWorkstation(idWorkstation);
    List<Workstation> workstations = workstationsList.getOrElse(() => null);
    List<User> users = usersList.getOrElse(() => null);
    //assigning workstation (if present) at each user in list
    if (usersList != null && workstations != null) {
      return Right(mergeAndSortUsersWithWorkstations(workstations, users));
    } else {
      return Left(ServerFailure(""));
    }
  }

  List<UserWithWorkstation> mergeAndSortUsersWithWorkstations(List<Workstation> workstations, List<User> users){
    List<UserWithWorkstation> usersWithWorkstations = users.map((user) {
      Workstation relatedWorkstation = workstations.firstWhere(
              (workstation) => workstation.idResource == user.idResource,
          orElse: () => null);
      return UserWithWorkstation(user: user, workstation: relatedWorkstation);
    }).toList();
    usersWithWorkstations.sort((a, b) => a.user.surname.compareTo(b.user.surname));
    //Free name users
    List<UserWithWorkstation> freeNamesWorkstations = workstations
        .where((workstation) => workstation.freeName != null)
        .map((workstation) => UserWithWorkstation(user: null,workstation: workstation))
        .toList();
    freeNamesWorkstations.sort((a, b) => a.workstation.freeName.compareTo(b.workstation.freeName));
    return List.of(freeNamesWorkstations..addAll(usersWithWorkstations));
  }
}
