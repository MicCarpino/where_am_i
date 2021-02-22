import 'package:dartz/dartz.dart';
import 'package:where_am_i/core/error/failure.dart';
import 'package:where_am_i/core/usecases/usecase.dart';
import 'package:where_am_i/domain/entities/user_with_workstation.dart';
import 'package:where_am_i/domain/entities/user.dart';
import 'package:where_am_i/domain/entities/workstation.dart';
import 'package:where_am_i/domain/repositories/user_repository.dart';
import 'package:where_am_i/domain/repositories/workstation_repository.dart';


class GetAllUserPresencesByDate
    extends UseCase<List<UserWithWorkstation>, DateTime> {
  final WorkstationRepository _workstationRepository;
  final UserRepository _userRepository;

  GetAllUserPresencesByDate(this._workstationRepository, this._userRepository);

  Future<Either<Failure, List<UserWithWorkstation>>> call(DateTime date) async {
    var usersList = await _userRepository.getAllUsers();
    var workstationsList =
        await _workstationRepository.getAllByDate(date);
    List<Workstation> workstations =
        workstationsList.getOrElse(() => null);
    List<User> users = usersList.getOrElse(() => null);
    //assigning workstation (if present) at each user in list
    if (usersList != null && workstations != null) {
      List<UserWithWorkstation> usersWithWorkstations =
          mergeAndSortUsersWithWorkstations(workstations, users);
      return Right(usersWithWorkstations);
    } else {
      return Left(ServerFailure(""));
    }
  }

  List<UserWithWorkstation> mergeAndSortUsersWithWorkstations(
      List<Workstation> workstations, List<User> users) {
    //Assigning workstation ot each user
    List<UserWithWorkstation> usersWithWorkstations = users.map((user) {
      Workstation relatedWorkstation = workstations.firstWhere(
          (workstation) => workstation.idResource == user.idResource,
          orElse: () => null);
      return UserWithWorkstation(user: user, workstation: relatedWorkstation);
    }).toList();
    //Sorting users list firstly by surname, then by name
    usersWithWorkstations.sort((a, b) {
      int surnameResult = a.user.surname.compareTo(b.user.surname);
      return surnameResult != 0
          ? surnameResult
          : a.user.name.compareTo(b.user.name);
    });
    //Sorting free name users
    List<UserWithWorkstation> freeNamesWorkstations = workstations
        .where((workstation) => workstation.freeName != null)
        .map((workstation) =>
            UserWithWorkstation(user: null, workstation: workstation))
        .toList();
    freeNamesWorkstations.sort(
        (a, b) => a.workstation.freeName.compareTo(b.workstation.freeName));
    //add users to free names list and return the list
    return List.of(freeNamesWorkstations..addAll(usersWithWorkstations));
  }
}
