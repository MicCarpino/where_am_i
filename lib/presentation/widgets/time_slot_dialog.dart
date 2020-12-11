import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tuple/tuple.dart';
import 'package:where_am_i/core/utils/constants.dart';
import 'package:where_am_i/core/utils/extensions.dart';
import 'package:where_am_i/domain/entities/workstation.dart';

enum TimeSlot { morning, evening, fullDay }

//https://pub.dev/packages/dropdown_date_picker
//Intl.defaultLocale = 'it_IT';

class TimeSlotDialog extends StatefulWidget {
  final Workstation workstation;
  final DateTime selectedDate;

  TimeSlotDialog(this.workstation, this.selectedDate);

  @override
  _TimeSlotDialogState createState() => _TimeSlotDialogState();
}

class _TimeSlotDialogState extends State<TimeSlotDialog> {
  final formatter = DateFormat('EEEE d');
  DateTime startingDate;
  DateTime lastDateOfMonth;
  bool startingDateIsBeforeLastDay;

  //checkbox value
  bool _isRangeSelectionActive = false;

  //dropdown selected item
  DateTime _dropDownSelectedDate;
  List<DateTime> _availableDates = List<DateTime>();

  @override
  void initState() {
    super.initState();
    startingDate = widget.selectedDate.zeroed();
    // DateTime month starts from 0, so month+1 is to compensate date "taken" from another Datetime
    // while setting 0 as day automatically turn it in the last day for the month
    lastDateOfMonth =
        new DateTime(startingDate.year, startingDate.month + 1, 0);
    //startingDate cannot be a value after the last day of the month, so it's
    //only necessary to check if is not equal to the last day
    startingDateIsBeforeLastDay =
        !startingDate.isAtSameMomentAs(lastDateOfMonth);
    if (startingDateIsBeforeLastDay) {
      initDropdownValues();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      insetPadding: EdgeInsets.symmetric(horizontal: 48),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [_buildMultiplePresencesSection(), _buildButtonsSection()],
        ),
      ),
    );
  }

  void initDropdownValues() {
    DateTime date = startingDate.add(Duration(days: 1));
    while (!date.isAfter(lastDateOfMonth)) {
      if (date.weekday != DateTime.saturday ||
          date.weekday != DateTime.sunday) {
        _availableDates.add(date);
      }
      date = date.add(Duration(days: 1));
    }
  }

  Widget _buildMultiplePresencesSection() {
    if (startingDateIsBeforeLastDay && widget.workstation == null) {
      return Container(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Checkbox(
                  value: _isRangeSelectionActive,
                  onChanged: (newValue) => setState(() {
                        _isRangeSelectionActive = newValue;
                        _dropDownSelectedDate = null;
                      })),
              Text('Presente per più giornate', style: TextStyle(fontSize: 16))
            ],
          ),
          _isRangeSelectionActive
              ? Column(crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text("Presente fino a :", style: TextStyle(fontSize: 16)),
                    _buildDropDown()
                  ],
                )
              : Container()
        ],
      ));
    } else {
      return Container();
    }
  }

  Widget _buildDropDown() {
    return  DropdownButton<DateTime>(
          value: _dropDownSelectedDate,
          hint: Text('Ultimo giorno di presenza'),
          items: _availableDates
              .map((date) => new DropdownMenuItem<DateTime>(
                    value: date,
                    child: new Text(formatter.format(date)),
                  ))
              .toList(),
          onChanged: (value) {
            setState(() {
              _dropDownSelectedDate = value;
            });
            print(value);
          },
    );
  }

  Widget _buildButtonsSection() {
    return Container(
      height: 400,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: _buildButtons(),
      ),
    );
  }

  List<Widget> _buildButtons() {
    if (widget.workstation != null) {
      var workstationTimeSlot = getWorkstationTimeSlot(widget.workstation);
      return TimeSlot.values.map((e) {
        if (e != workstationTimeSlot) {
          return _buildTimeSlotButton(context, e);
        }
      }).toList();
    } else {
      return TimeSlot.values
          .where((element) {
            //skipping fulld day button if checkbox is not checked
            if (element == TimeSlot.fullDay && !_isRangeSelectionActive) {
              return false;
            }
            return true;
          })
          .map((e) => _buildTimeSlotButton(context, e))
          .toList();
    }
  }

  ButtonTheme _buildTimeSlotButton(BuildContext context, TimeSlot timeSlot) {
    String label = "TUTTO IL GIORNO";
    TimeOfDay startTime = TIME_SLOT_NINE;
    TimeOfDay endTime = TIME_SLOT_EIGHTEEN;
    if (timeSlot == TimeSlot.morning) {
      label = "MATTINA";
      endTime = TIME_SLOT_THIRTEEN;
    } else if (timeSlot == TimeSlot.evening) {
      label = "POMERIGGIO";
      startTime = TIME_SLOT_FOURTEEN;
    } else if (timeSlot == TimeSlot.fullDay) {
      label = "TUTTO IL GIORNO";
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

  TimeSlot getWorkstationTimeSlot(Workstation workstation) {
    if (workstation.startTime == TIME_SLOT_NINE &&
        workstation.endTime == TIME_SLOT_THIRTEEN) {
      return TimeSlot.morning;
    } else if (workstation.startTime == TIME_SLOT_FOURTEEN &&
        workstation.endTime == TIME_SLOT_EIGHTEEN) {
      return TimeSlot.evening;
    } else {
      return TimeSlot.fullDay;
    }
  }
}
