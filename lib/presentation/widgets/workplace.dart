import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:where_am_i/core/utils/styles.dart';
import 'package:where_am_i/core/utils/extensions.dart';
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
    bool allowChangesForCurrentDate =
        visualizedDate.isAtSameMomentOrAfter(DateTime.now().zeroed());
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
                  return _buildWorkstations(
                      state.usersWithWorkstations, allowChangesForCurrentDate);
                }
                //show empty workstations
                return _buildWorkstations(List(), false);
              }),
          SizedBox(height: 10),
          ..._buildReservationsSection(context, allowChangesForCurrentDate)
        ]));
  }

  _buildWorkstations(List<UserWithWorkstation> usersWithWorkstations,
      bool allowChangesForCurrentDate) {
    switch (room) {
      case Rooms.room_26B:
        var room26BWorkstations = usersWithWorkstations.where((element) {
          if (element.workstation.codeWorkstation != null) {
            int parsedCode = int.tryParse(element.workstation.codeWorkstation);
            return parsedCode >= 1 && parsedCode <= 18;
          }
          return false;
        }).toList();
        return Room26B(
          workstations: room26BWorkstations ?? [],
          allowChangesForCurrentDate: allowChangesForCurrentDate,
        );
      case Rooms.room_26A_Floor1:
        var room26AF1Workstations = usersWithWorkstations.where((element) {
          if (element.workstation.codeWorkstation != null) {
            int parsedCode = int.tryParse(element.workstation.codeWorkstation);
            return parsedCode >= 76 && parsedCode <= 91;
          }
          return false;
        }).toList();
        return Room26AF1(
          workstations: room26AF1Workstations ?? [],
          allowChangesForCurrentDate: allowChangesForCurrentDate,
        );
      case Rooms.room_26A_Floor2:
        var room26AF2Workstations = usersWithWorkstations.where((element) {
          if (element.workstation.codeWorkstation != null) {
            int parsedCode = int.tryParse(element.workstation.codeWorkstation);
            return parsedCode >= 50 && parsedCode <= 75;
          }
          return false;
        }).toList();
        return Room26AF2(
          workstations: room26AF2Workstations ?? [],
          allowChangesForCurrentDate: allowChangesForCurrentDate,
        );
      case Rooms.room_24:
        var room26AF2Workstations = usersWithWorkstations.where((element) {
          if (element.workstation.codeWorkstation != null) {
            int parsedCode = int.tryParse(element.workstation.codeWorkstation);
            return parsedCode >= 19 && parsedCode <= 34;
          }
          return false;
        }).toList();
        return Room24(
          workstations: room26AF2Workstations ?? [],
          allowChangesForCurrentDate: allowChangesForCurrentDate,
        );
      case Rooms.room_staff:
        var roomStaffWorkstations = usersWithWorkstations.where((element) {
          if (element.workstation.codeWorkstation != null) {
            int parsedCode = int.tryParse(element.workstation.codeWorkstation);
            return parsedCode >= 43 && parsedCode <= 49;
          }
          return false;
        }).toList();
        return RoomStaff(
          workstations: roomStaffWorkstations ?? [],
          allowChangesForCurrentDate: allowChangesForCurrentDate,
        );
    }
  }

  _buildReservationsSection(
      BuildContext context, bool allowChangesForCurrentDate) {
    // ignore: close_sinks
    var reservationsBloc = BlocProvider.of<ReservationsBloc>(context);
    if (room == Rooms.room_26B ||
        room == Rooms.room_26A_Floor1 ||
        room == Rooms.room_24) {
      return [
        //Reservation section title
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text('Saletta riunioni', style: roomLabelStyle),
          //show/hide "add reservation" button for past days
          Visibility(
            visible:
                visualizedDate.isAtSameMomentOrAfter(DateTime.now().zeroed()),
            child: IconButton(
                icon: Icon(Icons.add_circle_sharp,
                    color: Colors.black54, size: 32),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BlocProvider.value(
                        value: reservationsBloc,
                        child: ReservationFormPage(
                          reservationDate: visualizedDate,
                          idRoom: room.reservationRoomId,
                        ),
                      ),
                    ),
                  );
                }),
          ),
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
                      .where(
                          (element) => element.idRoom == room.reservationRoomId)
                      .toList(),
                  allowChangesForCurrentDate: allowChangesForCurrentDate,
                );
              }
              return ReservationsCalendar();
            })
      ];
    } else {
      return [SizedBox.shrink()];
    }
  }
}
