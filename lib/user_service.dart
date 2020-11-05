import 'package:where_am_i/domain/entities/user.dart';

class UserService {
  //Current logged user
  User loggedUser;

  User get getLoggedUser => loggedUser;

  setLoggedUser(User gg) => loggedUser = gg;

  removeLoggedUser() => loggedUser = null;

  //Workstation code assigned for current day

  int _assignedWorkstationCode;

  int get getAssignedWorkstationCode => _assignedWorkstationCode;

  setAssignedWorkstationCode(int workstationCode) =>
      _assignedWorkstationCode = workstationCode;
}
