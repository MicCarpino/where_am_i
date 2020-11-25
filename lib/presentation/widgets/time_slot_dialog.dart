import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';
import 'package:where_am_i/core/utils/constants.dart';
import 'package:where_am_i/domain/entities/workstation.dart';

enum TimeSlot { morning, evening, fullDay }

class TimeSlotDialog extends StatelessWidget {
  final Workstation workstation;

  TimeSlotDialog(this.workstation);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: _drawButtons(context)),
      ),
    );
  }

  List<Widget> _drawButtons(BuildContext context) {
    //there's already a presence
    if (workstation != null) {
      //current slot = morning slot, showing evening/full day options
      if (workstation.startTime == TIME_SLOT_NINE &&
          workstation.endTime == TIME_SLOT_THIRTEEN) {
        return [
          _buildTimeSlotButton(context, TimeSlot.fullDay),
          _buildTimeSlotButton(context, TimeSlot.evening)
        ];
      } else if (workstation.startTime == TIME_SLOT_FOURTEEN &&
          workstation.endTime == TIME_SLOT_EIGHTEEN) {
        //current slot = evening, showing morning/full day options
        return [
          _buildTimeSlotButton(context, TimeSlot.fullDay),
          _buildTimeSlotButton(context, TimeSlot.morning)
        ];
      } else {
        // current slot = fullDay, showing morning/evening options
        return [
          _buildTimeSlotButton(context, TimeSlot.morning),
          _buildTimeSlotButton(context, TimeSlot.evening)
        ];
      }
    } else {
      //not presences yet, so showing morning/evening option
      return [
        _buildTimeSlotButton(context, TimeSlot.morning),
        _buildTimeSlotButton(context, TimeSlot.evening)
      ];
    }
  }

  _buildTimeSlotButton(BuildContext context, TimeSlot timeSlot) {
    String label = "TUTTO IL GIORNO";
    TimeOfDay startTime = TIME_SLOT_NINE;
    TimeOfDay endTime = TIME_SLOT_EIGHTEEN;
    if (timeSlot == TimeSlot.morning) {
      label = "MATTINA";
      endTime = TIME_SLOT_THIRTEEN;
    } else if (timeSlot == TimeSlot.evening) {
      label = "POMERIGGIO";
      startTime = TIME_SLOT_FOURTEEN;
    }
    return ButtonTheme(
      minWidth: double.infinity,
      height: 100.0,
      child: RaisedButton(
        elevation: 20,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        child: Text(label, style: TextStyle(fontSize: 20, color: Colors.white)),
        onPressed: () => Navigator.pop(
            context, Tuple2<TimeOfDay, TimeOfDay>(startTime, endTime)),
        color: dncBlue,
      ),
    );
  }
}
