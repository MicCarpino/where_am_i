import 'package:flutter/material.dart';
import 'package:flutter_week_view/flutter_week_view.dart';
import 'package:where_am_i/core/utils/constants.dart';
import 'package:where_am_i/core/utils/styles.dart';
import 'package:where_am_i/domain/entities/reservation.dart';
import 'package:where_am_i/presentation/widgets/reservations_details_dialog.dart';

//https://pub.dev/packages/flutter_week_view

class ReservationsCalendar extends StatelessWidget {
  final List<Reservation> reservationsList;

  ReservationsCalendar({@required this.reservationsList});

  @override
  Widget build(BuildContext context) {
    return DayView(
      userZoomable: false,
      style: _getDayViewStyle(),
      hoursColumnStyle: _getHoursColumnStyle(),
      /*library display event basing on date displayed on his header. Since the
       header is disabled the current event date should be set to "today" in
       order to display the events on screen*/
      date: DateTime.now(),
      // +/- 10 minutes to prevent crop
      minimumTime: HourMinute(hour: 8, minute: 50),
      maximumTime: HourMinute(hour: 18, minute: 10),
      events: reservationsList != null
          ? reservationsList
              .map((e) => _mapReservationToEvent(e, context))
              .toList()
          : [],
    );
  }

  FlutterWeekViewEvent _mapReservationToEvent(
      Reservation reservation, BuildContext context) {
    var date = DateTime.now();
    return FlutterWeekViewEvent(
      decoration: BoxDecoration(
          color: reservation.status == RESERVATION_PENDING
              ? dncTransparentBlue
              : dncOrangeTransparent,
          border: Border.all(
              color: reservation.status == RESERVATION_PENDING
                  ? dncBlue
                  : dncOrange),
          borderRadius: BorderRadius.circular(5)),
      textStyle: TextStyle(
          color: reservation.status == RESERVATION_PENDING
              ? Colors.white
              : Colors.black54,
          fontWeight: FontWeight.bold),
      title: reservation.description,
      description: "",
      start: DateTime(date.year, date.month, date.day, reservation.startHour,
          reservation.startMinutes, 0, 0, 0),
      end: DateTime(date.year, date.month, date.day, reservation.endHour,
          reservation.endMinutes, 0, 0, 0),
      onTap: () => showDialog(
          context: context,
          builder: (BuildContext context) {
            return ReservationDetailsDialog(reservation: reservation);
          }),
      onLongPress: () => showDialog(
          context: context,
          builder: (BuildContext context) {
            return _showEditReservationOptions(reservation);
          }),
    );
  }

  HoursColumnStyle _getHoursColumnStyle() {
    return HoursColumnStyle(
        color: Colors.transparent,
        decoration: BoxDecoration(
          border: Border(right: BorderSide(color: Colors.black54, width: 1)),
        ));
  }

  DayViewStyle _getDayViewStyle() {
    return DayViewStyle(
      headerSize: 0,
      backgroundColor: Colors.transparent,
      backgroundRulesColor: Colors.black26,
    );
  }

  Dialog _showEditReservationOptions(Reservation reservation) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            InkWell(
                onTap: () {},
                child: Row(children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text('CONFERMA', style: boldStyle),
                  ),
                ])),
            InkWell(
                onTap: () {},
                child: Row(children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text('MODIFICA', style: boldStyle),
                  ),
                ])),
            InkWell(
                onTap: () {},
                child: Row(children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text('ELIMINA', style: boldStyle),
                  ),
                ])),
          ],
        ),
      ),
    );
  }
}
