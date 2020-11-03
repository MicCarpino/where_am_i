import 'package:where_am_i/domain/entities/authenticated_user.dart';
import 'package:where_am_i/domain/entities/user.dart';

class UserService {
  //Current logged user
  User loggedUser;

  User get getLoggedUser => loggedUser;

  setLoggedUser(User gg) => loggedUser = gg;

  removeLoggedUser() => loggedUser = null;

  //Workstation code assigned for current day
  int assignedWorkstationCode;

  int get getAssignedWorkstationCode => assignedWorkstationCode;

  setAssignedWorkstationCode(int workstationCode) =>
      assignedWorkstationCode = workstationCode;
}
