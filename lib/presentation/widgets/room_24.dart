import 'package:flutter/material.dart';
import 'package:where_am_i/core/utils/workstations_code_converter.dart';
import 'package:where_am_i/domain/entities/user_with_workstation.dart';
import 'package:where_am_i/presentation/widgets/desk.dart';

class Room24 extends StatelessWidget {
  final List<UserWithWorkstation> workstations;
  final bool allowChangesForCurrentDate;

  Room24({this.workstations = const [], this.allowChangesForCurrentDate});

  @override
  Widget build(BuildContext context) {
    return Row(
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
              children: List.generate(8, (index) {
                return Desk(
                  allUsersWithWorkstation: workstations,
                  workstationCode: 19 + index,
                  allowChangesForCurrentDate: allowChangesForCurrentDate,
                );
              })),
        ),
        SizedBox(width: 16),
        Expanded(
          child: GridView.count(
              physics: ScrollPhysics(),
              shrinkWrap: true,
              childAspectRatio: 1 / 1,
              crossAxisCount: 2,
              mainAxisSpacing: 0,
              crossAxisSpacing: 0,
              children: List.generate(8, (index) {
                String newCodeWorkstation = WorkstationCodesConverter()
                    .convertNewToOldWorkstationCode(
                    ROOM_24_STARTING_INDEX + index);
                var workstationsForDesk = workstations
                    .where((element) =>
                element.workstation.codeWorkstation == newCodeWorkstation)
                    .toList();
                return Desk(
                  allUsersWithWorkstation: workstationsForDesk,
                  workstationCode: 27 + index,
                  allowChangesForCurrentDate: allowChangesForCurrentDate,
                );
              })),
        )
      ],
    );
  }
}
