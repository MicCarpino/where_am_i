import 'package:flutter/material.dart';
import 'package:where_am_i/core/utils/workstations_code_converter.dart';
import 'package:where_am_i/domain/entities/user_with_workstation.dart';
import 'package:where_am_i/presentation/widgets/room_label.dart';
import 'package:where_am_i/presentation/widgets/desk.dart';

class Room26AF2 extends StatelessWidget {
  final List<UserWithWorkstation> workstations;
  final bool allowChangesForCurrentDate;

  Room26AF2({this.workstations = const [], this.allowChangesForCurrentDate});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RoomLabel(labelText: 'Stanza 1'),
        GridView.count(
            physics: ScrollPhysics(),
            shrinkWrap: true,
            childAspectRatio: 1 / 1,
            crossAxisCount: 3,
            mainAxisSpacing: 0,
            crossAxisSpacing: 0,
            children: List.generate(6, (index) {
              return Desk(
                usersWithWorkstationForDesk: workstations,
                workstationCode: 50 + index,
                allowChangesForCurrentDate: allowChangesForCurrentDate,
              );
            })),
        RoomLabel(labelText: 'Stanza 2'),
        GridView.count(
            physics: ScrollPhysics(),
            shrinkWrap: true,
            childAspectRatio: 1 / 1,
            crossAxisCount: 4,
            mainAxisSpacing: 0,
            crossAxisSpacing: 0,
            children: List.generate(8, (index) {
              return Desk(
                usersWithWorkstationForDesk: workstations,
                workstationCode: 56 + index,
                allowChangesForCurrentDate: allowChangesForCurrentDate,
              );
            })),
        RoomLabel(labelText: 'Stanza 3'),
        GridView.count(
            physics: ScrollPhysics(),
            shrinkWrap: true,
            childAspectRatio: 1 / 1,
            crossAxisCount: 3,
            mainAxisSpacing: 0,
            crossAxisSpacing: 0,
            children: List.generate(6, (index) {
              return Desk(
                usersWithWorkstationForDesk: workstations,
                workstationCode: 64 + index,
                allowChangesForCurrentDate: allowChangesForCurrentDate,
              );
            })),
        RoomLabel(labelText: 'Stanza 4'),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 50),
          child: GridView.count(
              physics: ScrollPhysics(),
              shrinkWrap: true,
              childAspectRatio: 1 / 1,
              crossAxisCount: 2,
              mainAxisSpacing: 0,
              crossAxisSpacing: 0,
              children: List.generate(6, (index) {
                String newCodeWorkstation = WorkstationCodesConverter()
                    .convertNewToOldWorkstationCode(ROOM_26AF2_STARTING_INDEX + index);
                var workstationsForDesk = workstations
                    .where((element) =>
                        element.workstation.codeWorkstation == newCodeWorkstation)
                    .toList();
                return Desk(
                  usersWithWorkstationForDesk: workstationsForDesk,
                  workstationCode: ROOM_26AF2_STARTING_INDEX + index,
                  allowChangesForCurrentDate: allowChangesForCurrentDate,
                );
              })),
        )
      ],
    );
  }
}
