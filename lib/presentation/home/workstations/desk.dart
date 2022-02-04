import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:where_am_i/core/utils/constants.dart';
import 'package:where_am_i/core/utils/extensions.dart';
import 'package:where_am_i/domain/blocs/authentication/authentication_bloc.dart';
import 'package:where_am_i/domain/blocs/date_picker/date_picker_cubit.dart';
import 'package:where_am_i/domain/blocs/workstation/actor/workstation_actor_bloc.dart';
import 'package:where_am_i/domain/blocs/workstation/watcher/workstation_watcher_bloc.dart';
import 'package:where_am_i/domain/entities/user.dart';
import 'package:where_am_i/domain/entities/user_with_workstation.dart';
import 'package:where_am_i/presentation/home/workstations/desk_marker.dart';
import 'package:where_am_i/presentation/workstation_assignment/workstation_assignment_page.dart';

class Desk extends StatefulWidget {
  //the code for this workstation
  final int workstationCode;
  final double width;

  Desk({
    @required this.workstationCode,
    @required this.width,
  });

  @override
  _DeskState createState() => _DeskState();
}

class _DeskState extends State<Desk> {
  User loggedUser;
  bool isEditAllowed;
  //list of resources assigned to this workstation
  List<UserWithWorkstation> assignedResources;

  @override
  void initState() {
    super.initState();
    loggedUser =
        context.read<AuthenticationBloc>().state.authenticatedUser.user;
    isEditAllowed = context.read<DatePickerCubit>().isEditAllowed();
  }

  @override
  Widget build(BuildContext context) {
    //initialize the resources list for this workstation
    assignedResources = context.read<WorkstationWatcherBloc>().state.maybeWhen(
        orElse: () => [],
        loadSuccess: (value) => value
            .where((element) =>
                element.workstation?.codeWorkstation ==
                widget.workstationCode.toString())
            .toList());
    //get the resource name to display
    String resourceLabel = _getDeskLabel();
    return Container(
      width: widget.width,
      height: widget.width,
      child: CustomPaint(
        //render the marker at the corner to indicate morning/afternoon desk occupation
          painter: DeskMarker(
            assignedResources.map((e) => e.workstation).toList(),
          ),
          child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
            bloc: context.read<AuthenticationBloc>(),
            builder: (_, state) {
              final isDeskOfLoggedUser =
                  state.assignedWorkstation == widget.workstationCode;
              return MaterialButton(
                  padding: EdgeInsets.all(4),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                    //mark the workstation for the logged user with an orange border
                    side: BorderSide(
                        color: isDeskOfLoggedUser ? dncOrange : Colors.black54,
                        width: isDeskOfLoggedUser ? 2.5 : 1.0),
                  ),
                  onPressed: () => _onDeskClick(),
                  child: resourceLabel != null
                      ? AutoSizeText(
                          resourceLabel.replaceAll(" ", "\n"),
                          maxLines: resourceLabel.split(" ")?.length,
                          minFontSize: 8,
                          maxFontSize: 14,
                          softWrap: false,
                          textAlign: TextAlign.center,
                          wrapWords: true,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color:
                                isEditAllowed ? Colors.black : Colors.black45,
                          ),
                        )
                      : Container());
            },
          )),
    );
  }

  //allow edit if user's role is staff or higher
  _onDeskClick() {
    //open the workstation assignment page if the logged user is staff/admin and
    // the date shown in the date picker is not earlier than today
    if (loggedUser.isStaffOrAdmin() && isEditAllowed) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider.value(
                value: context.read<WorkstationWatcherBloc>(),
              ),
              BlocProvider.value(
                value: context.read<WorkstationActorBloc>(),
              ),
              BlocProvider.value(
                value: context.read<DatePickerCubit>(),
              ),
            ],
            child: WorkstationAssignmentPage(
                selectedWorkstationCode: widget.workstationCode),
          ),
        ),
      );
    } else {
      //otherwise show the "occupants dialog", if there's at least one resource assigned
      if (assignedResources.length > 1) {
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
    //sort list by start time, then by end time
    final occupants = assignedResources
      ..sort((a, b) {
        var aStartTime = a.workstation.startTime.toDouble();
        var bStartTime = b.workstation.startTime.toDouble();
        var aEndTime = a.workstation.endTime.toDouble();
        var bEndTime = b.workstation.endTime.toDouble();
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
        .toList();
  }

  String _getDeskLabel() {
    if (assignedResources.isNullOrEmpty()) {
      return null;
    } else if (assignedResources.length == 1) {
      return assignedResources.first.getResourceLabel().toUpperCase();
    } else {
      //more then one resource for workstation
      return assignedResources
          .firstWhere((element) => TimeOfDay.now().hour < 13
              ? element.workstation.endTime == TIME_SLOT_THIRTEEN
              : element.workstation.endTime == TIME_SLOT_EIGHTEEN)
          .getResourceLabel()
          .toUpperCase();
    }
  }
}
