import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:where_am_i/core/utils/styles.dart';
import 'package:where_am_i/domain/blocs/date_picker/date_picker_cubit.dart';
import 'package:where_am_i/domain/blocs/workstation/watcher/workstation_watcher_bloc.dart';
import 'package:where_am_i/presentation/core/centered_loading.dart';
import 'package:where_am_i/presentation/core/retry_widget.dart';
import 'package:where_am_i/presentation/home/workstations/desk.dart';

import '../../responsive_builder.dart';

const ROOM_1_STARTING_INDEX = 50;
const ROOM_2_STARTING_INDEX = 56;
const ROOM_3_STARTING_INDEX = 64;
const ROOM_4_STARTING_INDEX = 70;

//check room_26B.dart for details on how the workstations are built
// and how the code conversion works
class Room26AF2 extends StatelessWidget {
  final double windowSpacing = 10;
  final double windowWidth = 2.5;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkstationWatcherBloc, WorkstationWatcherState>(
      builder: (_, state) {
        return state.map(
          initial: (_) => Container(),
          loadInProgress: (_) => CenteredLoading(),
          loadSuccess: (value) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 16),
                  child: Text('Stanza 1', style: roomLabelStyle),
                ),
                _build26AF2Room1(context),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Text('Stanza 2', style: roomLabelStyle),
                ),
                _build26AF2Room2(context),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Text('Stanza 3', style: roomLabelStyle),
                ),
                _build26AF2Room3(context),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Text('Stanza 4', style: roomLabelStyle),
                ),
                _build26AF2Room4(context),
              ],
            );
          },
          loadFailure: (_) => RetryWidget(
            onTryAgainPressed: () => context.read<WorkstationWatcherBloc>().add(
                  WorkstationWatcherEvent.fetchPresences(
                    context.read<DatePickerCubit>().state.visualizedDate,
                  ),
                ),
          ),
        );
      },
    );
  }

  Widget _build26AF2Room1(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        final double deskWidth =
            (constraints.maxWidth - windowWidth - windowSpacing) /
                (ResponsiveBuilder.isMobile(context) ? 3 : 4);
        return Column(children: [
          _buildRow(3, deskWidth, ROOM_1_STARTING_INDEX, true),
          _buildRow(3, deskWidth, ROOM_1_STARTING_INDEX + 3, true),
        ]);
      },
    );
  }

  Widget _build26AF2Room2(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        final double deskWidth =
            (constraints.maxWidth - windowWidth - windowSpacing) /
                (ResponsiveBuilder.isMobile(context) ? 4 : 5);
        return Column(children: [
          _buildRow(4, deskWidth, ROOM_2_STARTING_INDEX, true),
          _buildRow(4, deskWidth, ROOM_2_STARTING_INDEX + 4, true),
        ]);
      },
    );
  }

  Widget _build26AF2Room3(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        final double deskWidth =
            (constraints.maxWidth - windowWidth - windowSpacing) /
                (ResponsiveBuilder.isMobile(context) ? 3 : 4);
        return Column(children: [
          _buildRow(3, deskWidth, ROOM_3_STARTING_INDEX, true),
          _buildRow(3, deskWidth, ROOM_3_STARTING_INDEX + 3, true),
        ]);
      },
    );
  }

  Widget _build26AF2Room4(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        final double deskWidth = constraints.maxWidth /
            (ResponsiveBuilder.isMobile(context) ? 3 : 4);
        return Column(children: [
          Container(
            width: deskWidth * 2,
            height: windowWidth,
            color: Colors.cyan,
          ),
          SizedBox(height: 10),
          _buildRow(2, deskWidth, ROOM_4_STARTING_INDEX),
          _buildRow(2, deskWidth, ROOM_4_STARTING_INDEX + 2),
          _buildRow(2, deskWidth, ROOM_4_STARTING_INDEX + 4),
        ]);
      },
    );
  }

  _buildRow(int desksNumber, double deskWidth, int startingIndex,
      [bool hasWindow = false]) {
    final desks = List<Widget>.generate(
        desksNumber,
        (index) => Desk(
              width: deskWidth,
              workstationCode: startingIndex + index,
            ));
    if (hasWindow) {
      desks.addAll([
        SizedBox(width: windowSpacing),
        Container(width: windowWidth, height: deskWidth, color: Colors.cyan)
      ]);
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: desks,
    );
  }
}
