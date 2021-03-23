import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:where_am_i/core/utils/workstations_code_converter.dart';
import 'package:where_am_i/presentation/bloc/workstation/watcher/workstation_watcher_bloc.dart';
import 'package:where_am_i/presentation/widgets/desk.dart';
import 'package:where_am_i/presentation/widgets/retry_widget.dart';

import '../circular_loading.dart';

//starting index
const R24_1_INDEX = 19;
const R24_2_INDEX = 27;
const desksNumberForWorkplace24 = 8;

class Room24 extends StatelessWidget {
  final codeConverter = WorkstationCodesConverter();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkstationWatcherBloc, WorkstationWatcherState>(
      builder: (_, state) {
        return state.map(
          initial: (_) => Container(),
          loadInProgress: (_) => CircularLoading(),
          loadSuccess: (value) {
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
                      desksNumberForWorkplace24,
                      (index) {
                        final newWorkstationCode = codeConverter
                            .toOldWorkstationCode(R24_1_INDEX + index);
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
                      desksNumberForWorkplace24,
                      (index) {
                        final newWorkstationCode = codeConverter
                            .toOldWorkstationCode(R24_2_INDEX + index);
                        var workstationForDesk = value.usersWithWorkstations
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
          },
          loadFailure: (_) => RetryWidget(
            onTryAgainPressed: () => context.read<WorkstationWatcherBloc>().add(
                  WorkstationWatcherEvent.fetchWorkstations(DateTime.now()),
                ),
          ),
        );
      },
    );
  }
}