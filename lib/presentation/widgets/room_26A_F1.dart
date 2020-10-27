import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:where_am_i/core/utils/constants.dart';
import 'package:where_am_i/presentation/bloc/reservation/reservation_bloc.dart';
import 'package:where_am_i/presentation/bloc/workstation/workstation_bloc.dart';
import 'package:where_am_i/presentation/pages/reservation_form_page.dart';
import 'package:where_am_i/presentation/widgets/circular_loading.dart';
import 'package:where_am_i/presentation/widgets/reservations_calendar.dart';
import 'package:where_am_i/presentation/widgets/room_label.dart';
import 'package:where_am_i/presentation/widgets/workstations.dart';

class Room26AF1 extends StatelessWidget {
  final DateTime visualizedDate;
  final Function() onWorkstationTryAgainPressed;
  final Function() onReservationTryAgainPressed;

  Room26AF1(this.visualizedDate, this.onWorkstationTryAgainPressed,
      this.onReservationTryAgainPressed);

  @override
  Widget build(BuildContext context) {
    final _workstationBloc = BlocProvider.of<WorkstationBloc>(context);
    final _reservationBloc = BlocProvider.of<ReservationsBloc>(context);
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          _buildRoom26AF1Workstations(_workstationBloc),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RoomLabel(labelText: 'Saletta riunioni 26/A 1°piano'),
              IconButton(
                  icon: Icon(
                    Icons.add_circle_sharp,
                    color: Colors.black54,
                    size: 32,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BlocProvider.value(
                          value: _reservationBloc,
                          child: ReservationFormPage(
                            reservationDate: visualizedDate,
                            idRoom: ROOM_26A_CODE,
                          ),
                        ),
                      ),
                    );
                  }),
            ],
          ),
          _buildRoom26AEvents(_reservationBloc)
        ],
      ),
    );
  }

  Widget _buildRoom26AF1Workstations(WorkstationBloc _workstationBloc) {
    return BlocBuilder<WorkstationBloc, WorkstationState>(
      cubit: _workstationBloc,
      builder: (context, state) {
        if (state is WorkstationsFetchLoadingState) {
          return CircularLoading();
        } else if (state is WorkstationsFetchCompletedState) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RoomLabel(labelText: 'Stanza 1'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                      child: Workstations(
                    quantity: 6,
                    columnsNumber: 2,
                    startingIndex: 76,
                    usersWithWorkstations: state.usersWithWorkstations,
                    onWorkstationUpdated: (workstationSelected) =>
                        _workstationBloc.add(
                      OnWorkstationUpdate(workstation: workstationSelected),
                    ),
                  )),
                  SizedBox(width: 16),
                  Expanded(
                      child: Workstations(
                    quantity: 6,
                    columnsNumber: 2,
                    startingIndex: 82,
                    usersWithWorkstations: state.usersWithWorkstations,
                    onWorkstationUpdated: (workstationSelected) =>
                        _workstationBloc.add(
                      OnWorkstationUpdate(workstation: workstationSelected),
                    ),
                  ))
                ],
              ),
              RoomLabel(labelText: 'Stanza 2'),
              Padding(
                padding:
                const EdgeInsets.symmetric(vertical: 0, horizontal: 60),
                child: Workstations(
                  quantity: 4,
                  columnsNumber:2,
                  usersWithWorkstations: state.usersWithWorkstations,
                  startingIndex: 88,
                  onWorkstationUpdated: (workstationSelected) =>
                      _workstationBloc.add(
                    OnWorkstationUpdate(workstation: workstationSelected),
                  ),
                ),
              ),
            ],
          );
        } else if (state is WorkstationsFetchErrorState) {
          return Center(
            child: MaterialButton(
                child: Text('riprova workstations'),
                onPressed: () => onWorkstationTryAgainPressed()),
          );
        } else {
          return Container();
        }
      },
    );
  }

  Widget _buildRoom26AEvents(ReservationsBloc _reservationBloc) {
    return BlocBuilder<ReservationsBloc, ReservationState>(
        cubit: _reservationBloc,
        builder: (context, state) {
          if (state is ReservationsFetchLoadingState) {
            return CircularLoading();
          } else if (state is ReservationsFetchCompletedState) {
            return ReservationsCalendar(
                reservationsList: state.reservationsList
                    .where((element) => element.idRoom == ROOM_26A_CODE)
                    .toList());
          } else if (state is ReservationsFetchErrorState) {
            return Center(
              child: MaterialButton(
                  child: Text('riprova reservations'),
                  onPressed: () => onReservationTryAgainPressed()),
            );
          } else {
            return ReservationsCalendar();
          }
        });
  }
}
