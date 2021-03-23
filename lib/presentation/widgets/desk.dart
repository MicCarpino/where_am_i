import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:where_am_i/core/utils/constants.dart';
import 'package:where_am_i/core/utils/extensions.dart';
import 'package:where_am_i/domain/entities/user_with_workstation.dart';
import 'package:where_am_i/presentation/bloc/authentication/authentication_bloc.dart';
import 'package:where_am_i/presentation/bloc/workstation/watcher/workstation_watcher_bloc.dart';
import 'package:where_am_i/presentation/pages/assignable_users_page.dart';
import 'package:where_am_i/presentation/widgets/workstation_marker.dart';

class Desk extends StatefulWidget {
  final List<UserWithWorkstation> usersWithWorkstations;
  final int workstationCode;
  final bool allowChangesForCurrentDate = true;

  Desk({
    @required this.usersWithWorkstations,
    @required this.workstationCode,
  });

  @override
  _DeskState createState() => _DeskState();
}

class _DeskState extends State<Desk> {
  String resourceLabel;
  final isDeskOfLoggedUser = false;
  var loggedUser;

  @override
  void initState() {
    super.initState();
    resourceLabel = _getResourceLabel();
    loggedUser =
        context.read<AuthenticationBloc>().state.authenticatedUser.user;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomPaint(
          painter: WorkstationMarker(widget.usersWithWorkstations
                  .map((e) => e.workstation)
                  ?.toList() ??
              []),
          child: FlatButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
                side: BorderSide(
                    color: isDeskOfLoggedUser ? dncOrange : Colors.black54,
                    width: isDeskOfLoggedUser ? 2.5 : 1.0),
              ),
              //allow edit if user's role is staff or higher
              onPressed: () => _onWorkstationClick(),
              child: resourceLabel != null
                  ? AutoSizeText(
                      resourceLabel?.replaceAll(" ", "\n"),
                      maxLines: resourceLabel?.split(" ")?.length,
                      minFontSize: 10,
                      maxFontSize: 14,
                      softWrap: false,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.visible,
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
            value: context.read<WorkstationWatcherBloc>(),
            child: AssignableUsersPage(
              selectedWorkstationCode: widget.workstationCode.toString(),
            ),
          ),
        ),
      );
    } else {
      if (widget.usersWithWorkstations.length > 1) {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return Dialog(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: _generateOccupantsList(widget.usersWithWorkstations),
                  ),
                ),
              );
            });
      } else {
        return null;
      }
    }
  }

//beltramo 14-18
  List<Widget> _generateOccupantsList(List<UserWithWorkstation> occupants) {
    List<Widget> list = [];
    occupants.sort((a, b) {
      var aStartTime = a.workstation.startTime.toDouble();
      var bStartTime = b.workstation.startTime.toDouble();
      var aEndTime = a.workstation.startTime.toDouble();
      var bEndTime = b.workstation.startTime.toDouble();
      var abc = aStartTime.compareTo(bStartTime);
      return abc != 0 ? abc : aEndTime.compareTo(bEndTime);
    });
    for (var index = 0; index < occupants.length; index++) {
      var w = occupants[index].workstation;
      String name = occupants[index].getResourceLabel();
      list.add(Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 8.0),
        child: Text(
          '${w.startTime.format(context)} - ${w.endTime.format(context)} $name',
          style: TextStyle(fontSize: 16),
        ),
      ));
      if (index + 1 < occupants.length) {
        list.add(Divider());
      }
    }
    return list;
  }

  String _getResourceLabel() {
    if (widget.usersWithWorkstations == null || widget.usersWithWorkstations.isEmpty) {
      return null;
    } else if (widget.usersWithWorkstations.length == 1) {
      UserWithWorkstation userWithWorkstation = widget.usersWithWorkstations.first;
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
      widget.usersWithWorkstations.forEach((element) {
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
}
