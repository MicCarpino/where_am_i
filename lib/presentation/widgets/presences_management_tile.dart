import 'package:flutter/material.dart';
import 'package:where_am_i/core/utils/constants.dart';
import 'package:where_am_i/domain/entities/user_with_workstation.dart';

class CustomListItem extends StatelessWidget {
  final UserWithWorkstation userWithWorkstation;
  final Function() onSingleClick;
  final Function() onLongClick;
  final Function(int status) onStatusButtonClick;

  const CustomListItem({
    @required this.userWithWorkstation,
     @required this.onSingleClick,
    @required this.onLongClick,
    @required this.onStatusButtonClick,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onSingleClick,
      onLongPress:  onLongClick,
      child: Row(children: [
        Expanded(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    userWithWorkstation.user != null
                        ? "${userWithWorkstation.user?.surname} ${userWithWorkstation.user?.name}"
                        : userWithWorkstation.workstation.freeName,
                    style: TextStyle(
                        color: userWithWorkstation.workstation != null
                            ? Colors.black
                            : Colors.black38,
                        fontSize: 16),
                  ),
                  SizedBox(height: 8),
                  Text(
                    userWithWorkstation.workstation != null
                        ? "${userWithWorkstation.workstation?.startTime?.format(context)} - ${userWithWorkstation.workstation?.endTime?.format(context)}"
                        : "${TIME_SLOT_NINE.format(context)} - ${TIME_SLOT_EIGHTEEN.format(context)}",
                    style: TextStyle(
                        color: userWithWorkstation.workstation != null
                            ? Colors.black
                            : Colors.black38,
                        fontSize: 14),
                  ),
                ],
              ),
            ),
          ),
        ),
        userWithWorkstation?.workstation?.status == WORKSTATION_STATUS_PENDING
            ? Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      FloatingActionButton(
                          backgroundColor: Colors.green,
                          child: Icon(
                            Icons.check,
                            color: Colors.white,
                          ),
                          onPressed:  onStatusButtonClick(0)),
                      SizedBox(width: 8.0),
                      FloatingActionButton(
                          backgroundColor: Colors.red,
                          child: Icon(
                            Icons.clear,
                            color: Colors.white,
                          ),
                          onPressed: onStatusButtonClick(0))
                    ],
                  ),
                ),
              )
            : Container(),
      ]),
    );
  }
}
