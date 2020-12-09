import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tuple/tuple.dart';
import 'package:where_am_i/core/utils/constants.dart';
import 'package:where_am_i/domain/entities/workstation.dart';

enum TimeSlot { morning, evening, fullDay }

//https://pub.dev/packages/dropdown_date_picker
//Intl.defaultLocale = 'it_IT';

class TimeSlotDialog extends StatefulWidget {
  final Workstation workstation;
  final DateTime startingDate = DateTime.now();

  TimeSlotDialog(this.workstation);

  @override
  _TimeSlotDialogState createState() => _TimeSlotDialogState();
}

class _TimeSlotDialogState extends State<TimeSlotDialog> {
  bool _rememberMe = false;
  String _selectedDate;
  final formatter = DateFormat('EEEE d');
  List<String> dates;

  @override
  void initState() {
    dates = [
      formatter.format(widget.startingDate),
      formatter.format(DateTime(2020, 11, 10)),
      formatter.format(DateTime(2020, 11, 11)),
      formatter.format(DateTime(2020, 11, 12)),
      formatter.format(DateTime(2020, 11, 13))
    ];
    _selectedDate = dates.first;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
            children: [..._buildDateSection(), ..._buildButtons(context)]),
      ),
    );
  }

  List<Widget> _buildButtons(BuildContext context) {
    //there's already a presence
    if (widget.workstation != null) {
      //current slot = morning slot, showing evening/full day options
      if (widget.workstation.startTime == TIME_SLOT_NINE &&
          widget.workstation.endTime == TIME_SLOT_THIRTEEN) {
        return [
          _buildTimeSlotButton(context, TimeSlot.fullDay),
          _buildTimeSlotButton(context, TimeSlot.evening)
        ];
      } else if (widget.workstation.startTime == TIME_SLOT_FOURTEEN &&
          widget.workstation.endTime == TIME_SLOT_EIGHTEEN) {
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

  Widget _buildDropDownMenu() {
    var lastDateOfMonth =
        new DateTime(widget.startingDate.year, widget.startingDate.month, 0);
    return DropdownButton<String>(
      value: _selectedDate,
      items: _rememberMe
          ? dates.map((String value) {
              return new DropdownMenuItem<String>(
                value: value,
                child: new Text(value),
              );
            }).toList()
          : null,
      disabledHint: Text('giorno x '),
      onChanged: (value) {
        setState(() {
          _selectedDate = value;
        });
        print(value);
      },
    );
  }

  List<Widget> _buildDateSection() {
    if (widget.workstation == null) {
      return [
        CheckboxListTile(
            contentPadding: const EdgeInsets.all(0),
            title: Text('Presente fino a:'),
            controlAffinity: ListTileControlAffinity.leading,
            value: _rememberMe,
            onChanged: (newValue) {
              setState(() {
                _rememberMe = newValue;
              });
            }),
        _buildDropDownMenu()
      ];
    }
    return List<Widget>();
  }
}
