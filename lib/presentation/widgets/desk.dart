import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:where_am_i/core/utils/constants.dart';
import 'package:where_am_i/core/utils/workstations_code_converter.dart';
import 'package:where_am_i/data/user_service.dart';
import 'package:where_am_i/domain/entities/user.dart';
import 'package:where_am_i/domain/entities/user_with_workstation.dart';
import 'package:where_am_i/domain/entities/workstation.dart';
import 'package:where_am_i/presentation/bloc/workstation/workstation_bloc.dart';
import 'package:where_am_i/presentation/pages/assignable_users_page.dart';
import 'package:where_am_i/presentation/widgets/workstation_marker.dart';

final sl = GetIt.instance;

class Desk extends StatefulWidget {
  final List<UserWithWorkstation> allUsersWithWorkstation;
  final int workstationCode;
  final bool allowChangesForCurrentDate;

  Desk({
    @required this.allUsersWithWorkstation,
    @required this.workstationCode,
    @required this.allowChangesForCurrentDate,
  });

  @override
  _DeskState createState() => _DeskState();
}

class _DeskState extends State<Desk> {
  User loggedUser;
  WorkstationBloc _workstationBloc;
  bool isDeskOfLoggedUser;
  String resourceLabel;
  List<UserWithWorkstation> workstationsForDesk;
  String newCodeWorkstation;

  @override
  void initState() {
    super.initState();
    _workstationBloc = BlocProvider.of<WorkstationBloc>(context);
    loggedUser = sl<UserService>().getLoggedUser;
    newCodeWorkstation = WorkstationCodesConverter()
        .convertNewToOldWorkstationCode(widget.workstationCode);
    workstationsForDesk = widget.allUsersWithWorkstation
        .where((element) =>
            element.workstation?.codeWorkstation == newCodeWorkstation)
        .toList();
    isDeskOfLoggedUser = workstationsForDesk?.any(
        (element) => element.workstation.idResource == loggedUser.idResource);
    resourceLabel = _getResourceLabel();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomPaint(
          painter: WorkstationMarker(
              workstationsForDesk?.map((e) => e.workstation)?.toList() ?? []),
          child: FlatButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
                side: BorderSide(
                    color: isDeskOfLoggedUser ? dncOrange : Colors.black54,
                    width: isDeskOfLoggedUser ? 2.5 : 1.0),
              ),
              //allow edit if user's role is staff or higher
              onPressed: () => _onWorkstationClick(),
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
                  : Container())),
    );
  }

  _onWorkstationClick() {
    if (loggedUser.idRole >= ROLE_STAFF && widget.allowChangesForCurrentDate) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (newContext) => BlocProvider.value(
            value: _workstationBloc,
            child: AssignableUsersPage(
              selectedWorkstationCode: newCodeWorkstation,
            ),
          ),
        ),
      ).then((selectedWorkstation) {
          _workstationBloc.add(GetLastWorkstationsList());
      });
    } else if (widget.allUsersWithWorkstation.length > 1) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return Dialog(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: _generateOccupantsList(),
                ),
              ),
            );
          });
    } else {
      return null;
    }
  }

  List<Widget> _generateOccupantsList() {
    List<Widget> list = [];
    for (var index = 0;
        index < widget.allUsersWithWorkstation.length;
        index++) {
      var w = widget.allUsersWithWorkstation[index].workstation;
      var user = widget.allUsersWithWorkstation[index].user;
      String name =
          user != null ? '${user.surname} ${user.name}' : w.freeName ?? '';
      list.add(Text(
          '${w.startTime.format(context)} - ${w.endTime.format(context)} $name'));
      if (index + 1 != widget.allUsersWithWorkstation.length) {
        list.add(Divider());
      }
    }
    return list;
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

  String _getResourceLabel() {
    if (workstationsForDesk == null || workstationsForDesk.isEmpty) {
      return null;
    } else if (workstationsForDesk.length == 1) {
      UserWithWorkstation userWithWorkstation = workstationsForDesk.first;
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
      workstationsForDesk.forEach((element) {
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
                  .add(OnSingleWorkstationUpdate(workstation: clearedWorkstation));
              Navigator.pop(context);
            })
      ],
    );
  }
}
