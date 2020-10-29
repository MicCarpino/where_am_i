import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:where_am_i/core/utils/constants.dart';
import 'package:where_am_i/domain/entities/user_with_workstation.dart';
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
  final _workstationBloc = sl<WorkstationBloc>();
  final _reservationBloc = sl<ReservationsBloc>();

  Room26B(this.visualizedDate, this.onWorkstationTryAgainPressed,
      this.onReservationTryAgainPressed);

  @override
  Widget build(BuildContext context) {
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
          _buildRoom26Events(),
        ]));
  }

  Widget _buildRoom26Workstations(WorkstationBloc _workstationBloc) {
    return BlocConsumer<WorkstationBloc, WorkstationState>(
      cubit: _workstationBloc,
      listener: (context, state) {
        if (state is WorkstationsFetchErrorState) {
          Scaffold.of(context).showSnackBar(SnackBar(
              content: new Text('Si è verificato un errore workstations'),
              duration: new Duration(seconds: 5)));
        }
        if (state is ReservationsFetchErrorState) {
          Scaffold.of(context).showSnackBar(SnackBar(
              content: new Text('Si è verificato un errore reservations'),
              duration: new Duration(seconds: 5)));
        }
      },
      builder: (context, state) {
        if (state is WorkstationsFetchLoadingState) {
          return CircularLoading();
        } else if (state is WorkstationsFetchCompletedState) {
          return _buildWorkstationsWithList(state.usersWithWorkstations);
        }
        return _buildWorkstationsWithList(List<UserWithWorkstation>());
      },
    );
  }

  _buildWorkstationsWithList(List<UserWithWorkstation> workstations) {
    return GridView.count(
        physics: ScrollPhysics(),
        shrinkWrap: true,
        childAspectRatio: 1 / 1,
        crossAxisCount: 3,
        mainAxisSpacing: 0,
        crossAxisSpacing: 15,
        children: List.generate(18, (index) {
          return Workstations(
            usersWithWorkstations: workstations,
            workstationCode: index,
            onWorkstationUpdated: (workstationSelected) => _workstationBloc.add(
              OnWorkstationUpdate(workstation: workstationSelected),
            ),
          );
        }));
  }

  Widget _buildRoom26Events() {
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
          }
          return ReservationsCalendar();
        });
  }
}
