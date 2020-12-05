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

final sl = GetIt.instance;

class AssignableUsersPage extends StatefulWidget {
  final List<UserWithWorkstation> usersAssignedToWorkstation;
  final List<UserWithWorkstation> assignableUsers;
  final String selectedWorkstationCode;

  AssignableUsersPage({
    @required this.usersAssignedToWorkstation,
    @required this.assignableUsers,
    @required this.selectedWorkstationCode,
  });

  @override
  _AssignableUsersPageState createState() => _AssignableUsersPageState();
}

class _AssignableUsersPageState extends State<AssignableUsersPage> {
  WorkstationAssignementBloc _workstationAssignmentBloc ;
  ValueNotifier<Key> _expanded = ValueNotifier(null);

  @override
  void initState() {
    super.initState();
    _workstationAssignmentBloc = sl<WorkstationAssignementBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: dncBlue,
          iconTheme: IconThemeData(color: Colors.white),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ..._buildOccupantsList(context),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Risorse assegnabili:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
            _buildAssignableResourcesList()
          ],
        ));
  }

  List<Widget> _buildOccupantsList(BuildContext context) {
    List<Widget> list = [];
    if (widget.usersAssignedToWorkstation.isNotEmpty) {
      list.add(Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          'Risorse assegnate alla postazione:',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ));
    }
    for (var index = 0;
        index < widget.usersAssignedToWorkstation.length;
        index++) {
      var workstation = widget.usersAssignedToWorkstation[index].workstation;
      var user = widget.usersAssignedToWorkstation[index].user;
      String name = user != null
          ? '${user.surname} ${user.name}'
          : workstation.freeName ?? '';
      list.add(
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            '${workstation.startTime.format(context)} - ${workstation.endTime.format(context)} $name',
            style: TextStyle(fontSize: 16),
          ),
        ),
        IconButton(
          icon: Icon(Icons.highlight_remove),
          onPressed: () => print('bau'),
          color: Colors.grey,
        )
      ]));
      if (index + 1 != widget.usersAssignedToWorkstation.length) {
        list.add(Divider());
      }
    }
    return list;
  }

  Widget _buildAssignableResourcesList() {
    return Expanded(
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: widget.assignableUsers.length,
          itemBuilder: (BuildContext context, int index) {
            var item = widget.assignableUsers[index];
            if (item.workstation.hasMoreForCurrentMoth) {
              return _buildExpansionTile(item);
            } else {
              return _buildSimpleTile(item);
            }
          }),
    );
  }

  ListTile _buildSimpleTile(UserWithWorkstation item) {
    return ListTile(
      title: Text(item.getResourceLabel()),
      onTap: () => print("ListTile: ${item.getResourceLabel()}"),
    );
  }

  CustomExpansionTile _buildExpansionTile(UserWithWorkstation item) {
    return CustomExpansionTile(
      expansionCallback: (hasExpanded) {
        if (hasExpanded) {
          _fetchPresencesToEndOfMonth(item);
        } else {
          _clearPresencesFetched();
        }
      },
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
                return Column(children: [
                  ..._buildCheckBox(presencesToEndOfMonth),
                  MaterialButton(
                    onPressed: () {},
                    color: Colors.blue,
                    child: Text('conferma'),
                  )
                ]);
              } else {
                return CircularLoading();
              }
            })
      ],
    );
  }

  List<Widget> _buildCheckBox(List<Workstation> presencesToEndOfMonth) {
    return List.generate(
      presencesToEndOfMonth.length,
      (index) {
        var item = presencesToEndOfMonth[index];
        return CheckboxListTile(
            title:
                Text(DateFormat.yMMMMd('en_US').format(item.workstationDate)),
            value: true,
            onChanged: (value) {
              print(value.toString());
            });
      },
    );
  }

  _fetchPresencesToEndOfMonth(UserWithWorkstation item) {
    print('_fetchPresencesToEndOfMonth invoked');
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
    print('_clearPresencesFetched invoked');
  }
}
/*

  Widget _buildAssignableResourcesList() {
    return widget.assignableUsers.length > 0
        ? Expanded(
            child: ListView.separated(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              separatorBuilder: (context, index) => Divider(
                color: Colors.black26,
              ),
              itemCount: widget.assignableUsers.length,
              itemBuilder: (context, index) {
                var selectedUser = widget.assignableUsers[index];
                //TODO: freename not working
                var updatedWorkstation = Workstation(
                    idWorkstation: selectedUser.workstation.idWorkstation,
                    idResource: selectedUser.user?.idResource,
                    workstationDate: selectedUser.workstation.workstationDate,
                    freeName: selectedUser.workstation.freeName,
                    codeWorkstation: widget.selectedWorkstationCode);
                return ExpansionTile(
                  title: Text(selectedUser.user != null
                      ? "${selectedUser.user?.surname} ${selectedUser.user?.name}"
                      : selectedUser.workstation.freeName),
                  children: [],
                );
              },
            ),
          )
        : Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Al momento nessuna risorsa risulta essere disponibile per l\'assegnazione',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
          );
  }

Widget cde() {
  return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        var item = widget.assignableUsers[index];
        setState(() {
          if (expandedItemIndex == index) {
            expandedItemIndex = null;
          } else {
            expandedItemIndex = index;
            if (item.user != null) {
              onPresencesRequested(item);
            }
          }
        });
      },
      children: List.generate(widget.assignableUsers.length, (index) {
        var item = widget.assignableUsers[index];
        return ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return GestureDetector(
              onTap: () => print(item.getResourceLabel()),
              child: Container(
                child: Text(item.getResourceLabel()),
                color: Colors.red,
              ),
            );
          },
          body: BlocBuilder(
              cubit: _workstationBloc,
              builder: (context, state) {
                if (state is PresencesToEndOfMonthLoadingState) {
                  return Center(child: CircularLoading());
                } else if (state is PresencesToEndOfMonthCompleteState) {
                  var presencesToEndOfMonth = state.presencesToEndOfMonth;
                  return Column(
                      children: List.generate(presencesToEndOfMonth.length,
                              (index) {
                            return CheckboxListTile(
                                title: Text(DateFormat.yMMMMd('en_US')
                                    .format(item.workstation.workstationDate)),
                                value: true,
                                onChanged: (bool value) {
                                  print(value.toString());
                                });
                          }));
                } else
                  return Container();
              }),
          canTapOnHeader: true,
          isExpanded: index == expandedItemIndex,
        );
      }));
}*/
