import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:where_am_i/domain/entities/user_with_workstation.dart';
import 'package:where_am_i/presentation/bloc/workstation/workstation_bloc.dart';
import 'package:where_am_i/presentation/widgets/circular_loading.dart';
import 'package:where_am_i/presentation/widgets/room_label.dart';
import 'package:where_am_i/presentation/widgets/workstations.dart';

class Room26AF2 extends StatelessWidget {
  final Function() onWorkstationTryAgainPressed;
  final Function() onReservationTryAgainPressed;

  final _workstationBloc = sl<WorkstationBloc>();

  Room26AF2(
      this.onWorkstationTryAgainPressed, this.onReservationTryAgainPressed);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.all(16),
        child: BlocConsumer<WorkstationBloc, WorkstationState>(
          cubit: _workstationBloc,
          listener: (context, state) {
            if (state is WorkstationsFetchErrorState) {
              Scaffold.of(context).showSnackBar(SnackBar(
                  content: new Text('Si è verificato un errore'),
                  duration: new Duration(seconds: 5)));
            }
          },
          builder: (context, state) {
            if (state is WorkstationsFetchLoadingState) {
              return CircularLoading();
            } else if (state is WorkstationsFetchCompletedState) {
              _buildWorkstationsWithList(state.usersWithWorkstations);
            }
            return _buildWorkstationsWithList(List<UserWithWorkstation>());
          },
        ));
  }

  _buildWorkstationsWithList(List<UserWithWorkstation> workstations) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RoomLabel(labelText: 'Stanza 1'),
        GridView.count(
            physics: ScrollPhysics(),
            shrinkWrap: true,
            childAspectRatio: 1 / 1,
            crossAxisCount: 3,
            mainAxisSpacing: 0,
            crossAxisSpacing: 0,
            children: List.generate(6, (index) {
              return Workstations(
                usersWithWorkstations: workstations,
                workstationCode: 50 + index,
                onWorkstationUpdated: (workstationSelected) =>
                    _workstationBloc.add(
                  OnWorkstationUpdate(workstation: workstationSelected),
                ),
              );
            })),
        RoomLabel(labelText: 'Stanza 2'),
        GridView.count(
            physics: ScrollPhysics(),
            shrinkWrap: true,
            childAspectRatio: 1 / 1,
            crossAxisCount: 4,
            mainAxisSpacing: 0,
            crossAxisSpacing: 0,
            children: List.generate(8, (index) {
              return Workstations(
                usersWithWorkstations: workstations,
                workstationCode: 56 + index,
                onWorkstationUpdated: (workstationSelected) =>
                    _workstationBloc.add(
                  OnWorkstationUpdate(workstation: workstationSelected),
                ),
              );
            })),
        RoomLabel(labelText: 'Stanza 3'),
        GridView.count(
            physics: ScrollPhysics(),
            shrinkWrap: true,
            childAspectRatio: 1 / 1,
            crossAxisCount: 3,
            mainAxisSpacing: 0,
            crossAxisSpacing: 0,
            children: List.generate(6, (index) {
              return Workstations(
                usersWithWorkstations: workstations,
                workstationCode: 64 + index,
                onWorkstationUpdated: (workstationSelected) =>
                    _workstationBloc.add(
                  OnWorkstationUpdate(workstation: workstationSelected),
                ),
              );
            })),
        RoomLabel(labelText: 'Stanza 4'),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 50),
          child: GridView.count(
              physics: ScrollPhysics(),
              shrinkWrap: true,
              childAspectRatio: 1 / 1,
              crossAxisCount: 2,
              mainAxisSpacing: 0,
              crossAxisSpacing: 0,
              children: List.generate(6, (index) {
                return Workstations(
                  usersWithWorkstations: workstations,
                  workstationCode: 70 + index,
                  onWorkstationUpdated: (workstationSelected) =>
                      _workstationBloc.add(
                    OnWorkstationUpdate(workstation: workstationSelected),
                  ),
                );
              })),
        )
      ],
    );
  }
}
