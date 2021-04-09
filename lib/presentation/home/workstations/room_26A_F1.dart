import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:where_am_i/core/utils/styles.dart';
import 'package:where_am_i/core/utils/workstations_code_converter.dart';
import 'package:where_am_i/domain/blocs/workstation/watcher/workstation_watcher_bloc.dart';
import 'package:where_am_i/presentation/core/centered_loading.dart';
import 'package:where_am_i/presentation/core/retry_widget.dart';
import 'package:where_am_i/presentation/home/workstations/desk.dart';
import 'package:where_am_i/presentation/responsive_builder.dart';

const R26A_FLOOR1_ROOM1_1_INDEX = 76;
const R26A_FLOOR1_ROOM1_2_INDEX = 82;
const R26A_FLOOR1_ROOM2_INDEX = 88;
const room_1_2_desks_number = 6;
const room_3_desks_number = 4;

class Room26AF1 extends StatelessWidget {
  final codeConverter = WorkstationCodesConverter();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkstationWatcherBloc, WorkstationWatcherState>(
      builder: (_, state) {
        return state.map(
          initial: (_) => Container(),
          loadInProgress: (_) => CenteredLoading(),
          loadFailure: (_) => RetryWidget(
            onTryAgainPressed: () => context.read<WorkstationWatcherBloc>().add(
                  WorkstationWatcherEvent.fetchPresences(DateTime.now()),
                ),
          ),
          loadSuccess: (successState) {
            return ResponsiveBuilder(
                mobile: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 16, bottom: 8),
                      child: Text('Stanza 1', style: roomLabelStyle),
                    ),
                    _build26ARoom1(successState),
                    Padding(
                      padding: const EdgeInsets.only(top: 16, bottom: 8),
                      child: Text('Stanza 2', style: roomLabelStyle),
                    ),
                    _build26ARoom2(successState)
                  ],
                ),
                tabletOrDesktop: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Flexible(
                      flex: 1,
                      child: LayoutBuilder(
                          builder: (context, constraints) => SizedBox(
                                width: constraints.maxWidth -
                                    (constraints.maxWidth * 0.25),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8.0),
                                      child: Text('Stanza 1',
                                          style: roomLabelStyle),
                                    ),
                                    _build26ARoom1(successState),
                                  ],
                                ),
                              )),
                    ),
                    Flexible(
                        flex: 1,
                        child: LayoutBuilder(
                          builder: (context, constraints) => SizedBox(
                            width: constraints.maxWidth -
                                (constraints.maxWidth * 0.3),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child:
                                      Text('Stanza 2', style: roomLabelStyle),
                                ),
                                _build26ARoom2(successState),
                              ],
                            ),
                          ),
                        ))
                  ],
                ));
          },
        );
      },
    );
  }

  Widget _build26ARoom1(value) {
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
            children: List.generate(
              room_1_2_desks_number,
              (index) {
                final newWorkstationCode = codeConverter
                    .toOldWorkstationCode(R26A_FLOOR1_ROOM1_1_INDEX + index);
                final workstationForDesk = value.usersWithWorkstations
                    .where((element) =>
                        element.workstation?.codeWorkstation ==
                        newWorkstationCode.toString())
                    .toList();
                return Desk(
                  usersWithWorkstations: workstationForDesk,
                  workstationCode: newWorkstationCode,
                );
              },
            ),
          ),
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
            children: List.generate(
              room_1_2_desks_number,
              (index) {
                final newWorkstationCode = codeConverter
                    .toOldWorkstationCode(R26A_FLOOR1_ROOM2_INDEX + index);
                final workstationForDesk = value.usersWithWorkstations
                    .where((element) =>
                        element.workstation?.codeWorkstation ==
                        newWorkstationCode.toString())
                    .toList();
                return Desk(
                  usersWithWorkstations: workstationForDesk,
                  workstationCode: newWorkstationCode,
                );
              },
            ),
          ),
        )
      ],
    );
  }

  Widget _build26ARoom2(successState) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 60),
      child: GridView.count(
          physics: ScrollPhysics(),
          shrinkWrap: true,
          childAspectRatio: 1 / 1,
          crossAxisCount: 2,
          mainAxisSpacing: 0,
          crossAxisSpacing: 0,
          children: List.generate(
            room_3_desks_number,
            (index) {
              final newWorkstationCode = codeConverter
                  .toOldWorkstationCode(R26A_FLOOR1_ROOM2_INDEX + index);
              final workstationForDesk = successState.usersWithWorkstations
                  .where((element) =>
                      element.workstation?.codeWorkstation ==
                      newWorkstationCode.toString())
                  .toList();
              return Desk(
                usersWithWorkstations: workstationForDesk,
                workstationCode: newWorkstationCode,
              );
            },
          )),
    );
  }
}
