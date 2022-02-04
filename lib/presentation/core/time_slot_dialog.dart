import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:where_am_i/core/utils/constants.dart';
import 'package:where_am_i/core/utils/enums.dart';
import 'package:where_am_i/core/utils/extensions.dart';
import 'package:where_am_i/domain/entities/user.dart';
import 'package:where_am_i/domain/entities/workstation.dart';
import 'package:where_am_i/presentation/responsive_builder.dart';

//dialog for presences time slot selection
class TimeSlotDialog extends StatefulWidget {
  final DateTime selectedDate;
  final Workstation workstation;
  final User user;

  TimeSlotDialog({@required this.selectedDate, this.workstation, this.user});

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

  //dropdown selected date
  DateTime _dropDownSelectedDate;
  List<DateTime> _availableDates = [];

  @override
  void initState() {
    super.initState();
    initValues();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder.buildDialog(
      context,
      SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            _buildTitleSection(),
            // resource name indication
            if (widget.user != null || widget.workstation?.freeName != null)
              _buildNameSection(),
            //not last day of month and not updating a presence
            if (startingDateIsBeforeLastDay && widget.workstation == null)
              _buildMultiplePresencesSection(),
            // morning/afternoon buttons
            _buildButtons(),
          ],
        ),
      ),
    );
  }

  //checkbox for multiple days presences
  Widget _buildMultiplePresencesSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
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
          //dropdown with dates available to the end of month
          if (_isRangeSelectionActive) ...[
            Text("Presente fino a :", style: TextStyle(fontSize: 16)),
            DropdownButton<DateTime>(
              isExpanded: false,
              value: _dropDownSelectedDate,
              hint: Text('Ultimo giorno di presenza'),
              items: _availableDates
                  .map((date) => new DropdownMenuItem<DateTime>(
                        value: date,
                        child: new Text(formatter.format(date)),
                      ))
                  .toList(),
              onChanged: (value) =>
                  setState(() => _dropDownSelectedDate = value),
            )
          ]
        ],
      ),
    );
  }

  //title of the dialog with action (insert/edit) and resource name indications
  Widget _buildTitleSection() {
    String title =
        "${widget.workstation == null ? 'Inserisci' : 'Modifica'} presenza per ${formatter.format(widget.selectedDate)}";
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      color: dncLightBlue,
      padding: EdgeInsets.all(16),
      child: Text(
        title,
        style: const TextStyle(fontSize: 18, color: Colors.white),
      ),
    );
  }

  //time slot buttons
  Widget _buildButtons() {
    final buttons = TimeSlot.values
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
        .toList();
    return ResponsiveBuilder(
      mobile: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: buttons,
      ),
      tabletOrDesktop: Container(
        width: double.infinity,
        child: Wrap(alignment: WrapAlignment.center, children: buttons),
      ),
    );
  }

  Widget _buildTimeSlotButton(TimeSlot timeSlot) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: MaterialButton(
        padding: EdgeInsets.all(36),
        elevation: 5,
        color: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: BorderSide(color: Colors.blue)),
        child: Text(
          timeSlot.label,
          style: TextStyle(fontSize: 20, color: Colors.blue),
          textAlign: TextAlign.center,
        ),
        onPressed: () => _closeDialogAndSubmit(timeSlot),
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
    Navigator.pop(context, {timeSlot: selectedDates});
  }

  void initValues() {
    startingDate = widget.selectedDate.zeroed();
    // DateTime month starts from 0, so month+1 is to compensate date "taken" from another Datetime
    // while setting 0 as day value automatically turn it in the last day of the month
    lastDateOfMonth =
        new DateTime(startingDate.year, startingDate.month + 1, 0);
    if (lastDateOfMonth.weekday == DateTime.saturday) {
      lastDateOfMonth = new DateTime(
        lastDateOfMonth.year,
        lastDateOfMonth.month,
        lastDateOfMonth.day - 1,
      );
    }
    if (lastDateOfMonth.weekday == DateTime.sunday) {
      lastDateOfMonth = new DateTime(
        lastDateOfMonth.year,
        lastDateOfMonth.month,
        lastDateOfMonth.day - 2,
      );
    }
    //startingDate cannot be a value after or equal to the last day of the month, so it's
    //only necessary to check if is not equal to the last day
    startingDateIsBeforeLastDay = startingDate.isBeforeTimeLess(lastDateOfMonth);
    print('is before $startingDateIsBeforeLastDay');
    if (startingDateIsBeforeLastDay) {
      initDropdownValues();
    }
  }

  void initDropdownValues() {
    DateTime date = startingDate.add(Duration(days: 1));
    //should set to zero otherwise on legal hour switch the hour value will be set to 1AM
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

  _buildNameSection() {
    String title;
    if (widget.user != null) {
      title = '${widget.user.surname} ${widget.user.name}';
    } else {
      title = widget.workstation.freeName;
    }
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Text(title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          )),
    );
  }
}
