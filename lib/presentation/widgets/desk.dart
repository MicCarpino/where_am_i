import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:where_am_i/core/utils/constants.dart';
import 'package:where_am_i/core/utils/extensions.dart';
import 'package:where_am_i/domain/entities/user.dart';
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
  User loggedUser;

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
          child: MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
                side: BorderSide(
                    color: isDeskOfLoggedUser ? dncOrange : Colors.black54,
                    width: isDeskOfLoggedUser ? 2.5 : 1.0),
              ),
              //allow edit if user's role is staff or higher
              onPressed: () => _onDeskClick(),
              child: resourceLabel != null
                  ? AutoSizeText(
                      resourceLabel.replaceAll(" ", "\n"),
                      maxLines: resourceLabel.split(" ")?.length,
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

  _onDeskClick() {
    if (loggedUser.isStaffOrAdmin()) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => BlocProvider.value(
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
                    children: _generateOccupantsList(),
                  ),
                ),
              );
            });
      } else {
        return null;
      }
    }
  }

  List<Widget> _generateOccupantsList() {
    final occupants = widget.usersWithWorkstations
      ..sort((a, b) {
        var aStartTime = a.workstation.startTime.toDouble();
        var bStartTime = b.workstation.startTime.toDouble();
        var aEndTime = a.workstation.startTime.toDouble();
        var bEndTime = b.workstation.startTime.toDouble();
        var abc = aStartTime.compareTo(bStartTime);
        return abc != 0 ? abc : aEndTime.compareTo(bEndTime);
      });
    return occupants
        .map<Widget>((e) => Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 4.0, vertical: 8.0),
              child: Text(
                '${e.workstation.startTime.format(context)} - ${e.workstation.endTime.format(context)} ${e.getResourceLabel()}',
                style: TextStyle(fontSize: 16),
              ),
            ))
        .toList()
          ..add(Divider());
  }

  String _getResourceLabel() {
    if (widget.usersWithWorkstations.isNullOrEmpty()) {
      return null;
    } else if (widget.usersWithWorkstations.length == 1) {
      return widget.usersWithWorkstations.first
          .getResourceLabel()
          .toUpperCase();
    } else {
      //more then one resource for workstation
      return widget.usersWithWorkstations
          .firstWhere((element) => TimeOfDay.now().hour < 13
              ? element.workstation.endTime == TIME_SLOT_THIRTEEN
              : element.workstation.endTime == TIME_SLOT_EIGHTEEN)
          .getResourceLabel()
          .toUpperCase();
    }
  }
}
