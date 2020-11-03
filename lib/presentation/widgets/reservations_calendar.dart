import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_week_view/flutter_week_view.dart';
import 'package:get_it/get_it.dart';
import 'package:where_am_i/core/utils/constants.dart';
import 'package:where_am_i/core/utils/styles.dart';
import 'package:where_am_i/domain/entities/reservation.dart';
import 'package:where_am_i/domain/entities/user.dart';
import 'package:where_am_i/presentation/bloc/reservation/reservation_bloc.dart';
import 'package:where_am_i/presentation/pages/reservation_form_page.dart';
import 'package:where_am_i/presentation/widgets/reservations_details_dialog.dart';
import 'package:where_am_i/user_service.dart';

//https://pub.dev/packages/flutter_week_view

class ReservationsCalendar extends StatelessWidget {
  final List<Reservation> reservationsList;
  final bool allowChangesForCurrentDate;

  final serviceLocator = GetIt.instance;

  ReservationsCalendar(
      {this.reservationsList = const [], this.allowChangesForCurrentDate});

  @override
  Widget build(BuildContext context) {
    ReservationsBloc _reservationBloc =
        BlocProvider.of<ReservationsBloc>(context);
    User loggedUser = serviceLocator<UserService>().getLoggedUser;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: DayView(
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
        events: reservationsList
                ?.map((e) => _mapReservationToEvent(
                    e, context, _reservationBloc, loggedUser))
                ?.toList() ??
            [],
      ),
    );
  }

  FlutterWeekViewEvent _mapReservationToEvent(Reservation reservation,
      BuildContext context, ReservationsBloc bloc, User loggedUser) {
    var date = DateTime.now();
    return FlutterWeekViewEvent(
      decoration: BoxDecoration(
          color: reservation.status == RESERVATION_PENDING
              ? dncLightBlue
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
        fontWeight: FontWeight.bold,
      ),
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
      onLongPress: () {
        //allow reservation edit if:
        // - is not a reservation for past days
        // - logged user role is staff or admin
        // - the reservation is not confirmed and the user is the handler
        if (allowChangesForCurrentDate &&
            (loggedUser.idRole >= ROLE_STAFF ||
                (reservation.status == RESERVATION_PENDING &&
                    loggedUser.idResource ==
                        reservation.idHandler.toString()))) {
          return showDialog(
              context: context,
              builder: (BuildContext context) {
                return _showEditReservationOptions(
                    reservation, context, bloc, loggedUser.idRole);
              });
        } else {
          return null;
        }
      },
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

  Dialog _showEditReservationOptions(Reservation reservation,
      BuildContext context, ReservationsBloc bloc, int loggedUserRole) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            loggedUserRole >= ROLE_STAFF
                ? InkWell(
                    child: Row(children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                            reservation.status == RESERVATION_PENDING
                                ? 'CONFERMA'
                                : 'REVOCA',
                            style: boldStyle),
                      ),
                    ]),
                    onTap: () {
                      bloc.add(UpdateReservationEvent(
                          updatedReservation: Reservation(
                              idReservation: reservation.idReservation,
                              startHour: reservation.startHour,
                              startMinutes: reservation.startMinutes,
                              endHour: reservation.endHour,
                              endMinutes: reservation.endMinutes,
                              participants: reservation.participants,
                              idRoom: reservation.idRoom,
                              freeHandler: reservation.freeHandler,
                              description: reservation.description,
                              reservationDate: reservation.reservationDate,
                              idHandler: reservation.idHandler,
                              status: reservation.status == RESERVATION_PENDING
                                  ? RESERVATION_CONFIRMED
                                  : RESERVATION_PENDING)));
                      Navigator.of(context).pop();
                    })
                : Container(),
            InkWell(
                child: Row(children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text('MODIFICA', style: boldStyle),
                  ),
                ]),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BlocProvider.value(
                        value: bloc,
                        child: ReservationFormPage(reservation: reservation),
                      ),
                    ),
                  );
                }),
            InkWell(
                child: Row(children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text('ELIMINA', style: boldStyle),
                  ),
                ]),
                onTap: () {
                  bloc.add(DeleteReservationEvent(
                      idReservation: reservation.idReservation));
                  Navigator.of(context).pop();
                }),
          ],
        ),
      ),
    );
  }
}
