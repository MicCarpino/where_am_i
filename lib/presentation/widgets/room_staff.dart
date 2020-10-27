import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:where_am_i/presentation/bloc/workstation/workstation_bloc.dart';
import 'package:where_am_i/presentation/widgets/circular_loading.dart';
import 'package:where_am_i/presentation/widgets/room_label.dart';
import 'package:where_am_i/presentation/widgets/workstations.dart';

class RoomStaff extends StatelessWidget {
  final Function() onWorkstationTryAgainPressed;
  final Function() onReservationTryAgainPressed;

  RoomStaff(
      this.onWorkstationTryAgainPressed, this.onReservationTryAgainPressed);

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
                mainAxisSize: MainAxisSize.max,
                children: [
                  RoomLabel(labelText: 'Dirigenza'),
                  Container(
                    height: 200,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        //left side
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              SizedBox(
                                width: 100,
                                height: 100,
                                child: Workstations(
                                  usersWithWorkstations:
                                      state.usersWithWorkstations,
                                  workstationCode: 48,
                                  onWorkstationUpdated: (workstationSelected) =>
                                      _workstationBloc.add(
                                    OnWorkstationUpdate(
                                        workstation: workstationSelected),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 100,
                                height: 100,
                                child: Workstations(
                                  usersWithWorkstations:
                                      state.usersWithWorkstations,
                                  workstationCode: 49,
                                  onWorkstationUpdated: (workstationSelected) =>
                                      _workstationBloc.add(
                                    OnWorkstationUpdate(
                                        workstation: workstationSelected),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        //right side
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 100,
                                height: 100,
                                child: Workstations(
                                  usersWithWorkstations:
                                      state.usersWithWorkstations,
                                  workstationCode: 47,
                                  onWorkstationUpdated: (workstationSelected) =>
                                      _workstationBloc.add(
                                    OnWorkstationUpdate(
                                        workstation: workstationSelected),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  RoomLabel(labelText: 'Amministrazione'),
                  Container(
                    height: 350,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              width: 100,
                              height: 100,
                              child: Workstations(
                                usersWithWorkstations:
                                    state.usersWithWorkstations,
                                workstationCode: 43,
                                onWorkstationUpdated: (workstationSelected) =>
                                    _workstationBloc.add(
                                  OnWorkstationUpdate(
                                      workstation: workstationSelected),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 100,
                              height: 100,
                              child: Workstations(
                                usersWithWorkstations:
                                    state.usersWithWorkstations,
                                workstationCode: 44,
                                onWorkstationUpdated: (workstationSelected) =>
                                    _workstationBloc.add(
                                  OnWorkstationUpdate(
                                      workstation: workstationSelected),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SizedBox(
                              width: 100,
                              height: 100,
                              child: Workstations(
                                usersWithWorkstations:
                                    state.usersWithWorkstations,
                                workstationCode: 46,
                                onWorkstationUpdated: (workstationSelected) =>
                                    _workstationBloc.add(
                                  OnWorkstationUpdate(
                                      workstation: workstationSelected),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 100,
                              height: 100,
                              child: Workstations(
                                usersWithWorkstations:
                                    state.usersWithWorkstations,
                                workstationCode: 45,
                                onWorkstationUpdated: (workstationSelected) =>
                                    _workstationBloc.add(
                                  OnWorkstationUpdate(
                                      workstation: workstationSelected),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
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
