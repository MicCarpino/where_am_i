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
    var screenWidth = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RoomLabel(labelText: 'Dirigenza'),
        _buildManagementRoom(),
        RoomLabel(labelText: 'Amministrazione'),
    _buildAdministrationRoom(screenWidth)
      ],
    );
  }

  Widget _buildManagementRoom() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 48.0, vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              flex: 1,
              child: Column(children: [
                _autoSizedWorkstation(48),
                _autoSizedWorkstation(49)
              ])),
          Expanded(
            flex: 1,
            child: Column(children: [_autoSizedWorkstation(47)]),
          )
        ],
      ),
    );
  }

  Widget _buildAdministrationRoom(double screenWidth) {
    var workstationSize = (screenWidth - 64) / 3;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(children: [
            Container(
              width: workstationSize,
              child: _autoSizedWorkstation(43),
            ),
            Container(
              width: workstationSize,
              child: _autoSizedWorkstation(43),
            ),
          ]),
          Column(children: [
            SizedBox(height: workstationSize*2.5),
            Container(
              width: workstationSize,
              child: _autoSizedWorkstation(43),
            )
          ]),Column(children: [
            SizedBox(height: workstationSize*1.25),
            Container(
              width: workstationSize,
              child: _autoSizedWorkstation(43),
            )
          ]),
        ],
      ),
    );
  }

  AspectRatio _autoSizedWorkstation(int code) {
    return AspectRatio(
      aspectRatio: 1,
      child: Desk(
        allUsersWithWorkstation: workstations
            .where((element) =>
                element.workstation.codeWorkstation == code.toString())
            .toList(),
        workstationCode: code,
        allowChangesForCurrentDate: allowChangesForCurrentDate,
      ),
    );
  }

  Expanded _singleOffsetWorkstation(double offset) {
    return Expanded(
        flex: 1,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            //just empty autosized container that push down the proper widget
            Flexible(
                flex: 1,
                child: Row(children: [
                  Flexible(
                      child:
                          AspectRatio(aspectRatio: offset, child: Container()))
                ])),
            Flexible(flex: 1, child: _autoSizedWorkstation(46)),
          ],
        ));
  }
}
