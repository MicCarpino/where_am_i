import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:where_am_i/domain/entities/user_with_workstation.dart';
import 'package:where_am_i/presentation/bloc/workstation/workstation_bloc.dart';
import 'package:where_am_i/presentation/widgets/workstations.dart';

class Room26B extends StatelessWidget {
  final List<UserWithWorkstation> workstations;

  Room26B({this.workstations = const []});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
        physics: ScrollPhysics(),
        shrinkWrap: true,
        childAspectRatio: 1 / 1,
        crossAxisCount: 3,
        mainAxisSpacing: 0,
        crossAxisSpacing: 15,
        children: List.generate(18, (index) {
          return Workstations(
            usersWithWorkstations: workstations,
            workstationCode: index,
            onWorkstationUpdated: (workstationSelected) =>
                BlocProvider.of<WorkstationBloc>(context).add(
                      OnWorkstationUpdate(workstation: workstationSelected)));
        }));
  }
}
