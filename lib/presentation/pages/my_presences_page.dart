import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import 'package:where_am_i/core/utils/constants.dart';
import 'package:where_am_i/presentation/bloc/workstation/workstation_bloc.dart';
import 'package:where_am_i/presentation/widgets/circular_loading.dart';


final sl = GetIt.instance;

class MyPresencesPage extends StatefulWidget {
  final void Function(String title) _setAppBarTitle;

  MyPresencesPage(this._setAppBarTitle);

  @override
  _MyPresencesPageState createState() => _MyPresencesPageState();
}

class _MyPresencesPageState extends State<MyPresencesPage> {
  WorkstationBloc _workstationBloc = sl<WorkstationBloc>();

  @override
  void initState() {
    _workstationBloc..add(FetchUserPresences());
    super.initState();
  }

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    if (args.value is PickerDateRange) {
      print("1" + args.value.startDate.toString());
      print("2" + args.value.endDate.toString());
    } else if (args.value is DateTime) {
      print("3" + args.value.toString());
    } else if (args.value is List<DateTime>) {
      print("4" + args.value.toString());
    } else {
      print("5" + args.value.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkstationBloc, WorkstationState>(
        cubit: _workstationBloc,
        builder: (context, state) {
          if (state is UserPresencesFetchCompleted) {
            var userPresences = state.userPresences;
            userPresences.add(DateTime.now().add(Duration(days: 2)));
            userPresences.add(DateTime.now().add(Duration(days: 3)));
            userPresences.add(DateTime.now().add(Duration(days: 5)));
            return _buildSFCalendar(userPresences);
          } else if (state is WorkstationsFetchErrorState) {
            return Center(
              child: MaterialButton(
                  child: Text('riprova'),
                  onPressed: () {
                    _workstationBloc.add(FetchUserPresences());
                  }),
            );
          } else {
            return Center(child: CircularLoading());
          }
        });
  }

  Widget _buildSFCalendar(List<DateTime> userPresences) =>
      SfDateRangePicker(
        showNavigationArrow: true,
        onSelectionChanged: _onSelectionChanged,
        headerHeight: 100,
        selectionColor: dncOrange,
        minDate: DateTime.now().subtract(Duration(days: 365)),
        maxDate: DateTime.now().add(Duration(days: 365)),
        selectionMode: DateRangePickerSelectionMode.multiple,
        headerStyle: DateRangePickerHeaderStyle(textAlign: TextAlign.center),
        initialSelectedDates: userPresences != null ? userPresences : [],
      );

}
