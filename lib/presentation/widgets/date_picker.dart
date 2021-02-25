import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:where_am_i/core/utils/extensions.dart';
import 'package:where_am_i/core/utils/constants.dart';

class DatePicker extends StatefulWidget {
  final Function(DateTime date) onDateChanged;
  DatePicker(this.onDateChanged);

  @override
  _DatePickerState createState() =>
      _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  DateTime visualizedDate = DateTime.now().zeroed();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: dncLightBlue,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipOval(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                child: SizedBox(
                    width: 50,
                    height: 50,
                    child:
                        Icon(Icons.keyboard_arrow_left, color: Colors.white)),
                onTap: () {
                  setState(() {
                    visualizedDate = visualizedDate.subtract(
                      Duration(
                        days: visualizedDate.weekday == DateTime.monday ? 2 : 1,
                      ),
                    );
                  });
                  widget.onDateChanged(visualizedDate);
                },
              ),
            ),
          ),
          GestureDetector(
              child: Text(DateFormat('EEEE d MMMM').format(visualizedDate),
                  style: TextStyle(color: Colors.white, fontSize: 16)),
              onTap: () => _showCalendar(context)),
          ClipOval(
            child: Material(
              color: Colors.transparent, // button color
              child: InkWell(
                splashColor: dncLightBlue, // inkwell color
                child: SizedBox(
                    width: 40,
                    height: 40,
                    child:
                        Icon(Icons.keyboard_arrow_right, color: Colors.white)),
                onTap: () {
                  setState(() {
                    visualizedDate = visualizedDate.add(
                      Duration(
                        days:
                            visualizedDate.weekday == DateTime.saturday ? 2 : 1,
                      ),
                    );
                  });
                  widget.onDateChanged(visualizedDate);
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  _showCalendar(context) async {
    await showDatePicker(
        context: context,
        initialDate: visualizedDate,
        selectableDayPredicate: (day) => day.weekday != DateTime.sunday,
        firstDate: DateTime.now().subtract(Duration(days: 365)),
        lastDate: DateTime.now().add(Duration(days: 365)),
        locale: const Locale("it", ""),
        builder: (context, child) {
          return Theme(
            data: ThemeData(),
            child: child,
          );
        }).then((selectedDate) {
      if (selectedDate != null) {
        setState(() {
          visualizedDate = selectedDate.zeroed();
          widget.onDateChanged(visualizedDate);
        });
      }
    });
  }
}
