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
      children: [
        RoomLabel(labelText: 'Dirigenza'),
        _buildAdministrationRoom(),
        RoomLabel(labelText: 'Amministrazione'),
        _buildStaffRoom()
      ],
    );
  }

  Widget _buildAdministrationRoom() {
    return Padding(
      padding: const EdgeInsets.all(32.0),
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

  Widget _buildStaffRoom() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
            flex: 1,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [_autoSizedWorkstation(43), _autoSizedWorkstation(44)],
            )),
        _singleOffsetWorkstation(0.25),
        _singleOffsetWorkstation(0.6),
      ],
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
