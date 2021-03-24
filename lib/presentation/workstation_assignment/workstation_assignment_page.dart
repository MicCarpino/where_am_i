import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:where_am_i/core/utils/constants.dart';
import 'package:where_am_i/core/utils/extensions.dart';
import 'package:where_am_i/domain/blocs/workstation/actor/workstation_actor_bloc.dart';
import 'package:where_am_i/domain/blocs/workstation/watcher/workstation_watcher_bloc.dart';
import 'package:where_am_i/domain/blocs/workstation/assignment/workstation_assignment_bloc.dart';
import 'package:where_am_i/domain/entities/user_with_workstation.dart';
import 'package:where_am_i/presentation/core/custom_expansion_tile.dart';

class WorkstationAssignmentPage extends StatelessWidget {
  const WorkstationAssignmentPage({@required this.selectedWorkstationCode});

  final int selectedWorkstationCode;

  // final ValueNotifier<Key> _expanded = ValueNotifier(null);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<WorkstationAssignmentBloc>(
      create: (context) => WorkstationAssignmentBloc(
        workstationCode: selectedWorkstationCode,
        workstationWatcherBloc: context.read<WorkstationWatcherBloc>(),
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: dncBlue,
          iconTheme: IconThemeData(color: Colors.white),
        ),
        body:
            BlocBuilder<WorkstationAssignmentBloc, WorkstationAssignmentState>(
          builder: (context, state) => state.maybeMap(
            orElse: () => Container(),
            loadSuccess: (value) {
              return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (value.assignedResources.isNotEmpty)
                      ..._buildOccupantsList(context, value.assignedResources),
                    if (value.assignableResources.isEmpty)
                      Expanded(
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                              'Al momento nessuna risorsa può essere assegnata a questa postazione',
                              style: TextStyle(fontSize: 16),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      )
                    else
                      ..._buildAssignableResourcesList(
                          context, value.assignableResources)
                  ]);
            },
          ),
        ),
      ),
    );
  }

  List<Widget> _buildOccupantsList(
    BuildContext context,
    List<UserWithWorkstation> occupants,
  ) {
    occupants.sort((a, b) {
      var aStartTime = a.workstation.startTime.toDouble();
      var bStartTime = b.workstation.startTime.toDouble();
      var aEndTime = a.workstation.startTime.toDouble();
      var bEndTime = b.workstation.startTime.toDouble();
      var abc = aStartTime.compareTo(bStartTime);
      return abc != 0 ? abc : aEndTime.compareTo(bEndTime);
    });
    return [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          'Risorse assegnate alla postazione:',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
      ...occupants.map<Widget>((e) {
        String startTime = e.workstation.startTime.format(context);
        String endTime = e.workstation.endTime.format(context);
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: AutoSizeText(
                  '$startTime - $endTime ${e.getResourceLabel()}',
                  maxLines: 1,
                  minFontSize: 14,
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.fade,
                  softWrap: false,
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.highlight_remove),
              onPressed: () => context.read<WorkstationActorBloc>().add(
                    WorkstationActorEvent.update(
                      e.workstation.setWorkstationCode(null),
                    ),
                  ),
              color: Colors.grey,
            )
          ],
        );
      }),
      Divider(),
    ];
  }

  List<Widget> _buildAssignableResourcesList(
    BuildContext context,
    List<UserWithWorkstation> assignableUsers,
  ) {
    return [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          'Risorse assegnabili alla postazione:',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
      Expanded(
        child: ListView(
          shrinkWrap: true,
          children: assignableUsers
              .map((e) => _buildSimpleListTile(context, e))
              .toList(),
        ),
      ),
    ];
  }

  Widget _buildSimpleListTile(
    BuildContext context,
    UserWithWorkstation userWithWorkstation,
  ) {
    String startTime =
        userWithWorkstation.workstation.startTime.format(context);
    String endTime = userWithWorkstation.workstation.endTime.format(context);

    return ListTile(
      title: Text(userWithWorkstation.getResourceLabel()),
      subtitle: Text(
        "$startTime - $endTime",
        style: TextStyle(color: Colors.black54, fontSize: 14),
      ),onTap: () => context.read<WorkstationActorBloc>().add(
      WorkstationActorEvent.update(
        userWithWorkstation.workstation.setWorkstationCode(selectedWorkstationCode.toString()),
      ),
    ),
    );
  }

/*CustomExpansionTile _buildExpansionTile(
    BuildContext context,
    UserWithWorkstation userWithWorkstation,
  ) {
    String startTime =
        userWithWorkstation.workstation.startTime.format(context);
    String endTime = userWithWorkstation.workstation.endTime.format(context);
    return CustomExpansionTile(
      onHeaderClick: () {
        //single assingment
      },
      expansionCallback: (hasExpanded) {
        if (hasExpanded) {
          // _clearPresencesFetched();
          //_fetchPresencesToEndOfMonth(item);
        }
      },
      subtitleWidget: Text(
        "$startTime - $endTime",
        style: TextStyle(color: Colors.black54, fontSize: 14),
      ),
      expandedItem: _expanded,
      key: Key(userWithWorkstation.workstation.idWorkstation.toString()),
      title: Text(userWithWorkstation.getResourceLabel()),
      children: <Widget>[
        BlocBuilder(
            cubit: _workstationAssignmentBloc,
            builder: (context, state) {
              if (state is PresencesToEndOfMonthErrorState) {
                return Text('ERROR');
              } else if (state is PresencesToEndOfMonthCompleteState) {
                var presencesToEndOfMonth = state.presencesToEndOfMonth;
                state.presencesToEndOfMonth.forEach((element) {
                  _userPresencesChecked.putIfAbsent(element, () => true);
                });
                return Column(children: [
                  ..._buildCheckBoxList(presencesToEndOfMonth),
                  isUpdating
                      ? CircularLoading(width: 50, height: 50)
                      : FlatButton(
                          onPressed: () {
                            List<Workstation> workstationsToAssign =
                                _userPresencesChecked.entries.map((e) {
                              if (e.value) {
                                return e.key.assignWorkstationCode(
                                    widget.selectedWorkstationCode);
                              }
                            }).toList();
                            workstationsToAssign
                                .retainWhere((element) => element != null);
                            _workstationBloc.add(
                              OnMultipleWorkstationsUpdate(
                                  updatedWorkstations: workstationsToAssign),
                            );
                          },
                          child: Text(
                            'CONFERMA',
                            style: TextStyle(color: Colors.blue),
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              side: BorderSide(color: Colors.blue)),
                        )
                ]);
              } else {
                return CircularLoading();
              }
            })
      ],
    );
  }*/
}
