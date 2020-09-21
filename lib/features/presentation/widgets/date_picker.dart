import 'package:flutter/material.dart';
import 'file:///C:/Users/DNC/FlutterProjects/where_am_i/lib/core/utils/constants.dart';

class DatePicker extends StatefulWidget {
  @override
  _DatePickerState createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
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
                  print('-');
                },
              ),
            ),
          ),
          GestureDetector(
              child: Text('Martedì 15 settembre 2020',
                  style: TextStyle(color: Colors.white, fontSize: 16)),
              onTap: () {
                _showCalendar(context);
              }),
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
                  print('+');
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
        initialDate: DateTime.now(),
        firstDate: DateTime.now().subtract(Duration(days: 365)),
        lastDate: DateTime(2021).add(Duration(days: 365)),
        locale: const Locale("it", ""),
        builder: (context, child) {
          return Theme(
            data: ThemeData(),
            child: child,
          );
        }).then((selectedDate) {
      print(selectedDate);
    });
  }
}
