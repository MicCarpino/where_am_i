import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:where_am_i/core/utils/styles.dart';
import 'package:where_am_i/domain/blocs/workstation/watcher/workstation_watcher_bloc.dart';
import 'package:where_am_i/domain/entities/user_with_workstation.dart';
import 'package:where_am_i/presentation/core/centered_loading.dart';
import 'package:where_am_i/presentation/core/retry_widget.dart';
import 'package:where_am_i/presentation/home/workstations/desk.dart';
import 'package:where_am_i/presentation/responsive_builder.dart';

class RoomStaff extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
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
            return ResponsiveBuilder(
              mobile: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 16, bottom: 8),
                    child: Text('Dirigenza', style: roomLabelStyle),
                  ),
                  _buildManagementRoom(value.usersWithWorkstations),
                  Padding(
                    padding: const EdgeInsets.only(top: 16, bottom: 8),
                    child: Text('Amministrazione', style: roomLabelStyle),
                  ),
                  _buildAdministrationRoom(
                      value.usersWithWorkstations, screenWidth)
                ],
              ),
              tabletOrDesktop: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Flexible(
                    flex: 1,
                    child: Container(
                      color: Colors.red,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 16, bottom: 8),
                            child: Text('Dirigenza', style: roomLabelStyle),
                          ),
                          Center(
                              child: _desktopManagement(
                                  value.usersWithWorkstations)),
                        ],
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 16, bottom: 8),
                          child:
                              Text('Amministrazione', style: roomLabelStyle),
                        ),
                        LayoutBuilder(
                          builder: (context, constraints) =>
                          _buildAdministrationRoom(
                              value.usersWithWorkstations,
                              constraints.maxWidth * 0.75),
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

  Widget _buildManagementRoom(List<UserWithWorkstation> usersWithWorkstations) {
    return Container(
      height: 200,
      width: 50,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 48.0, vertical: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                flex: 1,
                child: Column(
                  children: [
                    _autoSizedWorkstation(
                        usersWithWorkstations
                            .where((element) =>
                                element.workstation?.codeWorkstation == '48')
                            .toList(),
                        48),
                    _autoSizedWorkstation(
                        usersWithWorkstations
                            .where((element) =>
                                element.workstation?.codeWorkstation == '49')
                            .toList(),
                        49)
                  ],
                )),
            Expanded(
              flex: 1,
              child: Column(children: [
                _autoSizedWorkstation(
                    usersWithWorkstations
                        .where((element) =>
                            element.workstation?.codeWorkstation == '47')
                        .toList(),
                    47)
              ]),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildAdministrationRoom(
      List<UserWithWorkstation> usersWithWorkstations, double width) {
    var workstationSize = (width - 64) / 3;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(children: [
            Container(
              width: workstationSize,
              child: _autoSizedWorkstation(
                  usersWithWorkstations
                      .where((element) =>
                          element.workstation?.codeWorkstation == '43')
                      .toList(),
                  43),
            ),
            Container(
              width: workstationSize,
              child: _autoSizedWorkstation(
                  usersWithWorkstations
                      .where((element) =>
                          element.workstation?.codeWorkstation == '44')
                      .toList(),
                  44),
            ),
          ]),
          Column(children: [
            SizedBox(height: workstationSize * 2.5),
            Container(
              width: workstationSize,
              child: _autoSizedWorkstation(
                  usersWithWorkstations
                      .where((element) =>
                          element.workstation?.codeWorkstation == '45')
                      .toList(),
                  45),
            )
          ]),
          Column(children: [
            SizedBox(height: workstationSize * 1.25),
            Container(
              width: workstationSize,
              child: _autoSizedWorkstation(
                  usersWithWorkstations
                      .where((element) =>
                          element.workstation?.codeWorkstation == '46')
                      .toList(),
                  46),
            )
          ]),
        ],
      ),
    );
  }

  AspectRatio _autoSizedWorkstation(
    List<UserWithWorkstation> userWithWorkstation,
    int workstationCode,
  ) {
    return AspectRatio(
      aspectRatio: 1,
      child: Desk(
        usersWithWorkstations: userWithWorkstation,
        workstationCode: workstationCode,
      ),
    );
  }

  Widget _desktopManagement(List<UserWithWorkstation> usersWithWorkstations) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container();
      },
    );
  }
}
