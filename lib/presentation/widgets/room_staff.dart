import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:where_am_i/domain/entities/user_with_workstation.dart';
import 'package:where_am_i/presentation/widgets/room_label.dart';
import 'package:where_am_i/presentation/widgets/desk.dart';

class RoomStaff extends StatelessWidget {
  final List<UserWithWorkstation> workstations;
  final bool allowChangesForCurrentDate;

  RoomStaff({this.workstations = const [], this.allowChangesForCurrentDate});

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
                      child: Desk(
                        usersWithWorkstationForDesk: workstations
                            .where((element) =>
                                element.workstation.codeWorkstation == "48")
                            .toList(),
                        workstationCode: 48,
                        allowChangesForCurrentDate: allowChangesForCurrentDate,
                      ),
                    ),
                    SizedBox(
                      width: 100,
                      height: 100,
                      child: Desk(
                        usersWithWorkstationForDesk: workstations
                            .where((element) =>
                                element.workstation.codeWorkstation == "49")
                            .toList(),
                        workstationCode: 49,
                        allowChangesForCurrentDate: allowChangesForCurrentDate,
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
                      child: Desk(
                        usersWithWorkstationForDesk: workstations
                            .where((element) =>
                                element.workstation.codeWorkstation == "47")
                            .toList(),
                        workstationCode: 47,
                        allowChangesForCurrentDate: allowChangesForCurrentDate,
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
                    child: Desk(
                      usersWithWorkstationForDesk: workstations
                          .where((element) =>
                              element.workstation.codeWorkstation == "43")
                          .toList(),
                      workstationCode: 43,
                      allowChangesForCurrentDate: allowChangesForCurrentDate,
                    ),
                  ),
                  SizedBox(
                    width: 100,
                    height: 100,
                    child: Desk(
                      usersWithWorkstationForDesk: workstations
                          .where((element) =>
                              element.workstation.codeWorkstation == "44")
                          .toList(),
                      workstationCode: 44,
                      allowChangesForCurrentDate: allowChangesForCurrentDate,
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
                    child: Desk(
                      usersWithWorkstationForDesk: workstations
                          .where((element) =>
                              element.workstation.codeWorkstation == "46")
                          .toList(),
                      workstationCode: 46,
                      allowChangesForCurrentDate: allowChangesForCurrentDate,
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
                    child: Desk(
                      usersWithWorkstationForDesk: workstations
                          .where((element) =>
                              element.workstation.codeWorkstation == "45")
                          .toList(),
                      workstationCode: 45,
                      allowChangesForCurrentDate: allowChangesForCurrentDate,
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
