import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:where_am_i/presentation/bloc/reservation/reservation_bloc.dart';
import 'package:where_am_i/presentation/bloc/workstation/workstation_bloc.dart';
import 'package:where_am_i/presentation/widgets/date_picker.dart';
import 'package:where_am_i/presentation/widgets/room_24.dart';
import 'package:where_am_i/presentation/widgets/room_26A.dart';
import 'package:where_am_i/presentation/widgets/room_26B.dart';

final sl = GetIt.instance;

class HomePage extends StatefulWidget {
  final void Function(String title) _setAppBarTitle;

  HomePage(this._setAppBarTitle);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> pages;
  DateTime _visualizedDate = DateTime.now();
  WorkstationBloc _workstationBloc = sl<WorkstationBloc>();
  ReservationsBloc _reservationsBloc = sl<ReservationsBloc>();

  @override
  void initState() {
    _workstationBloc..add(FetchWorkstationsLists(dateToFetch: DateTime.now()));
    _reservationsBloc..add(FetchReservationsList(dateToFetch: DateTime.now()));
    pages = [
      Room26B(_onWorkstationTryAgainPressed, _onReservationTryAgainPressed),
      Room26A(_onWorkstationTryAgainPressed, _onReservationTryAgainPressed),
      Room24(_onWorkstationTryAgainPressed, _onReservationTryAgainPressed),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      DatePicker(this._onDateChanged),
      Expanded(
        child: PageView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return MultiBlocProvider(providers: [
              BlocProvider<WorkstationBloc>(
                  create: (context) => _workstationBloc),
              BlocProvider<ReservationsBloc>(
                  create: (context) => _reservationsBloc)
            ], child: pages[index]);
          },
          onPageChanged: (pageIndex) {
            switch (pageIndex) {
              case 0:
                this.widget._setAppBarTitle("CIVICO 26/B");
                break;
              case 1:
                widget._setAppBarTitle("CIVICO 26/A");
                break;
              case 2:
                widget._setAppBarTitle("CIVICO 24");
                break;
            }
          },
          itemCount: pages.length,
        ),
      ),
    ]);
  }

  _onDateChanged(DateTime newDate) {
    print("Home onDateChanged ${newDate.toString()}");
    this._visualizedDate = newDate;
    _workstationBloc.add(FetchWorkstationsLists(dateToFetch: newDate));
    _reservationsBloc.add(FetchReservationsList(dateToFetch: newDate));
  }

  _onWorkstationTryAgainPressed() {
    _workstationBloc
        .add(FetchWorkstationsLists(dateToFetch: this._visualizedDate));
  }

  _onReservationTryAgainPressed() {
    _reservationsBloc
        .add(FetchReservationsList(dateToFetch: this._visualizedDate));
  }

  @override
  void dispose() {
    _workstationBloc.close();
    _reservationsBloc.close();
    super.dispose();
  }
}
