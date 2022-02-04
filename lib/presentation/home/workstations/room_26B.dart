import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:where_am_i/domain/blocs/date_picker/date_picker_cubit.dart';
import 'package:where_am_i/domain/blocs/workstation/watcher/workstation_watcher_bloc.dart';
import 'package:where_am_i/presentation/core/centered_loading.dart';
import 'package:where_am_i/presentation/core/retry_widget.dart';
import 'package:where_am_i/presentation/home/workstations/desk.dart';
import 'package:where_am_i/presentation/responsive_builder.dart';

// the number of the desks to render for the workspace 26B
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
          //workstations fetch in progress, show loading indicator
          loadInProgress: (_) => CenteredLoading(),
          //workstations fetch failed, show the retry button and define his callback
          loadFailure: (_) => RetryWidget(
            onTryAgainPressed: () => context.read<WorkstationWatcherBloc>().add(
                  WorkstationWatcherEvent.fetchPresences(
                    context.read<DatePickerCubit>().state.visualizedDate,
                  ),
                ),
          ),
          //workstations fetch successful, build the 26B workstations
          loadSuccess: (value) {
            final desks = LayoutBuilder(
              builder: (_, constraints) {
                final double deskWidth = (constraints.maxWidth -
                        deskSpacing -
                        windowWidth -
                        windowSpacing) /
                    3;
                return Column(
                  //generate 6 rows, 3 desks for each one
                    children: List.generate(
                        6,
                        (index) => Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                //the workstation code differs from the original android native layout
                                //which was manually numbered on the Y axis
                                // (0-6 from first column, 7-12 for the second, 13-20 for the last one).
                                // To match the enumeration with the flutter loop widget generation,
                                // which generate always workstations with code 0,1,2 for each row,
                                // the index need to be increased with the difference from the
                                // "original vertical index" and the "flutter horizontal index"
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
              // on mobile fill the whole space available
              mobile: desks,
              // on tablet/desktop/web adjust dimensions leaving some space on the sides
              tabletOrDesktop: LayoutBuilder(
                builder: (_, constraints) => Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: constraints.maxWidth * 0.15,
                  ),
                  child: SizedBox(
                    width: constraints.maxWidth,
                    child: desks,
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
