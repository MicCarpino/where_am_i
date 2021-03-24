import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:where_am_i/core/utils/constants.dart';
import 'package:where_am_i/core/utils/extensions.dart';
import 'package:where_am_i/domain/entities/user_with_workstation.dart';
import 'package:where_am_i/domain/entities/workstation.dart';
import 'package:where_am_i/presentation/bloc/workstation/actor/workstation_actor_bloc.dart';
import 'package:where_am_i/presentation/bloc/workstation/watcher/workstation_watcher_bloc.dart';

class WorkstationAssignmentPage extends StatelessWidget {
  const WorkstationAssignmentPage({@required this.selectedWorkstationCode});

  final int selectedWorkstationCode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: dncBlue,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: BlocBuilder<WorkstationWatcherBloc, WorkstationWatcherState>(
        builder: (context, state) => state.maybeMap(
          orElse: () => Container(),
          loadSuccess: (value) {
            final assignedResources = value.usersWithWorkstations
                .where((e) =>
                    e.workstation?.codeWorkstation ==
                    selectedWorkstationCode.toString())
                .toList();
            final assignableResources = value.usersWithWorkstations
                .where((e) => e.workstation?.codeWorkstation == null)
                .toList();
            //removing workstation with time slot overlapping
            if (assignedResources.isNotEmpty) {
              assignableResources.removeWhere((a) {
                return assignedResources.any((b) =>
                    b.workstation?.startTime == a.workstation?.startTime ||
                    b.workstation?.endTime == a.workstation?.endTime);
              });
            }
            return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (assignedResources.isNotEmpty)
                    ..._buildOccupantsList(context, assignedResources),
                  if (assignableResources.isEmpty)
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
                    ..._buildAssignableResourcesList(assignableResources)
                ]);
          },
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
    List<Widget> rows = occupants.map<Widget>((e) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: AutoSizeText(
                '${e.workstation.startTime.format(context)} - ${e.workstation.endTime.format(context)} ${e.getResourceLabel()}',
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
                    e.workstation.copyWith(codeWorkstation: null),
                  ),
                ),
            color: Colors.grey,
          )
        ],
      );
    }).toList();
    rows.insert(
      0,
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          'Risorse assegnate alla postazione:',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
    );
    rows.add(Divider());
    return rows;
  }

  List<Widget> _buildAssignableResourcesList(
      List<UserWithWorkstation> assignableUsers) {
    List<Widget> list = [];
    list.add(Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        'Risorse assegnabili alla postazione:',
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
    ));
    list.add(Expanded(
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: assignableUsers.length,
          itemBuilder: (BuildContext context, int index) {
            return Container();
            /*var item = assignableUsers[index];
            if (item.workstation.hasMoreForCurrentMonth &&
                item.workstation.idResource != null) {
              return _buildExpansionTile(item);
            } else {
              return ListTile(
                title: Text(item.getResourceLabel()),
                subtitle: _buildTimeSlotLabel(context,item.workstation),
                onTap: () => _performSingleAssignment(item.workstation),
              );
              ;
            }*/
          }),
    ));

    return list;
  }

  Widget _buildTimeSlotLabel(BuildContext context, Workstation workstation) {
    TimeOfDay startTime = workstation.startTime ?? TIME_SLOT_NINE;
    TimeOfDay endTime = workstation.endTime ?? TIME_SLOT_EIGHTEEN;
    return Text(
      "${startTime.format(context)} - ${endTime.format(context)}",
      style: TextStyle(color: Colors.black54, fontSize: 14),
    );
  }
}
