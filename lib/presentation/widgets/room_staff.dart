import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:where_am_i/domain/entities/user_with_workstation.dart';
import 'package:where_am_i/presentation/widgets/room_label.dart';
import 'package:where_am_i/presentation/widgets/workstations.dart';

class RoomStaff extends StatelessWidget {
  final List<UserWithWorkstation> workstations;
  final bool areChangesAllowed;

  RoomStaff({this.workstations = const [], this.areChangesAllowed});

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
                        isEditable: areChangesAllowed,
                      ),
                    ),
                    SizedBox(
                      width: 100,
                      height: 100,
                      child: Workstations(
                        usersWithWorkstations: workstations,
                        workstationCode: 49,
                        isEditable: areChangesAllowed,
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
                        isEditable: areChangesAllowed,
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
                      isEditable: areChangesAllowed,
                    ),
                  ),
                  SizedBox(
                    width: 100,
                    height: 100,
                    child: Workstations(
                      usersWithWorkstations: workstations,
                      workstationCode: 44,
                      isEditable: areChangesAllowed,
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
                      isEditable: areChangesAllowed,
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
                      isEditable: areChangesAllowed,
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
}
