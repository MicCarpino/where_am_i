import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:where_am_i/core/utils/workstations_code_converter.dart';
import 'package:where_am_i/presentation/bloc/workstation/watcher/workstation_watcher_bloc.dart';
import 'package:where_am_i/presentation/widgets/desk.dart';
import 'package:where_am_i/presentation/widgets/retry_widget.dart';

import '../circular_loading.dart';

const desksNumberForWorkplace26B = 18;

class Room26B extends StatelessWidget {
  final codeConverter = WorkstationCodesConverter();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkstationWatcherBloc, WorkstationWatcherState>(
      builder: (_, state) {
        return state.map(
          initial: (_) => Container(),
          loadInProgress: (_) => CircularLoading(),
          loadSuccess: (value) {
            return GridView.count(
              physics: ScrollPhysics(),
              shrinkWrap: true,
              childAspectRatio: 1 / 1,
              crossAxisCount: 3,
              mainAxisSpacing: 0,
              crossAxisSpacing: 15,
              children: List.generate(
                desksNumberForWorkplace26B,
                (index) {
                  final newWorkstationCode =
                      codeConverter.toOldWorkstationCode(index);
                  final workstationForDesk = value.usersWithWorkstations
                      .where((element) =>
                          element.workstation?.codeWorkstation ==
                          newWorkstationCode.toString()).toList();
                  return Desk(
                    usersWithWorkstations: workstationForDesk,
                    workstationCode: newWorkstationCode,
                  );
                },
              ),
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
