import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:where_am_i/presentation/bloc/reservation/reservation_bloc.dart';
import 'package:where_am_i/presentation/bloc/workstation/workstation_bloc.dart';
import 'package:where_am_i/presentation/widgets/circular_loading.dart';
import 'package:where_am_i/presentation/widgets/reservations_calendar.dart';
import 'package:where_am_i/presentation/widgets/room_label.dart';
import 'package:where_am_i/presentation/widgets/workstations.dart';

class Room24 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _workstationBloc = BlocProvider.of<WorkstationBloc>(context);
    final _reservationBloc = BlocProvider.of<ReservationsBloc>(context);
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          _buildRoom24Workstations(_workstationBloc),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RoomLabel(labelText: 'Saletta riunioni - Civico 24'),
              IconButton(icon: Icon(Icons.settings), onPressed: () {}),
            ],
          ),
          _buildRoom24Events(_reservationBloc)
        ],
      ),
    );
  }

  Widget _buildRoom24Workstations(WorkstationBloc _workstationBloc) {
    return BlocBuilder<WorkstationBloc, WorkstationState>(
      cubit: _workstationBloc,
      builder: (context, state) {
        if (state is WorkstationsFetchLoadingState) {
          return CircularLoading();
        } else if (state is WorkstationsFetchCompletedState) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                  child: Workstations(
                quantity: 8,
                columnsNumber: 2,
                startingIndex: 19,
                workstations: state.workstationsList,
              )),
              SizedBox(width: 16),
              Expanded(
                  child: Workstations(
                quantity: 8,
                columnsNumber: 2,
                startingIndex: 27,
                workstations: state.workstationsList,
              ))
            ],
          );
        } else if (state is WorkstationsFetchErrorState) {
          return Center(
            child: MaterialButton(
                child: Text('riprova workstations'),
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

  Widget _buildRoom24Events(ReservationsBloc _reservationBloc) {
    return BlocBuilder<ReservationsBloc, ReservationState>(
        cubit: _reservationBloc,
        builder: (context, state) {
          if (state is ReservationsFetchLoadingState) {
            return CircularLoading();
          } else if (state is ReservationsFetchCompletedState) {
            return ReservationsCalendar(reservationsList: state.reservationsList);
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
