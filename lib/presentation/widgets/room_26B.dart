import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:where_am_i/core/utils/constants.dart';
import 'package:where_am_i/presentation/bloc/reservation/reservation_bloc.dart';
import 'package:where_am_i/presentation/bloc/workstation/workstation_bloc.dart';
import 'package:where_am_i/presentation/pages/reservation_form_page.dart';
import 'package:where_am_i/presentation/widgets/circular_loading.dart';
import 'package:where_am_i/presentation/widgets/reservations_calendar.dart';
import 'package:where_am_i/presentation/widgets/room_label.dart';
import 'package:where_am_i/presentation/widgets/workstations.dart';

class Room26B extends StatelessWidget {
  final DateTime visualizedDate;
  final Function() onWorkstationTryAgainPressed;
  final Function() onReservationTryAgainPressed;

  Room26B(this.visualizedDate, this.onWorkstationTryAgainPressed,
      this.onReservationTryAgainPressed);

  @override
  Widget build(BuildContext context) {
    final _workstationBloc = BlocProvider.of<WorkstationBloc>(context);
    final _reservationBloc = BlocProvider.of<ReservationsBloc>(context);
    return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.all(16),
        child: Column(children: [
          _buildRoom26Workstations(_workstationBloc),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            RoomLabel(labelText: "Saletta riunioni 26/B"),
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
                          idRoom: ROOM_26B_CODE,
                        ),
                      ),
                    ),
                  );
                })
          ]),
          _buildRoom26Events(_reservationBloc),
        ]));
  }

  Widget _buildRoom26Workstations(WorkstationBloc _workstationBloc) {
    return BlocBuilder<WorkstationBloc, WorkstationState>(
      cubit: _workstationBloc,
      builder: (context, state) {
        if (state is WorkstationsFetchLoadingState) {
          return CircularLoading();
        } else if (state is WorkstationsFetchCompletedState) {
          return GridView.count(
              physics: ScrollPhysics(),
              shrinkWrap: true,
              childAspectRatio: 1 / 1,
              crossAxisCount: 3,
              mainAxisSpacing: 0,
              crossAxisSpacing:15,
              children: List.generate(18, (index) {
                return Workstations(
                  usersWithWorkstations: state.usersWithWorkstations,
                  workstationCode: index,
                  onWorkstationUpdated: (workstationSelected) =>
                      _workstationBloc.add(
                    OnWorkstationUpdate(workstation: workstationSelected),
                  ),
                );
              }));
        }
        /* return Workstations(
            quantity: 18,
            columnsNumber: 3,
            columnsSpacing: 15,
            usersWithWorkstations: state.usersWithWorkstations,
            startingIndex: 0,
            onWorkstationUpdated: (workstationSelected) => _workstationBloc.add(
              OnWorkstationUpdate(workstation: workstationSelected),
            ),
          );*/
        else if (state is WorkstationsFetchErrorState) {
          return Center(
            child: MaterialButton(
                child: Text('riprova'),
                onPressed: () => onWorkstationTryAgainPressed()),
          );
        } else {
          return Container();
        }
      },
    );
  }

  Widget _buildRoom26Events(ReservationsBloc _reservationBloc) {
    return BlocBuilder<ReservationsBloc, ReservationState>(
        cubit: _reservationBloc,
        builder: (context, state) {
          if (state is ReservationsFetchLoadingState) {
            return CircularLoading();
          } else if (state is ReservationsFetchCompletedState) {
            return ReservationsCalendar(
                reservationsList: state.reservationsList
                    .where((element) => element.idRoom == 26)
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
