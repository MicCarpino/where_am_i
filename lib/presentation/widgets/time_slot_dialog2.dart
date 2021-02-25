import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:where_am_i/core/utils/constants.dart';
import 'package:where_am_i/core/utils/extensions.dart';
import 'package:where_am_i/domain/entities/user.dart';
import 'package:where_am_i/domain/entities/workstation.dart';
import 'package:where_am_i/presentation/widgets/time_slot_dialog.dart';

class TimeSlotDialog2 extends StatefulWidget {
  final DateTime selectedDate;
  final Workstation workstation;
  final User user;

  TimeSlotDialog2({@required this.selectedDate, this.workstation,this.user});

  @override
  _TimeSlotDialog2State createState() => _TimeSlotDialog2State();
}

class _TimeSlotDialog2State extends State<TimeSlotDialog2> {
  final formatter = DateFormat('EEEE d');
  DateTime startingDate;
  DateTime lastDateOfMonth;
  bool startingDateIsBeforeLastDay;

  //checkbox value
  bool _isRangeSelectionActive = false;

  //dropdown selected item
  DateTime _dropDownSelectedDate;
  List<DateTime> _availableDates = [];

  @override
  void initState() {
    super.initState();
    initValues();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      elevation: 10,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _buildTitleSection(),
          //not last day of month and not updating a presence
          if (startingDateIsBeforeLastDay && widget.workstation == null)
            _buildMultiplePresencesSection(),
          _buildButtons(),
        ],
      ),
    );
  }

  Widget _buildMultiplePresencesSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              SizedBox(
                height: 48.0,
                width: 24.0,
                child: Checkbox(
                    value: _isRangeSelectionActive,
                    onChanged: (newValue) => setState(() {
                          _isRangeSelectionActive = newValue;
                          _dropDownSelectedDate = null;
                        })),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  'Presente per più giornate',
                  style: const TextStyle(fontSize: 15),
                ),
              ),
            ],
          ),
          if (_isRangeSelectionActive) _buildDropDownSection()
        ],
      ),
    );
  }

  Widget _buildDropDownSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text("Presente fino a :", style: TextStyle(fontSize: 16)),
        DropdownButton<DateTime>(
          value: _dropDownSelectedDate,
          hint: Text('Ultimo giorno di presenza'),
          items: _availableDates
              .map((date) => new DropdownMenuItem<DateTime>(
                    value: date,
                    child: new Text(formatter.format(date)),
                  ))
              .toList(),
          onChanged: (value) => setState(() => _dropDownSelectedDate = value),
        )
      ],
    );
  }

  Widget _buildButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: TimeSlot.values
            .where((timeSlot) {
              //edit case, generating only options not equals to actual time slot
              if (widget.workstation != null) {
                return timeSlot != widget.workstation.getTimeSlot();
              }
              //displaying all buttons if performing multiple insert
              return _isRangeSelectionActive
                  ? true
                  //else only morning/afternoon buttons
                  : timeSlot != TimeSlot.fullDay;
            })
            .map((timeSlot) => _buildTimeSlotButton(timeSlot))
            .toList(),
      ),
    );
  }

  Widget _buildTimeSlotButton(TimeSlot timeSlot) {
    String label = "TUTTO IL GIORNO";
    if (timeSlot == TimeSlot.morning) {
      label = "MATTINA";
    } else if (timeSlot == TimeSlot.evening) {
      label = "POMERIGGIO";
    }
    return AspectRatio(
      aspectRatio: 2.5,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: MaterialButton(
          elevation: 5,
          color: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: BorderSide(color: Colors.blue)),
          child: Text(
            label,
            style: TextStyle(fontSize: 20, color: Colors.blue),
            textAlign: TextAlign.center,
          ),
          onPressed: () => _closeDialogAndSubmit(timeSlot),
        ),
      ),
    );
  }

  void _closeDialogAndSubmit(TimeSlot timeSlot) {
    List<DateTime> selectedDates = [startingDate];
    if (_dropDownSelectedDate != null) {
      int index = _availableDates.indexOf(_dropDownSelectedDate);
      if (index != -1) {
        selectedDates.addAll(_availableDates.sublist(0, index + 1));
      }
    }
    Navigator.pop(context, {timeSlot:selectedDates});
  }

  Widget _buildTitleSection() {
    String title =
        "${widget.workstation == null ? 'Inserisci' : 'Modifica'} presenza per ${formatter.format(widget.selectedDate)}";

    return Container(
      color: dncLightBlue,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
            child: Text(
              title,
              style: const TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  void initValues() {
    startingDate = widget.selectedDate.zeroed();
    // DateTime month starts from 0, so month+1 is to compensate date "taken" from another Datetime
    // while setting 0 as day automatically turn it in the last day of the month
    lastDateOfMonth =
        new DateTime(startingDate.year, startingDate.month + 1, 0);
    if (lastDateOfMonth.weekday == DateTime.sunday) {
      lastDateOfMonth = new DateTime(
        lastDateOfMonth.year,
        lastDateOfMonth.month,
        lastDateOfMonth.day - 1,
      );
    }
    //startingDate cannot be a value after the last day of the month, so it's
    //only necessary to check if is not equal to the last day
    startingDateIsBeforeLastDay =
        !startingDate.isAtSameMomentAs(lastDateOfMonth);
    if (startingDateIsBeforeLastDay) {
      initDropdownValues();
    }
  }

  void initDropdownValues() {
    DateTime date = startingDate.add(Duration(days: 1));
    //should set to zero othwerwise on legal hour switch the hours is set to 1AM
    while (!date.isAfterTimeLess(lastDateOfMonth)) {
      if (date.weekday != DateTime.saturday &&
          date.weekday != DateTime.sunday) {
        _availableDates.add(date);
      }
      date = date.add(Duration(days: 1));
    }
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
