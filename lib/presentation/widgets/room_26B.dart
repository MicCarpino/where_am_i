import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:where_am_i/presentation/bloc/reservation/reservation_bloc.dart';
import 'package:where_am_i/presentation/bloc/workstation/workstation_bloc.dart';
import 'package:where_am_i/presentation/widgets/circular_loading.dart';
import 'package:where_am_i/presentation/widgets/event_calendar.dart';
import 'package:where_am_i/presentation/widgets/room_label.dart';
import 'package:where_am_i/presentation/widgets/workstations.dart';

class Room26B extends StatelessWidget {
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
            RoomLabel(labelText: "Saletta riunioni - civico 26"),
            IconButton(icon: Icon(Icons.settings), onPressed: () {})
          ]),
          _buildRoom26Events(_reservationBloc)
        ]));
  }

  Widget _buildRoom26Workstations(WorkstationBloc _workstationBloc) {
    return BlocBuilder<WorkstationBloc, WorkstationState>(
      cubit: _workstationBloc,
      builder: (context, state) {
        if (state is WorkstationsFetchLoadingState) {
          return CircularLoading();
        } else if (state is WorkstationsFetchCompletedState) {
          final workstations = state.workstationsList;
          return Workstations(
            quantity: 18,
            columnsNumber: 3,
            columnsSpacing: 15,
            workstations: workstations,
            startingIndex: 1,
          );
        } else if (state is WorkstationsFetchErrorState) {
          return Center(
            child: MaterialButton(
                child: Text('riprova'),
                onPressed: () {
                  _workstationBloc.add(FetchWorkstationsLists());
                }),
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
            return EventCalendar(reservationsList: state.reservationsList);
          } else if (state is ReservationsFetchErrorState) {
            return Center(
              child: MaterialButton(
                  child: Text('riprova reservations'),
                  onPressed: () {
                    _reservationBloc.add(FetchReservationsList());
                  }),
            );
          } else {
            return Container();
          }
        });
  }
}
