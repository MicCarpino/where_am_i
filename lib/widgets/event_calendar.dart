import 'package:flutter/material.dart';
import 'package:flutter_week_view/flutter_week_view.dart';
import 'package:where_am_i/utilities/constants.dart';

class EventCalendar extends StatefulWidget {
  @override
  _EventCalendarState createState() => _EventCalendarState();
}

class _EventCalendarState extends State<EventCalendar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: DayView(
          userZoomable: false,
          style: DayViewStyle(
              headerSize: 0,
              backgroundColor: Colors.transparent,
              backgroundRulesColor: Colors.black26),
          hoursColumnStyle: HoursColumnStyle(
              color: Colors.transparent,
              decoration: BoxDecoration(
                  border: Border(
                      right: BorderSide(color: Colors.black54, width: 1)))),
          date: DateTime.now(),
          minimumTime: HourMinute(hour: 8, minute: 50),
          maximumTime: HourMinute(hour: 18, minute: 10),
          events: [
            FlutterWeekViewEvent(
              decoration: BoxDecoration(
                  color: dncOrangeTransparent,
                  border: Border.all(color: dncOrange),
                  borderRadius: BorderRadius.circular(5)),
              textStyle:
                  TextStyle(color: Colors.black54, fontWeight: FontWeight.bold),
              title: 'An event 1',
              description: 'A description 1',
              start: DateTime.now().subtract(Duration(hours: 6)),
              end: DateTime.now().subtract(Duration(hours: 4)),
            ),
            FlutterWeekViewEvent(
              decoration: BoxDecoration(
                  color: dncTransparentBlue,
                  border: Border.all(color: dncBlue),
                  borderRadius: BorderRadius.circular(5)),
              title: 'Another event',
              description: 'A description 1',
              start: DateTime.now().subtract(Duration(hours: 7)),
              end: DateTime.now().subtract(Duration(hours: 4)),
            ),
          ]),
    );
  }
}
