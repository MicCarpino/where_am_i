import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:where_am_i/core/utils/constants.dart';
import 'package:where_am_i/data/user_service.dart';
import 'package:where_am_i/domain/entities/user.dart';
import 'package:where_am_i/domain/entities/user_with_workstation.dart';
import 'package:where_am_i/domain/entities/workstation.dart';
import 'package:where_am_i/presentation/bloc/workstation/workstation_bloc.dart';
import 'package:where_am_i/presentation/pages/assignable_users_page.dart';


final sl = GetIt.instance;

class Workstations extends StatefulWidget {
  final List<UserWithWorkstation> usersWithWorkstations;
  final int workstationCode;
  final bool allowChangesForCurrentDate;

  const Workstations({
    @required this.usersWithWorkstations,
    @required this.workstationCode,
    @required this.allowChangesForCurrentDate,
  });

  @override
  _WorkstationsState createState() => _WorkstationsState();
}

class _WorkstationsState extends State<Workstations> {
  User loggedUser;
  WorkstationBloc _workstationBloc;
  int assignedWorkstation;

  @override
  void initState() {
    _workstationBloc = BlocProvider.of<WorkstationBloc>(context);
    loggedUser = sl<UserService>().getLoggedUser;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var userWithWorkstation = _getWorkstationForIndex(widget.workstationCode);
    String resourceLabel = "";
    if (userWithWorkstation?.user != null) {
      resourceLabel = userWithWorkstation.user.surname.toUpperCase() +
          " \n" +
          userWithWorkstation.user.name.toUpperCase();
    } else if (userWithWorkstation?.workstation?.freeName != null) {
      resourceLabel = userWithWorkstation.workstation.freeName.toUpperCase();
    }
    bool isLoggedUserWorkstation =
        userWithWorkstation?.user?.idResource != null &&
            userWithWorkstation.user.idResource == loggedUser.idResource;
    return FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
          side: BorderSide(
              color: isLoggedUserWorkstation ? dncOrange : Colors.black54,
              width: isLoggedUserWorkstation ? 2.5 : 1.0),
        ),
        //allow edit if user's role is staff or higher
        onPressed: () =>
            loggedUser.idRole >= ROLE_STAFF && widget.allowChangesForCurrentDate
                ? _onWorkstationClick(widget.workstationCode)
                : null,
        onLongPress: () => loggedUser.idRole >= ROLE_STAFF &&
                userWithWorkstation != null &&
                widget.allowChangesForCurrentDate
            ? showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text("Attenzione"),
                    content: Text(
                        "Continuando la risorsa verrà rimossa dalla postazione assegnatale"),
                    actions: [
                      FlatButton(
                          child: Text("Annulla"),
                          onPressed: () => Navigator.pop(context)),
                      FlatButton(
                          child: Text("OK"),
                          onPressed: () => _onWorkstationLongClick(
                              userWithWorkstation.workstation))
                    ],
                  );
                },
              )
            : null,
        child: AutoSizeText(
          resourceLabel,
          textAlign: TextAlign.center,
          maxLines: resourceLabel.split(" ").length,
          wrapWords: true,
          overflow: TextOverflow.clip,
          style: TextStyle(
              color: widget.allowChangesForCurrentDate
                  ? Colors.black
                  : Colors.black45),
        ));
  }

  UserWithWorkstation _getWorkstationForIndex(int workstationCode) {
    String convertedCode = convertNewToOldWorkstationCode(workstationCode);
    var workstationOfIndex = widget.usersWithWorkstations.firstWhere(
        (element) => element.workstation.codeWorkstation == convertedCode,
        orElse: () => null);
    return workstationOfIndex;
  }

  _onWorkstationClick(int workstationCode) {
    String convertedCode = convertNewToOldWorkstationCode(workstationCode);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AssignableUsersPage(
          assignableUsers: widget.usersWithWorkstations
              .where((element) => element.workstation.codeWorkstation == null)
              .toList(),
          selectedWorkstationCode: convertedCode,
        ),
      ),
    ).then((selectedWorkstation) {
      if (selectedWorkstation != null) {
        _workstationBloc
            .add(OnWorkstationUpdate(workstation: selectedWorkstation));
      }
    });
  }

  _onWorkstationLongClick(Workstation selectedWorkstation) {
    //Clone of selected workstation with codeWorkstation set to null
    var clearedWorkstation = Workstation(
      idWorkstation: selectedWorkstation.idWorkstation,
      idResource: selectedWorkstation.idResource,
      codeWorkstation: null,
      workstationDate: selectedWorkstation.workstationDate,
      freeName: selectedWorkstation.freeName,
    );
    _workstationBloc.add(OnWorkstationUpdate(workstation: clearedWorkstation));
    Navigator.pop(context);
  }

  String convertNewToOldWorkstationCode(int newWorkstationCode) {
    String workstationCode = newWorkstationCode.toString();
    if (newWorkstationCode <= 18) {
      workstationCode = getOldWorkstationCodeFor26b[newWorkstationCode];
    }
    if (newWorkstationCode >= 19 && newWorkstationCode <= 34) {
      workstationCode = getOldWorkstationCodeFor24[newWorkstationCode];
    }
    if (newWorkstationCode >= 76 && newWorkstationCode <= 87) {
      workstationCode = getOldWorkstationCodeFor26AF1Room1[newWorkstationCode];
    }
    return workstationCode;
  }
}
