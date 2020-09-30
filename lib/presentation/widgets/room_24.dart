import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:where_am_i/presentation/bloc/workstation/workstation_bloc.dart';
import 'package:where_am_i/presentation/widgets/event_calendar.dart';
import 'package:where_am_i/presentation/widgets/workstations.dart';

class Room24 extends StatelessWidget {
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
            return Column(
              children: [
                Row(
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
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Saletta riunioni - Civico 24'),
                    IconButton(
                      icon: Icon(Icons.settings),
                      onPressed: () {},
                    ),
                  ],
                ),
                EventCalendar()
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
      ),
    );
  }
}
