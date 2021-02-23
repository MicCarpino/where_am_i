import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:where_am_i/core/utils/extensions.dart';
import 'package:where_am_i/core/utils/enums.dart';
import 'package:where_am_i/presentation/bloc/reservation/reservation_bloc.dart';
import 'package:where_am_i/presentation/bloc/workstation/workstation_bloc.dart';
import 'package:where_am_i/presentation/widgets/date_picker.dart';
import 'package:where_am_i/presentation/widgets/workplace.dart';

final sl = GetIt.instance;

class WorkplacesPage extends StatefulWidget {
  final Function(String) setTitle;

  WorkplacesPage(this.setTitle);

  @override
  _WorkplacesPageState createState() => _WorkplacesPageState();
}

class _WorkplacesPageState extends State<WorkplacesPage> {
  DateTime _visualizedDate;
  bool areModificationsAllowed = false;
  WorkstationBloc _workstationBloc = sl<WorkstationBloc>();
  ReservationsBloc _reservationsBloc = sl<ReservationsBloc>();

  @override
  void initState() {
    _workstationBloc..add(FetchWorkstationsLists(dateToFetch: DateTime.now()));
    _reservationsBloc..add(FetchReservationsList(dateToFetch: DateTime.now()));
    _visualizedDate = DateTime.now().zeroed();
    areModificationsAllowed = DateTime.now().isAfter(_visualizedDate);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      DatePicker(this._onDateChanged),
      Expanded(
        child: MultiBlocProvider(
          providers: [
            BlocProvider<WorkstationBloc>(
                create: (context) => _workstationBloc),
            BlocProvider<ReservationsBloc>(
                create: (context) => _reservationsBloc)
          ],
          child: PageView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              switch (index) {
                case 0:
                  return WorkplaceBuilder(_visualizedDate, Rooms.room_26B);
                case 1:
                  return WorkplaceBuilder(
                      _visualizedDate, Rooms.room_26A_Floor1);
                case 2:
                  return WorkplaceBuilder(
                      _visualizedDate, Rooms.room_26A_Floor2);
                case 3:
                  return WorkplaceBuilder(_visualizedDate, Rooms.room_24);
                case 4:
                  return WorkplaceBuilder(_visualizedDate, Rooms.room_staff);
                default:
                  return Container();
              }
            },
            onPageChanged: (pageIndex) {
              switch (pageIndex) {
                case 0:
                  widget.setTitle("Civico 26/B");
                  break;
                case 1:
                  widget.setTitle("Civico 26/A 1°piano");
                  break;
                case 2:
                  widget.setTitle("Civico 26/A 2°piano");
                  break;
                case 3:
                  widget.setTitle("Civico 24");
                  break;
                case 4:
                  widget.setTitle("Dirigenza/Amministrazione");
                  break;
              }
            },
            itemCount: 5,
          ),
        ),
      )
    ]);
  }

  _onDateChanged(DateTime newDate) {
    setState(() {
      this._visualizedDate = newDate;
    });
    _workstationBloc.add(FetchWorkstationsLists(dateToFetch: newDate));
    _reservationsBloc.add(FetchReservationsList(dateToFetch: newDate));
  }

  @override
  void dispose() {
    _workstationBloc.close();
    _reservationsBloc.close();
    super.dispose();
  }
}
