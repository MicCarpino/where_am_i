import 'package:flutter/material.dart';
import 'package:where_am_i/core/usecases/usecase.dart';
import 'package:where_am_i/core/utils/constants.dart';
import 'package:where_am_i/domain/entities/user_with_workstation.dart';

class PresencesManagementTile extends StatelessWidget {
  final UserWithWorkstation userWithWorkstation;
  final Function() onSingleClick;
  final Function() onLongClick;
  final Function(WorkstationStatusParameters newStatusParams)
      onStatusButtonClick;

  const PresencesManagementTile({
    @required this.userWithWorkstation,
    @required this.onSingleClick,
    @required this.onLongClick,
    @required this.onStatusButtonClick,
  });

  @override
  Widget build(BuildContext context) {
    //this inkwell is just for splash animation
    return InkWell(
      onTap: () => null,
      onLongPress: () => null,
      child: Row(children: [
        _buildResourceSection(context),
        userWithWorkstation?.workstation?.status == WORKSTATION_STATUS_PENDING
            ? _buildButtons()
            : userWithWorkstation?.workstation?.status ==
                    WORKSTATION_STATUS_REFUSED
                ? _buildRefusedIcon()
                : Container()
      ]),
    );
  }

  Widget _buildResourceSection(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onSingleClick,
        onLongPress: onLongClick,
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildNameSection(),
              SizedBox(height: 8),
              userWithWorkstation.workstation != null
                  ? _buildTimeSlotSection(context)
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNameSection() {
    return Text(
      userWithWorkstation.getResourceLabel(),
      style: TextStyle(
          color: userWithWorkstation.workstation != null ||
                  userWithWorkstation.workstation?.status ==
                      WORKSTATION_STATUS_CONFIRMED
              ? Colors.black
              : Colors.black38,
          fontSize: 16),
    );
  }

  Widget _buildTimeSlotSection(BuildContext context) {
    TimeOfDay startTime =
        userWithWorkstation.workstation?.startTime ?? TIME_SLOT_NINE;
    TimeOfDay endTime =
        userWithWorkstation.workstation?.endTime ?? TIME_SLOT_EIGHTEEN;
    return Text(
      "${startTime.format(context)} - ${endTime.format(context)}",
      style: TextStyle(color: Colors.black54, fontSize: 14),
    );
  }

  Widget _buildButtons() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            //accept button
            FloatingActionButton(
              backgroundColor: Colors.green,
              child: Icon(
                Icons.check,
                color: Colors.white,
              ),
              onPressed: () => onStatusButtonClick(
                WorkstationStatusParameters(
                  idWorkstation: userWithWorkstation.workstation.idWorkstation,
                  status: WORKSTATION_STATUS_CONFIRMED,
                ),
              ),
            ),
            SizedBox(width: 8.0),
            //refuse button
            FloatingActionButton(
              backgroundColor: Colors.red,
              child: Icon(
                Icons.clear,
                color: Colors.white,
              ),
              onPressed: () => onStatusButtonClick(
                WorkstationStatusParameters(
                  idWorkstation: userWithWorkstation.workstation.idWorkstation,
                  status: WORKSTATION_STATUS_REFUSED,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildRefusedIcon() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Icon(Icons.block, color: Colors.red),
      ),
    );
  }
}
