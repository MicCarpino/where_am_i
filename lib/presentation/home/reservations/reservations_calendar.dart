import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_week_view/flutter_week_view.dart';
import 'package:where_am_i/core/utils/constants.dart';
import 'package:where_am_i/core/utils/extensions.dart';
import 'package:where_am_i/core/utils/styles.dart';
import 'package:where_am_i/domain/blocs/authentication/authentication_bloc.dart';
import 'package:where_am_i/domain/blocs/date_picker/date_picker_cubit.dart';
import 'package:where_am_i/domain/blocs/reservation/form/reservation_form_bloc.dart';
import 'package:where_am_i/domain/entities/reservation.dart';
import 'package:where_am_i/presentation/home/reservations/reservations_details_dialog.dart';
import 'package:where_am_i/domain/blocs/reservation/actor/reservation_actor_bloc.dart';

import 'form/reservation_form_page.dart';

//https://pub.dev/packages/flutter_week_view

class ReservationsCalendar extends StatelessWidget {
  final List<Reservation> reservationsList;

  ReservationsCalendar({@required this.reservationsList});

  @override
  Widget build(BuildContext context) {
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
            .map((e) => _mapReservationToEvent(context, e))
            .toList(),
      ),
    );
  }

  FlutterWeekViewEvent _mapReservationToEvent(
      BuildContext context, Reservation reservation) {
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
      description: '',
      start: DateTime.now().zeroed().add(
            Duration(
                hours: reservation.startHour,
                minutes: reservation.startMinutes),
          ),
      end: DateTime.now().zeroed().add(
            Duration(
                hours: reservation.endHour, minutes: reservation.endMinutes),
          ),
      onTap: () => showDialog(
          context: context,
          builder: (BuildContext context) {
            return ReservationDetailsDialog(reservation: reservation);
          }),
      onLongPress: () {
        //allow reservation edit if:
        // - is not a reservation for past days
        final isEditableByDate =
            context.read<DatePickerCubit>().isEditAllowed();
        // - logged user role is staff or admin
        final loggedUser =
            context.read<AuthenticationBloc>().state.authenticatedUser.user;
        final isStaffOrAdmin = loggedUser.idRole >= ROLE_STAFF;
        // - the reservation status is pending and the user is the handler
        final isEditableByUser = reservation.status == RESERVATION_PENDING &&
            loggedUser.idResource == reservation.idHandler.toString();
        if (isEditableByDate && (isStaffOrAdmin || isEditableByUser)) {
          return showDialog(
            context: context,
            builder: (_) => _showEditReservationOptions(
                context, reservation, isStaffOrAdmin),
          );
        }
        return null;
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

  Dialog _showEditReservationOptions(
      BuildContext context, Reservation reservation, bool isStaffOrAdmin) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (isStaffOrAdmin)
              InkWell(
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
                    context.read<ReservationActorBloc>().add(
                        ReservationActorEvent.update(reservation.copyWith(
                            status: reservation.status == RESERVATION_PENDING
                                ? RESERVATION_CONFIRMED
                                : RESERVATION_PENDING)));
                    Navigator.of(context).pop();
                  }),
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
                      builder: (_) => MultiBlocProvider(
                        providers: [
                          BlocProvider.value(
                            value: context.read<AuthenticationBloc>(),
                          ),
                          BlocProvider.value(
                            value: context.read<ReservationActorBloc>(),
                          ),
                          BlocProvider.value(
                            value: context.read<DatePickerCubit>(),
                          ),
                          BlocProvider<ReservationFormBloc>(
                            create: (context) => ReservationFormBloc(
                              reservationActorBloc:
                                  context.read<ReservationActorBloc>(),
                            )..add(ReservationFormEvent.initializeEdit(
                                reservation)),
                          ),
                        ],
                        child: ReservationFormPage(),
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
                  context.read<ReservationActorBloc>().add(
                      ReservationActorEvent.delete(reservation.idReservation));
                  Navigator.of(context).pop();
                }),
          ],
        ),
      ),
    );
  }
}
