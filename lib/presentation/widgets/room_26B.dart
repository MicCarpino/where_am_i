import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:where_am_i/presentation/bloc/workstation/workstation_bloc.dart';
import 'package:where_am_i/presentation/widgets/event_calendar.dart';
import 'package:where_am_i/presentation/widgets/workstations.dart';

class Room26B extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.all(16),
        child: Column(children: [
          BlocBuilder<WorkstationBloc, WorkstationState>(
            cubit: BlocProvider.of<WorkstationBloc>(context),
            builder: (context, state) {
              if (state is WorkstationsFetchLoadingState) {
                return Center(
                  child: CircularProgressIndicator(backgroundColor: Colors.red),
                );
              } else if (state is WorkstationsFetchCompletedState) {
                final workstations = state.workstationsList;
                return Workstations(
                  quantity: 18,
                  columnsNumber: 3,
                  columnsSpacing: 15,
                  workstations: workstations,
                );
              } else if (state is WorkstationsFetchErrorState) {
                return Center(
                  child:
                      MaterialButton(child: Text('riprova'), onPressed: () {}),
                );
              } else
                return Workstations(
                    quantity: 18, columnsNumber: 3, columnsSpacing: 15);
            },
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text('Saletta riunioni - civico 26'),
            IconButton(icon: Icon(Icons.settings), onPressed: () {})
          ]),
          EventCalendar()
        ]));
  }
}