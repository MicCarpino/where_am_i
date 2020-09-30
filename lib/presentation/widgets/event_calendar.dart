import 'package:flutter/material.dart';
import 'package:flutter_week_view/flutter_week_view.dart';
import 'package:where_am_i/core/utils/constants.dart';
import 'package:where_am_i/domain/entities/reservation.dart';

class EventCalendar extends StatelessWidget {
  final List<Reservation> reservationsList;

  EventCalendar({@required this.reservationsList});

  @override
  Widget build(BuildContext context) {
    return DayView(
      userZoomable: false,
      style: _getDayViewStyle(),
      hoursColumnStyle: _getHoursColumnStyle(),
      date: DateTime.now(),
      minimumTime: HourMinute(hour: 8, minute: 50),
      maximumTime: HourMinute(hour: 18, minute: 10),
      events: reservationsList!=null? reservationsList.map((e) => _mapReservationToEvent(e)).toList() : [],
    );
  }

  FlutterWeekViewEvent _mapReservationToEvent(Reservation reservation) {
    var date = DateTime.parse(reservation.reservationDate);
   return FlutterWeekViewEvent(
      decoration: BoxDecoration(
          color: reservation.status == 0
              ? dncTransparentBlue
              : dncOrangeTransparent,
          border:
              Border.all(color: reservation.status == 0 ? dncBlue : dncOrange),
          borderRadius: BorderRadius.circular(5)),
      textStyle: TextStyle(
          color: reservation.status == 0 ? Colors.black54 : Colors.white,
          fontWeight: FontWeight.bold),
      title: reservation.description,
      description: "",
      start: DateTime(date.year, date.month, date.day, reservation.startHour,
          reservation.startMinutes, 0, 0, 0),
      // start: DateTime.now().subtract(Duration(hours: 6)),
      end: DateTime(date.year, date.month, date.day, reservation.endHour,
          reservation.endMinutes, 0, 0, 0),
    );
  }

  HoursColumnStyle _getHoursColumnStyle() {
    return HoursColumnStyle(
        color: Colors.transparent,
        decoration: BoxDecoration(
            border:
                Border(right: BorderSide(color: Colors.black54, width: 1))));
  }

  DayViewStyle _getDayViewStyle() {
    return DayViewStyle(
        headerSize: 0,
        backgroundColor: Colors.transparent,
        backgroundRulesColor: Colors.black26);
  }
}
