import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:where_am_i/presentation/bloc/workstation/workstation_bloc.dart';
import 'package:where_am_i/presentation/widgets/circular_loading.dart';
import 'package:where_am_i/presentation/widgets/room_label.dart';
import 'package:where_am_i/presentation/widgets/workstations.dart';

class Room26A extends StatelessWidget {
  final Function() onWorkstationTryAgainPressed;
  final Function() onReservationTryAgainPressed;

  Room26A(this.onWorkstationTryAgainPressed, this.onReservationTryAgainPressed);

  @override
  Widget build(BuildContext context) {
    final _workstationBloc = BlocProvider.of<WorkstationBloc>(context);
    return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.all(16),
        child: BlocBuilder<WorkstationBloc, WorkstationState>(
          cubit: _workstationBloc,
          builder: (context, state) {
            if (state is WorkstationsFetchLoadingState) {
              return CircularLoading();
            } else if (state is WorkstationsFetchCompletedState) {
              final workstations = state.workstationsList;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RoomLabel(labelText: 'Stanza 1'),
                  Workstations(
                      quantity: 6,
                      columnsNumber: 3,
                      workstations: workstations,
                      startingIndex: 50),
                  RoomLabel(labelText: 'Stanza 2'),
                  Workstations(
                      quantity: 8,
                      columnsNumber: 4,
                      workstations: workstations,
                      startingIndex: 56),
                  RoomLabel(labelText: 'Stanza 3'),
                  Workstations(
                      quantity: 6,
                      columnsNumber: 3,
                      workstations: workstations,
                      startingIndex: 64),
                  RoomLabel(labelText: 'Stanza 4'),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 40),
                    child: Workstations(
                      quantity: 6,
                      columnsNumber: 2,
                      workstations: workstations,
                      startingIndex: 70,
                    ),
                  ),
                ],
              );
            } else if (state is WorkstationsFetchErrorState) {
              return Center(
                child: MaterialButton(
                    child: Text('riprova'),
                    onPressed: () => onWorkstationTryAgainPressed()),
              );
            } else {
              return Container();
            }
          },
        ));
  }
}
