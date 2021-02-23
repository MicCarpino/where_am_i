import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:where_am_i/core/usecases/usecase.dart';
import 'package:where_am_i/core/utils/constants.dart';
import 'package:where_am_i/core/utils/extensions.dart';
import 'package:where_am_i/domain/entities/user.dart';
import 'package:where_am_i/domain/entities/workstation.dart';

enum TimeSlot { fullDay, morning, evening }

class TimeSlotDialog extends StatefulWidget {
  final Workstation workstation;
  final DateTime selectedDate;
  final User user;

  TimeSlotDialog({
    @required this.workstation,
    @required this.selectedDate,
    this.user,
  });

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
  List<DateTime> _availableDates = [];

  @override
  void initState() {
    super.initState();
    startingDate = widget.selectedDate.zeroed();
    // DateTime month starts from 0, so month+1 is to compensate date "taken" from another Datetime
    // while setting 0 as day automatically turn it in the last day of the month
    lastDateOfMonth = new DateTime(
      startingDate.year,
      startingDate.month + 1,
      0,
    );
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
    while (!date.isAfter(lastDateOfMonth)) {
      if (date.weekday != DateTime.saturday &&
          date.weekday != DateTime.sunday) {
        _availableDates.add(date);
      }
      date = date.add(Duration(days: 1));
    }
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
          if (startingDateIsBeforeLastDay && widget.workstation == null)
            _buildMultiplePresencesSection(),
          _buildButtonsSection(),
        ],
      ),
    );
  }

  Widget _buildMultiplePresencesSection() {
    return Column(
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
              padding: const EdgeInsets.all(8.0),
              child: Text('Presente per più giornate'),
            ),
          ],
        ),
        _isRangeSelectionActive
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text("Presente fino a :", style: TextStyle(fontSize: 16)),
                  _buildDropDown()
                ],
              )
            : Container()
      ],
    );
  }

  Widget _buildDropDown() {
    return DropdownButton<DateTime>(
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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: _buildButtons(),
      ),
    );
  }

  List<Widget> _buildButtons() {
    var buttonsToBuild = TimeSlot.values.where((element) {
      if (widget.workstation != null) {
        var workstationTimeSlot = getWorkstationTimeSlot(widget.workstation);
        //skipping full day
        if (element == workstationTimeSlot) {
          return false;
        }
      } else if (element == TimeSlot.fullDay && !_isRangeSelectionActive) {
        return false;
      }
      return true;
    });
    return buttonsToBuild.map((e) => _buildTimeSlotButton(context, e)).toList();
  }

  Widget _buildTimeSlotButton(BuildContext context, TimeSlot timeSlot) {
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
    return AspectRatio(
      aspectRatio: 2.5,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: RaisedButton(
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
            onPressed: () {
              if (widget.workstation?.status == WORKSTATION_STATUS_REFUSED) {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text("Attenzione"),
                        content: Text(
                            "La presenza per questa risorsa è stata rifiutata. Confermando verranno apportate le modifiche e lo stato della richiesta verrà automaticamente confermato."),
                        actions: [
                          FlatButton(
                              child: Text("Annulla"),
                              onPressed: () => Navigator.pop(context)),
                          FlatButton(
                              child: Text("OK"),
                              onPressed: () {
                                Navigator.pop(context);
                                _closeDialogAndSubmit(
                                    context, startTime, endTime);
                              })
                        ],
                      );
                    });
              } else {
                _closeDialogAndSubmit(context, startTime, endTime);
              }
            }),
      ),
    );
  }

  void _closeDialogAndSubmit(
      BuildContext context, TimeOfDay startTime, TimeOfDay endTime) {
    List<DateTime> datesList = [startingDate];
    if (_dropDownSelectedDate != null) {
      int index = _availableDates.indexOf(_dropDownSelectedDate);
      if (index != -1) {
        datesList.addAll(_availableDates.sublist(0, index + 1));
      }
    }
    Navigator.pop(
        context,
        datesList
            .map((date) => PresenceNewParameters(
                date: date,
                startTime: startTime,
                endTime: endTime,
                idResource:
                    widget.user?.idResource ?? widget.workstation?.idResource))
            .toList());
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

  Widget _buildTitleSection() {
    String text;
    if (widget.workstation != null) {
      text = "Modifica presenza di ";
      text += widget.user != null
          ? "${widget.user.name} ${widget.user.surname} per ${formatter.format(widget.selectedDate)}"
          : widget.workstation.freeName != null
              ? "${widget.workstation.freeName} per ${formatter.format(widget.selectedDate)}"
              : formatter.format(widget.selectedDate);
    } else {
      text = "Inserisci presenza per ";
      text += widget.user == null
          ? "${formatter.format(widget.selectedDate)}"
          : "${widget.user.surname} ${widget.user.name} per ${formatter.format(widget.selectedDate)}";
    }
    return Container(
      color: dncLightBlue,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
            child: Text(text,maxLines: 2,textAlign: TextAlign.justify,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                )),
          ),
        ],
      ),
    );
  }
}
