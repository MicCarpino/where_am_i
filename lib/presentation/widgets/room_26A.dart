import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:where_am_i/presentation/bloc/workstation/workstation_bloc.dart';
import 'package:where_am_i/presentation/widgets/workstations.dart';

class Room26A extends StatelessWidget {
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
              return Center(
                child: CircularProgressIndicator(backgroundColor: Colors.red),
              );
            } else if (state is WorkstationsFetchCompletedState) {
              final workstations = state.workstationsList;
              return Column(
                children: [
                  Text('Stanza 1'),
                  Workstations(
                      quantity: 6,
                      columnsNumber: 3,
                      workstations: workstations,
                      startingIndex: 50),
                  Text('Stanza 2'),
                  Workstations(
                      quantity: 8,
                      columnsNumber: 4,
                      workstations: workstations,
                      startingIndex: 56),
                  Text('Stanza 3'),
                  Workstations(
                      quantity: 6,
                      columnsNumber: 3,
                      workstations: workstations,
                      startingIndex: 64),
                  Text('Stanza 4'),
                  Workstations(
                    quantity: 6,
                    columnsNumber: 2,
                    workstations: workstations,
                    startingIndex: 70,
                  ),
                ],
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
        ));
  }
}
