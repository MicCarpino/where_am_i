import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:where_am_i/domain/entities/user_with_workstation.dart';
import 'package:where_am_i/domain/entities/workstation.dart';
import 'package:where_am_i/presentation/bloc/workstation/workstation_bloc.dart';
import 'package:where_am_i/presentation/widgets/workstations.dart';

class Room24 extends StatelessWidget {
  final List<UserWithWorkstation> workstations;

  Room24({this.workstations = const []});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: GridView.count(
              physics: ScrollPhysics(),
              shrinkWrap: true,
              childAspectRatio: 1 / 1,
              crossAxisCount: 2,
              mainAxisSpacing: 0,
              crossAxisSpacing: 0,
              children: List.generate(8, (index) {
                return Workstations(
                    usersWithWorkstations: workstations,
                    workstationCode: 19 + index,
                    onWorkstationUpdated: (workstationSelected) =>
                        _onWorkstationUpdate(context, workstationSelected));
              })),
        ),
        SizedBox(width: 16),
        Expanded(
          child: GridView.count(
              physics: ScrollPhysics(),
              shrinkWrap: true,
              childAspectRatio: 1 / 1,
              crossAxisCount: 2,
              mainAxisSpacing: 0,
              crossAxisSpacing: 0,
              children: List.generate(8, (index) {
                return Workstations(
                    usersWithWorkstations: workstations,
                    workstationCode: 27 + index,
                    onWorkstationUpdated: (workstationSelected) =>
                        _onWorkstationUpdate(context, workstationSelected));
              })),
        )
      ],
    );
  }

  _onWorkstationUpdate(BuildContext context, Workstation workstationSelected) {
    BlocProvider.of<WorkstationBloc>(context)
        .add(OnWorkstationUpdate(workstation: workstationSelected));
  }
}
