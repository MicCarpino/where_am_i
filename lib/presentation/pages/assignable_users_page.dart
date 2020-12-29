import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:where_am_i/core/usecases/usecase.dart';
import 'package:where_am_i/core/utils/constants.dart';
import 'package:where_am_i/core/utils/extensions.dart';
import 'package:where_am_i/domain/entities/user_with_workstation.dart';
import 'package:where_am_i/domain/entities/workstation.dart';
import 'package:where_am_i/presentation/bloc/workstation/workstation_bloc.dart';
import 'package:where_am_i/presentation/bloc/workstation_assignment/workstation_assignement_bloc.dart';
import 'package:where_am_i/presentation/widgets/circular_loading.dart';
import 'package:where_am_i/presentation/widgets/custom_expansion_tile.dart';
import 'package:where_am_i/presentation/widgets/retry_widget.dart';

final sl = GetIt.instance;

class AssignableUsersPage extends StatefulWidget {
  final String selectedWorkstationCode;

  AssignableUsersPage({@required this.selectedWorkstationCode});

  @override
  _AssignableUsersPageState createState() => _AssignableUsersPageState();
}

class _AssignableUsersPageState extends State<AssignableUsersPage> {
  WorkstationAssignementBloc _workstationAssignmentBloc;

  WorkstationBloc _workstationBloc;

  ValueNotifier<Key> _expanded = ValueNotifier(null);

  Map<Workstation, bool> _userPresencesChecked = new Map<Workstation, bool>();

  bool isUpdating = false;

