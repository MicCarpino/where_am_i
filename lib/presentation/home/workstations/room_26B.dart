import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:where_am_i/domain/blocs/workstation/watcher/workstation_watcher_bloc.dart';
import 'package:where_am_i/presentation/core/centered_loading.dart';
import 'package:where_am_i/presentation/core/retry_widget.dart';
import 'package:where_am_i/presentation/home/workstations/desk.dart';
import 'package:where_am_i/presentation/responsive_builder.dart';

const desksNumberForWorkplace26B = 18;

class Room26B extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double deskSpacing = 10;
    final double windowSpacing = 10;
    final double windowWidth = 2.5;
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
          loadSuccess: (value) {
            final desks = LayoutBuilder(
              builder: (_, constraints) {
                final double deskWidth = (constraints.maxWidth -
                        deskSpacing -
                        windowWidth -
                        windowSpacing) /
                    3;
                return Column(
                    children: List.generate(
                        6,
                        (index) => Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Desk(
                                  width: deskWidth,
                                  workstationCode: index + 1,
                                ),
                                SizedBox(width: deskSpacing),
                                Desk(
                                  width: deskWidth,
                                  workstationCode: index + 7,
                                ),
                                Desk(
                                  width: deskWidth,
                                  workstationCode: index + 13,
                                ),
                                SizedBox(width: windowSpacing),
                                //window
                                Container(
                                  width: windowWidth,
                                  height: deskWidth,
                                  color:
                                      index != 3 ? Colors.cyan : Colors.white,
                                )
                              ],
                            )));
              },
            );
            return ResponsiveBuilder(
              mobile: desks,
              tabletOrDesktop: LayoutBuilder(
                builder: (context, constraints) => SizedBox(
                  width: constraints.maxWidth - (constraints.maxWidth * 0.5),
                  child: desks,
                ),
              ),
            );
          },
        );
      },
    );
  }
}
