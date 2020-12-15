import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:where_am_i/core/utils/workstations_code_converter.dart';
import 'package:where_am_i/domain/entities/user_with_workstation.dart';
import 'package:where_am_i/presentation/widgets/desk.dart';

class Room26B extends StatelessWidget {
  final List<UserWithWorkstation> workstations;
  final bool allowChangesForCurrentDate;

  Room26B({this.workstations = const [], this.allowChangesForCurrentDate});

  final  codeConvert = WorkstationCodesConverter();
  @override
  Widget build(BuildContext context) {
    return GridView.count(
        physics: ScrollPhysics(),
        shrinkWrap: true,
        childAspectRatio: 1 / 1,
        crossAxisCount: 3,
        mainAxisSpacing: 0,
        crossAxisSpacing: 15,
        children: List.generate(18, (index) {
          var newWorkstationCode = codeConvert.convertNewToOldWorkstationCode(index);
          return Desk(
            allUsersWithWorkstation: workstations,
            workstationCode: newWorkstationCode,
            allowChangesForCurrentDate: allowChangesForCurrentDate,
          );
        }));
  }
}
