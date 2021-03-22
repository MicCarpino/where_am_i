import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:where_am_i/core/utils/enums.dart';
import 'package:where_am_i/core/utils/extensions.dart';
import 'package:where_am_i/presentation/bloc/reservation/reservation_bloc.dart';
import 'package:where_am_i/presentation/bloc/workstation/watcher/workstation_watcher_bloc.dart';
import 'package:where_am_i/presentation/bloc/workstation/workstation_bloc.dart';
import 'package:where_am_i/presentation/widgets/date_picker.dart';
import 'package:where_am_i/presentation/widgets/workplace.dart';

class WorkplacesPage extends StatefulWidget {
  WorkplacesPage(this.setTitle);

  final Function(String) setTitle;

  @override
  _WorkplacesPageState createState() => _WorkplacesPageState();
}

class _WorkplacesPageState extends State<WorkplacesPage> {
  DateTime _visualizedDate;

  @override
  void initState() {
    super.initState();
    _visualizedDate = DateTime.now().zeroed();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      DatePicker(this._onDateChanged),
      Expanded(
        child: MultiBlocProvider(
          providers: [
            BlocProvider<WorkstationBloc>(
                create: (context) => sl<WorkstationBloc>()),
            BlocProvider<ReservationsBloc>(
                create: (context) => sl<ReservationsBloc>()),
            BlocProvider<WorkstationWatcherBloc>(
                create: (context) => sl<WorkstationWatcherBloc>()),
          ],
          child: PageView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return WorkplaceBuilder(
                visualizedDate: _visualizedDate,
                room: Rooms.values[index],
              );
            },
            onPageChanged: (pageIndex) {
              widget.setTitle(Rooms.values[pageIndex].roomTitle);
            },
            itemCount: Rooms.values.length,
          ),
        ),
      )
    ]);
  }

  _onDateChanged(DateTime newDate) {
    setState(() => this._visualizedDate = newDate);
    context
        .read<WorkstationWatcherBloc>()
        .add(WorkstationWatcherEvent.fetchWorkstations(newDate));
    context
        .read<ReservationsBloc>()
        .add(FetchReservationsList(dateToFetch: newDate));
  }
}
