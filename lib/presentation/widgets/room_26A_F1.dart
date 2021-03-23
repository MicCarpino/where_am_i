import 'package:flutter/material.dart';
import 'package:where_am_i/core/utils/workstations_code_converter.dart';
import 'package:where_am_i/domain/entities/user_with_workstation.dart';
import 'package:where_am_i/presentation/widgets/room_label.dart';
import 'package:where_am_i/presentation/widgets/desk.dart';

const R26A_FLOOR1_ROOM1_1_INDEX = 76;
const R26A_FLOOR1_ROOM1_2_INDEX = 82;
const R26A_FLOOR1_ROOM2_INDEX = 88;

class Room26AF1 extends StatelessWidget {
  final List<UserWithWorkstation> workstations;
  final bool allowChangesForCurrentDate;

  Room26AF1({this.workstations = const [], this.allowChangesForCurrentDate});

  final codeConverter = WorkstationCodesConverter();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RoomLabel(labelText: 'Stanza 1'),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                child: GridView.count(
                    physics: ScrollPhysics(),
                    shrinkWrap: true,
                    childAspectRatio: 1 / 1,
                    crossAxisCount: 2,
                    mainAxisSpacing: 0,
                    crossAxisSpacing: 0,
                    children: List.generate(6, (index) {
                      int newWorkstationCode =
                          codeConverter.toOldWorkstationCode(
                              R26A_FLOOR1_ROOM1_1_INDEX + index);
                      return Desk(
                        allUsersWithWorkstation: workstations,
                        workstationCode: newWorkstationCode,
                        allowChangesForCurrentDate: allowChangesForCurrentDate,
                      );
                    }))),
            SizedBox(width: 16),
            Expanded(
                child: GridView.count(
                    physics: ScrollPhysics(),
                    shrinkWrap: true,
                    childAspectRatio: 1 / 1,
                    crossAxisCount: 2,
                    mainAxisSpacing: 0,
                    crossAxisSpacing: 0,
                    children: List.generate(6, (index) {
                      int newWorkstationCode =
                          codeConverter.toOldWorkstationCode(
                              R26A_FLOOR1_ROOM1_2_INDEX + index);
                      return Desk(
                        allUsersWithWorkstation: workstations,
                        workstationCode: newWorkstationCode,
                        allowChangesForCurrentDate: allowChangesForCurrentDate,
                      );
                    })))
          ],
        ),
        RoomLabel(labelText: 'Stanza 2'),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 60),
          child: GridView.count(
              physics: ScrollPhysics(),
              shrinkWrap: true,
              childAspectRatio: 1 / 1,
              crossAxisCount: 2,
              mainAxisSpacing: 0,
              crossAxisSpacing: 0,
              children: List.generate(4, (index) {
                int newWorkstationCode =
                    codeConverter.toOldWorkstationCode(
                        R26A_FLOOR1_ROOM2_INDEX + index);
                var workstationsForDesk = workstations
                    .where((element) =>
                        element.workstation.codeWorkstation ==
                        newWorkstationCode.toString())
                    .toList();
                return Desk(
                  allUsersWithWorkstation: workstationsForDesk,
                  workstationCode: newWorkstationCode,
                  allowChangesForCurrentDate: allowChangesForCurrentDate,
                );
              })),
        ),
      ],
    );
  }
}
