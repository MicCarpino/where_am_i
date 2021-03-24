import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:where_am_i/core/utils/styles.dart';
import 'package:where_am_i/domain/blocs/workstation/watcher/workstation_watcher_bloc.dart';
import 'package:where_am_i/domain/entities/user_with_workstation.dart';
import 'package:where_am_i/presentation/core/circular_loading.dart';
import 'package:where_am_i/presentation/core/retry_widget.dart';
import 'package:where_am_i/presentation/home/workstations/desk.dart';


class RoomStaff extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
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

  Widget _buildManagementRoom(List<UserWithWorkstation> usersWithWorkstations) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 48.0, vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              flex: 1,
              child: Column(children: [
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
              ])),
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
    );
  }

  Widget _buildAdministrationRoom(
    List<UserWithWorkstation> usersWithWorkstations,
    double screenWidth,
  ) {
    var workstationSize = (screenWidth - 64) / 3;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
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
}
