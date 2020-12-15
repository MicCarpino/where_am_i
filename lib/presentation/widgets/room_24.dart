import 'package:flutter/material.dart';
import 'package:where_am_i/core/utils/workstations_code_converter.dart';
import 'package:where_am_i/domain/entities/user_with_workstation.dart';
import 'package:where_am_i/presentation/widgets/desk.dart';

const R24_1_INDEX = 19;
const R24_2_INDEX = 27;

class Room24 extends StatelessWidget {
  final List<UserWithWorkstation> workstations;
  final bool allowChangesForCurrentDate;

  Room24({this.workstations = const [], this.allowChangesForCurrentDate});

  final codeConvert = WorkstationCodesConverter();

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
                int newCodeWorkstation =
              codeConvert.convertNewToOldWorkstationCode(
                  R24_1_INDEX + index);
                return Desk(
                  allUsersWithWorkstation: workstations,
                  workstationCode: newCodeWorkstation,
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
                int newCodeWorkstation =
                    codeConvert.convertNewToOldWorkstationCode(
                        R24_2_INDEX + index);
                var workstationsForDesk = workstations
                    .where((element) =>
                        element.workstation.codeWorkstation ==
                        newCodeWorkstation.toString())
                    .toList();
                return Desk(
                  allUsersWithWorkstation: workstationsForDesk,
                  workstationCode: newCodeWorkstation,
                  allowChangesForCurrentDate: allowChangesForCurrentDate,
                );
              })),
        )
      ],
    );
  }
}
