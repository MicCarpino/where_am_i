import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:where_am_i/presentation/bloc/workstation/workstation_bloc.dart';
import 'package:where_am_i/presentation/widgets/circular_loading.dart';
import 'package:where_am_i/presentation/widgets/room_label.dart';
import 'package:where_am_i/presentation/widgets/workstations.dart';

class RoomStaff extends StatelessWidget {
  final Function() onWorkstationTryAgainPressed;
  final Function() onReservationTryAgainPressed;

  RoomStaff(this.onWorkstationTryAgainPressed, this.onReservationTryAgainPressed);

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
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RoomLabel(labelText: 'Dirigenza'),
                  Workstations(
                    quantity: 4,
                    columnsNumber: 3,
                    usersWithWorkstations: state.usersWithWorkstations,
                    startingIndex: 50,
                    onWorkstationUpdated: (workstationSelected) =>
                        _workstationBloc.add(
                          OnWorkstationUpdate(workstation: workstationSelected),
                        ),
                  ),
                  RoomLabel(labelText: 'Amministrazione'),
                  Workstations(
                    quantity:3,
                    columnsNumber: 2,
                    usersWithWorkstations: state.usersWithWorkstations,
                    startingIndex: 56,
                    onWorkstationUpdated: (workstationSelected) =>
                        _workstationBloc.add(
                          OnWorkstationUpdate(workstation: workstationSelected),
                        ),
                  )
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
