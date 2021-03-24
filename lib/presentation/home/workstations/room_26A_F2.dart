import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:where_am_i/core/utils/styles.dart';
import 'package:where_am_i/core/utils/workstations_code_converter.dart';
import 'package:where_am_i/domain/blocs/workstation/watcher/workstation_watcher_bloc.dart';
import 'package:where_am_i/domain/entities/user_with_workstation.dart';
import 'package:where_am_i/presentation/core/circular_loading.dart';
import 'package:where_am_i/presentation/core/retry_widget.dart';
import 'package:where_am_i/presentation/home/workstations/desk.dart';

const ROOM_26AF2_STARTING_INDEX = 70;
const ROOM_1_STARTING_INDEX = 50;
const ROOM_2_STARTING_INDEX = 56;
const ROOM_3_STARTING_INDEX = 64;
const ROOM_4_STARTING_INDEX = 70;

const ROOM_1_DESKS_NUMBER = 6;
const ROOM_2_DESKS_NUMBER = 8;
const ROOM_3_DESKS_NUMBER = 6;
const ROOM_4_DESKS_NUMBER = 6;

class Room26AF2 extends StatelessWidget {
  final codeConverter = WorkstationCodesConverter();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkstationWatcherBloc, WorkstationWatcherState>(
      builder: (_, state) {
        return state.map(
          initial: (_) => Container(),
          loadInProgress: (_) => CircularLoading(),
          loadSuccess: (value) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 16, bottom: 8),
                  child: Text('Stanza 1', style: roomLabelStyle),
                ),
                _build26AF2Room1(value.usersWithWorkstations),
                Padding(
                  padding: const EdgeInsets.only(top: 16, bottom: 8),
                  child: Text('Stanza 2', style: roomLabelStyle),
                ),
                _build26AF2Room2(value.usersWithWorkstations),
                Padding(
                  padding: const EdgeInsets.only(top: 16, bottom: 8),
                  child: Text('Stanza 3', style: roomLabelStyle),
                ),
                _build26AF2Room3(value.usersWithWorkstations),
                Padding(
                  padding: const EdgeInsets.only(top: 16, bottom: 8),
                  child: Text('Stanza 4', style: roomLabelStyle),
                ),
                _build26AF2Room4(value.usersWithWorkstations),
              ],
            );
          },
          loadFailure: (_) => RetryWidget(
            onTryAgainPressed: () => context.read<WorkstationWatcherBloc>().add(
                  WorkstationWatcherEvent.fetchPresences(DateTime.now()),
                ),
          ),
        );
      },
    );
  }

  Widget _build26AF2Room1(List<UserWithWorkstation> allUsersWithWorkstations) {
    return GridView.count(
        physics: ScrollPhysics(),
        shrinkWrap: true,
        childAspectRatio: 1 / 1,
        crossAxisCount: 3,
        mainAxisSpacing: 0,
        crossAxisSpacing: 0,
        children: List.generate(ROOM_1_DESKS_NUMBER, (index) {
          final newWorkstationCode = ROOM_1_STARTING_INDEX + index;
          final workstationForDesk = allUsersWithWorkstations
              .where((element) =>
                  element.workstation?.codeWorkstation ==
                  newWorkstationCode.toString())
              .toList();
          return Desk(
            usersWithWorkstations: workstationForDesk,
            workstationCode: newWorkstationCode,
          );
        }));
  }

  Widget _build26AF2Room2(List<UserWithWorkstation> allUsersWithWorkstations) {
    return GridView.count(
        physics: ScrollPhysics(),
        shrinkWrap: true,
        childAspectRatio: 1 / 1,
        crossAxisCount: 4,
        mainAxisSpacing: 0,
        crossAxisSpacing: 0,
        children: List.generate(ROOM_2_DESKS_NUMBER, (index) {
          final newWorkstationCode = ROOM_2_STARTING_INDEX + index;
          final workstationForDesk = allUsersWithWorkstations
              .where((element) =>
                  element.workstation?.codeWorkstation ==
                  newWorkstationCode.toString())
              .toList();
          return Desk(
            usersWithWorkstations: workstationForDesk,
            workstationCode: newWorkstationCode,
          );
        }));
  }

  Widget _build26AF2Room3(List<UserWithWorkstation> allUsersWithWorkstations) {
    return GridView.count(
        physics: ScrollPhysics(),
        shrinkWrap: true,
        childAspectRatio: 1 / 1,
        crossAxisCount: 3,
        mainAxisSpacing: 0,
        crossAxisSpacing: 0,
        children: List.generate(ROOM_3_DESKS_NUMBER, (index) {
          final newWorkstationCode = ROOM_3_STARTING_INDEX + index;
          final workstationForDesk = allUsersWithWorkstations
              .where((element) =>
                  element.workstation?.codeWorkstation ==
                  newWorkstationCode.toString())
              .toList();
          return Desk(
            usersWithWorkstations: workstationForDesk,
            workstationCode: newWorkstationCode,
          );
        }));
  }

  Widget _build26AF2Room4(List<UserWithWorkstation> allUsersWithWorkstations) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 50),
      child: GridView.count(
          physics: ScrollPhysics(),
          shrinkWrap: true,
          childAspectRatio: 1 / 1,
          crossAxisCount: 2,
          mainAxisSpacing: 0,
          crossAxisSpacing: 0,
          children: List.generate(ROOM_4_DESKS_NUMBER, (index) {
            final newWorkstationCode = ROOM_4_STARTING_INDEX + index;
            final workstationForDesk = allUsersWithWorkstations
                .where((element) =>
                    element.workstation?.codeWorkstation ==
                    newWorkstationCode.toString())
                .toList();
            return Desk(
              usersWithWorkstations: workstationForDesk,
              workstationCode: newWorkstationCode,
            );
          })),
    );
  }
}
