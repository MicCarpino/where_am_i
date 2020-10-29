import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:where_am_i/domain/entities/user_with_workstation.dart';
import 'package:where_am_i/domain/entities/workstation.dart';
import 'package:where_am_i/presentation/bloc/workstation/workstation_bloc.dart';
import 'package:where_am_i/presentation/widgets/room_label.dart';
import 'package:where_am_i/presentation/widgets/workstations.dart';

class RoomStaff extends StatelessWidget {
  final List<UserWithWorkstation> workstations;

  RoomStaff({this.workstations = const []});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        RoomLabel(labelText: 'Dirigenza'),
        Container(
          height: 200,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              //left side
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(
                      width: 100,
                      height: 100,
                      child: Workstations(
                        usersWithWorkstations: workstations,
                        workstationCode: 48,
                        onWorkstationUpdated: (workstationSelected) =>
                            _onWorkstationUpdate(context, workstationSelected),
                      ),
                    ),
                    SizedBox(
                      width: 100,
                      height: 100,
                      child: Workstations(
                        usersWithWorkstations: workstations,
                        workstationCode: 49,
                        onWorkstationUpdated: (workstationSelected) =>
                            _onWorkstationUpdate(context, workstationSelected),
                      ),
                    ),
                  ],
                ),
              ),
              //right side
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 100,
                      height: 100,
                      child: Workstations(
                        usersWithWorkstations: workstations,
                        workstationCode: 47,
                        onWorkstationUpdated: (workstationSelected) =>
                            _onWorkstationUpdate(context, workstationSelected),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        RoomLabel(labelText: 'Amministrazione'),
        Container(
          height: 350,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  SizedBox(
                    width: 100,
                    height: 100,
                    child: Workstations(
                      usersWithWorkstations: workstations,
                      workstationCode: 43,
                      onWorkstationUpdated: (workstationSelected) =>
                          _onWorkstationUpdate(context, workstationSelected),
                    ),
                  ),
                  SizedBox(
                    width: 100,
                    height: 100,
                    child: Workstations(
                      usersWithWorkstations: workstations,
                      workstationCode: 44,
                      onWorkstationUpdated: (workstationSelected) =>
                          _onWorkstationUpdate(context, workstationSelected),
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    width: 100,
                    height: 100,
                    child: Workstations(
                      usersWithWorkstations: workstations,
                      workstationCode: 46,
                      onWorkstationUpdated: (workstationSelected) =>
                          _onWorkstationUpdate(context, workstationSelected),
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 100,
                    height: 100,
                    child: Workstations(
                      usersWithWorkstations: workstations,
                      workstationCode: 45,
                      onWorkstationUpdated: (workstationSelected) =>
                          _onWorkstationUpdate(context, workstationSelected),
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }

  _onWorkstationUpdate(BuildContext context, Workstation workstationSelected) {
    BlocProvider.of<WorkstationBloc>(context)
        .add(OnWorkstationUpdate(workstation: workstationSelected));
  }
}
