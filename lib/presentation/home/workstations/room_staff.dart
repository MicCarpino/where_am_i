import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:where_am_i/core/utils/styles.dart';
import 'package:where_am_i/domain/blocs/date_picker/date_picker_cubit.dart';
import 'package:where_am_i/domain/blocs/workstation/watcher/workstation_watcher_bloc.dart';
import 'package:where_am_i/presentation/core/centered_loading.dart';
import 'package:where_am_i/presentation/core/retry_widget.dart';
import 'package:where_am_i/presentation/home/workstations/desk.dart';
import 'package:where_am_i/presentation/responsive_builder.dart';

//check room_26B.dart for details on how the workstations are built
class RoomStaff extends StatelessWidget {
  final double windowSpacing = 40;
  final double windowWidth = 2.5;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkstationWatcherBloc, WorkstationWatcherState>(
      builder: (_, state) {
        return state.map(
          initial: (_) => Container(),
          loadInProgress: (_) => CenteredLoading(),
          loadFailure: (_) => RetryWidget(
            onTryAgainPressed: () => context.read<WorkstationWatcherBloc>().add(
                  WorkstationWatcherEvent.fetchPresences(
                    context.read<DatePickerCubit>().state.visualizedDate,
                  ),
                ),
          ),
          loadSuccess: (value) {
            return ResponsiveBuilder(
              mobile: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8, bottom: 8),
                    child: Text('Dirigenza', style: roomLabelStyle),
                  ),
                  _buildManagementRoom(),
                  Padding(
                    padding: const EdgeInsets.only(top: 16, bottom: 8),
                    child: Text('Amministrazione', style: roomLabelStyle),
                  ),
                  _buildAdministrationRoom()
                ],
              ),
              tabletOrDesktop: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Flexible(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 16, bottom: 16),
                          child: Text('Dirigenza', style: roomLabelStyle),
                        ),
                        LayoutBuilder(
                          builder: (context, constraints) => SizedBox(
                            width: constraints.maxWidth / 1.5,
                            child: _buildManagementRoom(),
                          ),
                        )
                      ],
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 16, bottom: 8),
                          child: Text('Amministrazione', style: roomLabelStyle),
                        ),
                        LayoutBuilder(
                          builder: (context, constraints) =>
                              _buildAdministrationRoom(),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildManagementRoom() {
    return LayoutBuilder(
      builder: (_, constraints) {
        final double deskWidth = (constraints.maxWidth) / 2.5;
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Column(children: [
            Container(
              width: deskWidth * 2,
              height: windowWidth,
              color: Colors.cyan,
            ),
            SizedBox(height: windowSpacing),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                    child: Column(
                  children: [
                    Desk(workstationCode: 48, width: deskWidth),
                    Desk(workstationCode: 49, width: deskWidth),
                  ],
                )),
                Flexible(
                    child: Column(
                  children: [
                    Desk(workstationCode: 47, width: deskWidth),
                  ],
                )),
              ],
            )
          ]),
        );
      },
    );
  }

  Widget _buildAdministrationRoom() {
    return LayoutBuilder(
      builder: (_, constraints) {
        final double deskWidth = (constraints.maxWidth) / 3.5;
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Column(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                Container(
                  width: deskWidth * 2,
                  height: windowWidth,
                  color: Colors.cyan,
                ),
                SizedBox(
                  width: 50,
                )
              ]),
              SizedBox(height: windowSpacing),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                      child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Desk(workstationCode: 43, width: deskWidth),
                      Desk(workstationCode: 44, width: deskWidth),
                    ],
                  )),
                  Flexible(
                      child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: deskWidth * 2.45),
                      Desk(workstationCode: 45, width: deskWidth),
                    ],
                  )),
                  Flexible(
                      child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: deskWidth * 1.25),
                      Desk(workstationCode: 46, width: deskWidth),
                    ],
                  )),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
