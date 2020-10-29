import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:where_am_i/core/utils/styles.dart';
import 'package:where_am_i/domain/entities/user_with_workstation.dart';
import 'package:where_am_i/presentation/bloc/reservation/reservation_bloc.dart';
import 'package:where_am_i/presentation/bloc/workstation/workstation_bloc.dart';
import 'package:where_am_i/presentation/pages/reservation_form_page.dart';
import 'package:where_am_i/presentation/pages/workplaces_page.dart';
import 'package:where_am_i/presentation/widgets/circular_loading.dart';
import 'package:where_am_i/presentation/widgets/reservations_calendar.dart';
import 'package:where_am_i/presentation/widgets/room_24.dart';
import 'package:where_am_i/presentation/widgets/room_26A_F1.dart';
import 'package:where_am_i/presentation/widgets/room_26A_F2.dart';
import 'package:where_am_i/presentation/widgets/room_26B.dart';
import 'package:where_am_i/presentation/widgets/room_staff.dart';

final sl = GetIt.instance;

class WorkplaceBuilder extends StatelessWidget {
  final DateTime visualizedDate;
  final Rooms room;

  WorkplaceBuilder(this.visualizedDate, this.room);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.all(16),
        child: Column(children: [
          BlocBuilder<WorkstationBloc, WorkstationState>(
              cubit: BlocProvider.of<WorkstationBloc>(context),
              builder: (context, state) {
                if (state is WorkstationsFetchLoadingState) {
                  return CircularLoading();
                } else if (state is WorkstationsFetchCompletedState) {
                  return _buildWorkstations(state.usersWithWorkstations);
                }
                //show empty workstations
                return _buildWorkstations(List());
              }),
          ..._buildReservationsSection(context)
        ]));
  }

  _buildWorkstations(List<UserWithWorkstation> usersWithWorkstations) {
    switch (room) {
      case Rooms.room_26B:
        return Room26B(workstations: usersWithWorkstations);
      case Rooms.room_26A_Floor1:
        return Room26AF1(workstations: usersWithWorkstations);
      case Rooms.room_26A_Floor2:
        return Room26AF2(workstations: usersWithWorkstations);
      case Rooms.room_24:
        return Room24(workstations: usersWithWorkstations);
      case Rooms.room_staff:
        return RoomStaff(workstations: usersWithWorkstations);
    }
  }

  _buildReservationsSection(BuildContext context) {
    // ignore: close_sinks
    var reservationsBloc = BlocProvider.of<ReservationsBloc>(context);
    if (room == Rooms.room_26B ||
        room == Rooms.room_26A_Floor1 ||
        room == Rooms.room_24) {
      return [
        //Reservation section title
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text('Saletta riunioni', style: roomLabelStyle),
          IconButton(
              icon:
                  Icon(Icons.add_circle_sharp, color: Colors.black54, size: 32),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BlocProvider.value(
                      value: reservationsBloc,
                      child: ReservationFormPage(
                        reservationDate: visualizedDate,
                        idRoom: room.roomId,
                      ),
                    ),
                  ),
                );
              }),
        ]),
        //Calendar displaying reservations
        BlocBuilder<ReservationsBloc, ReservationState>(
            cubit: reservationsBloc,
            builder: (context, state) {
              if (state is ReservationsFetchLoadingState) {
                return CircularLoading();
              } else if (state is ReservationsFetchCompletedState) {
                return ReservationsCalendar(
                    reservationsList: state.reservationsList
                        .where((element) => element.idRoom == room.roomId)
                        .toList());
              }
              return ReservationsCalendar();
            })
      ];
    } else {
      return [SizedBox.shrink()];
    }
  }
}