  @override
  void initState() {
    super.initState();
    _workstationAssignmentBloc = sl<WorkstationAssignementBloc>();
    _workstationBloc = BlocProvider.of<WorkstationBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: dncBlue,
          iconTheme: IconThemeData(color: Colors.white),
        ),
        body: BlocConsumer(
          cubit: _workstationBloc,
          buildWhen: (previous, current) =>
              current is WorkstationsFetchCompletedState ||
              current is WorkstationsFetchLoadingState ||
              current is WorkstationsFetchErrorState,
          builder: (context, state) {
            if (state is WorkstationsFetchCompletedState) {
              var occupants = state.usersWithWorkstations
                  .where((element) =>
                      element.workstation.codeWorkstation ==
                      widget.selectedWorkstationCode)
                  .toList();
              var unassignedResources = state.usersWithWorkstations
                  .where(
                      (element) => element.workstation.codeWorkstation == null)
                  .toList();
              var assignableResources =
                  _filterAssignableResources(occupants, unassignedResources);
              return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ..._buildOccupantsList(context, occupants),
                    ..._buildAssignableResourcesList(assignableResources)
                  ]);
            } else {
              return CircularLoading();
            }
          },
          listener: (context, state) {
            if (state is WorkstationUpdateStatusChanged) {
              setState(() {
                isUpdating = state.isLoading;
              });
            } else if (state is WorkstationUpdateErrorState) {
              setState(() {
                isUpdating = false;
              });
              Scaffold.of(context).showSnackBar(
                SnackBar(content: Text(state.errorMessage)),
              );
            }
          },
        ));
  }

  List<Widget> _buildOccupantsList(
    BuildContext context,
    List<UserWithWorkstation> occupants,
  ) {
    List<Widget> list = [];
    if (occupants.isNotEmpty) {
      list.add(Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          'Risorse assegnate alla postazione:',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ));
    }
    occupants.sort((a, b) {
      var aStartTime = a.workstation.startTime.toDouble();
      var bStartTime = b.workstation.startTime.toDouble();
      var aEndTime = a.workstation.startTime.toDouble();
      var bEndTime = b.workstation.startTime.toDouble();
      var abc = aStartTime.compareTo(bStartTime);
      return abc != 0 ? abc : aEndTime.compareTo(bEndTime);
    });
    for (var index = 0; index < occupants.length; index++) {
      var workstation = occupants[index].workstation;
      list.add(Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: AutoSizeText(
                  '${workstation.startTime.format(context)} - ${workstation.endTime.format(context)} ${occupants[index].getResourceLabel()}',
                  maxLines: 1,
                  minFontSize: 14,textAlign: TextAlign.start,
                  overflow: TextOverflow.fade,softWrap: false,
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.highlight_remove),
              onPressed: () => _clearWorkstation(workstation),
              color: Colors.grey,
            )
          ]));
      if (index + 1 != occupants.length) {
        list.add(Divider());
      }
    }
    return list;
  }

  List<Widget> _buildAssignableResourcesList(
      List<UserWithWorkstation> assignableUsers) {
    List<Widget> list = [];
    if (assignableUsers.length > 0) {
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
              var item = assignableUsers[index];
              if (item.workstation.hasMoreForCurrentMonth &&
                  item.workstation.idResource != null) {
                return _buildExpansionTile(item);
              } else {
                return _buildSimpleTile(item);
              }
            }),
      ));
    } else {
      list.add(Expanded(
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
      ));
    }
    return list;
  }

  ListTile _buildSimpleTile(UserWithWorkstation item) {
    return ListTile(
      title: Text(item.getResourceLabel()),
      subtitle: _buildTimeSlotLabel(item.workstation),
      onTap: () => _performSingleAssignment(item.workstation),
    );
  }

  CustomExpansionTile _buildExpansionTile(UserWithWorkstation item) {
    return CustomExpansionTile(
      onHeaderClick: () => _performSingleAssignment(item.workstation),
      expansionCallback: (hasExpanded) {
        if (hasExpanded) {
          _clearPresencesFetched();
          _fetchPresencesToEndOfMonth(item);
        }
      },
      subtitleWidget: _buildTimeSlotLabel(item.workstation),
      expandedItem: _expanded,
      key: Key(item.workstation.idWorkstation.toString()),
      title: Text(item.getResourceLabel()),
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
  }

  List<Widget> _buildCheckBoxList(List<Workstation> presencesToEndOfMonth) {
    return List.generate(
      _userPresencesChecked.length,
      (index) {
        Workstation item = _userPresencesChecked.keys.elementAt(index);
        return CheckboxListTile(
            title:
                Text(DateFormat.yMMMMd('en_US').format(item.workstationDate)),
            subtitle: _buildTimeSlotLabel(item),
            value: _userPresencesChecked.values.elementAt(index),
            onChanged: (newValue) {
              setState(() {
                _userPresencesChecked[item] = newValue;
              });
            });
      },
    );
  }

  _fetchPresencesToEndOfMonth(UserWithWorkstation item) {
    String formattedDate =
        DateFormat('yyyy-MM-dd').format(item.workstation.workstationDate);
    _workstationAssignmentBloc.add(
      OnUserPresencesToEndOfMonthRequest(
        presencesToEndOfMonthParameters: PresencesToEndOfMonthParameters(
            idResource: item.user.idResource, startingDate: formattedDate),
      ),
    );
  }

  _clearPresencesFetched() {
    _userPresencesChecked.clear();
  }

  _performSingleAssignment(Workstation workstation) {
    Workstation updatedWorkstation =
        workstation.assignWorkstationCode(widget.selectedWorkstationCode);
    _workstationBloc
        .add(OnSingleWorkstationUpdate(workstation: updatedWorkstation));
  }

  _clearWorkstation(Workstation workstation) {
    Workstation updatedWorkstation = workstation.assignWorkstationCode(null);
    _workstationBloc
        .add(OnSingleWorkstationUpdate(workstation: updatedWorkstation));
  }

  List<UserWithWorkstation> _filterAssignableResources(
      List<UserWithWorkstation> occupants,
      List<UserWithWorkstation> allWorkstations) {
    if (occupants.isNotEmpty) {
      allWorkstations.removeWhere((element) => occupants.any((occupant) =>
          element.workstation.startTime == occupant.workstation.startTime ||
          element.workstation.endTime == occupant.workstation.endTime));
    }
    var freeNames = allWorkstations
        .where((element) => element.workstation.freeName != null)
        .toList();
    var resources =
        allWorkstations.where((element) => element.user != null).toList();
    freeNames.sortByFreeName();
    resources.sortBySurnameAndName();
    return List()..addAll(freeNames)..addAll(resources);
  }

  Widget _buildTimeSlotLabel(Workstation workstation) {
    TimeOfDay startTime = workstation.startTime ?? TIME_SLOT_NINE;
    TimeOfDay endTime = workstation.endTime ?? TIME_SLOT_EIGHTEEN;
    return Text(
      "${startTime.format(context)} - ${endTime.format(context)}",
      style: TextStyle(color: Colors.black54, fontSize: 14),
    );
  }
}
