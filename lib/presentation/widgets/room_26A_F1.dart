import 'package:flutter/material.dart';
import 'package:where_am_i/domain/entities/user_with_workstation.dart';
import 'package:where_am_i/presentation/widgets/room_label.dart';
import 'package:where_am_i/presentation/widgets/workstations.dart';

class Room26AF1 extends StatelessWidget {
  final List<UserWithWorkstation> workstations;

  Room26AF1({this.workstations = const []});

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
                      return Workstations(
                        usersWithWorkstations: workstations,
                        workstationCode: 76 + index,
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
                      return Workstations(
                        usersWithWorkstations: workstations,
                        workstationCode: 82 + index,
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
                return Workstations(
                  usersWithWorkstations: workstations,
                  workstationCode: 88 + index,
                );
              })),
        ),
      ],
    );
  }
}
