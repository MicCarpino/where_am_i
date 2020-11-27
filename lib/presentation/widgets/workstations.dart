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
import 'package:where_am_i/presentation/widgets/workstation_marker.dart';

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
  bool isLoggedUserWorkstation;
  List<UserWithWorkstation> presencesForWorkstation;

  String resourceLabel;

  @override
  void initState() {
    _workstationBloc = BlocProvider.of<WorkstationBloc>(context);
    loggedUser = sl<UserService>().getLoggedUser;
    super.initState();
    presencesForWorkstation = _getWorkstationsForIndex(widget.workstationCode);
    isLoggedUserWorkstation = presencesForWorkstation?.any(
        (element) => element.workstation.idResource == loggedUser.idResource);
    resourceLabel = _getResourceLabel();
  }

  String _getResourceLabel() {
    if (presencesForWorkstation == null ||
        presencesForWorkstation.length == 0) {
      return null;
    } else if (presencesForWorkstation?.length == 1) {
      UserWithWorkstation userWithWorkstation = presencesForWorkstation.first;
      if (userWithWorkstation.user != null) {
        return '${userWithWorkstation.user.surname.toUpperCase()} ${userWithWorkstation.user.name.toUpperCase()}';
      } else if (userWithWorkstation.workstation?.freeName != null) {
        return userWithWorkstation.workstation.freeName.toUpperCase();
      } else {
        return null;
      }
    } else {
      //more then one resource for workstation
      String label;
      presencesForWorkstation.forEach((element) {
        TimeOfDay endTime = element.workstation.endTime;
        TimeOfDay currentTime = TimeOfDay.now();
        //from midnight to 13 show resource assigned for morning slot
        //after 13 to midnight show resource assigned for evening slot
        if ((currentTime.hour < 13 && endTime == TIME_SLOT_THIRTEEN) ||
            (currentTime.hour >= 13 && endTime == TIME_SLOT_EIGHTEEN)) {
          if (element.user != null) {
            label =
                '${element.user.surname.toUpperCase()} ${element.user.name.toUpperCase()}';
          } else if (element.workstation?.freeName != null) {
            label = element.workstation.freeName.toUpperCase();
          }
        } else {
          return;
        }
      });
      return label;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomPaint(
        child: FlatButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
              side: BorderSide(
                  color: isLoggedUserWorkstation ? dncOrange : Colors.black54,
                  width: isLoggedUserWorkstation ? 2.5 : 1.0),
            ),
            //allow edit if user's role is staff or higher
            onPressed: () => _onWorkstationClick(widget.workstationCode),
            //TODO: restore onLongPress functionality
            onLongPress: () => null,
            child: resourceLabel != null
                ? AutoSizeText(
                    resourceLabel,
                    textAlign: TextAlign.center,
                    maxLines: resourceLabel.split(" ").length + 1,
                    wrapWords: true,
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                        color: widget.allowChangesForCurrentDate
                            ? Colors.black
                            : Colors.black45),
                  )
                : Container()),
        painter: WorkstationMarker(
            presencesForWorkstation.map((e) => e.workstation).toList()),
      ),
    );
  }

  List<UserWithWorkstation> _getWorkstationsForIndex(int workstationCode) {
    String convertedCode = convertNewToOldWorkstationCode(workstationCode);
    List<UserWithWorkstation> workstationOfIndex = widget.usersWithWorkstations
        .where(
            (element) => element.workstation.codeWorkstation == convertedCode).toList();
    return workstationOfIndex;
  }

  _onWorkstationClick(int workstationCode) {
    if (loggedUser.idRole >= ROLE_STAFF && widget.allowChangesForCurrentDate) {
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
    } else {
      return null;
    }
  }

  _onWorkstationLongClick(Workstation selectedWorkstation) {
    if (loggedUser.idRole >= ROLE_STAFF &&
        selectedWorkstation != null &&
        widget.allowChangesForCurrentDate) {
      showDialog(
          context: context,
          builder: (BuildContext context) =>
              _buildRemoveConfirmationDialog(selectedWorkstation));
    } else {
      return null;
    }
  }

  AlertDialog _buildRemoveConfirmationDialog(Workstation workstation) {
    return AlertDialog(
      title: Text("Attenzione"),
      content: Text(
          "Continuando la risorsa verrà rimossa dalla postazione assegnatale"),
      actions: [
        FlatButton(
            child: Text("Annulla"), onPressed: () => Navigator.pop(context)),
        FlatButton(
            child: Text("OK"),
            onPressed: () {
              //Clone of selected workstation with codeWorkstation set to null
              var clearedWorkstation = Workstation(
                idWorkstation: workstation.idWorkstation,
                idResource: workstation.idResource,
                codeWorkstation: null,
                workstationDate: workstation.workstationDate,
                freeName: workstation.freeName,
              );
              _workstationBloc
                  .add(OnWorkstationUpdate(workstation: clearedWorkstation));
              Navigator.pop(context);
            })
      ],
    );
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
