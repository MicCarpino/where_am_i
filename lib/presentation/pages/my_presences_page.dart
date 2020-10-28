import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import 'package:where_am_i/core/utils/constants.dart';
import 'package:where_am_i/presentation/bloc/my_presences/my_presences_bloc.dart';
import 'package:where_am_i/presentation/widgets/circular_loading.dart';

final sl = GetIt.instance;

class MyPresencesPage extends StatefulWidget {

  @override
  _MyPresencesPageState createState() => _MyPresencesPageState();
}

class _MyPresencesPageState extends State<MyPresencesPage> {
  MyPresencesBloc _myPresencesBloc = sl<MyPresencesBloc>();
  List<DateTime> userPresences = [];

  @override
  void initState() {
    _myPresencesBloc..add(FetchCurrentUserPresences());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyPresencesBloc, MyPresencesState>(
        cubit: _myPresencesBloc,
        builder: (context, state) {
          if (state is CurrentUserPresencesFetchCompleted) {
            userPresences = state.currentUserPresences
                .map((e) => e.workstationDate)
                .toList();
            return _buildSFCalendar(userPresences);
          } else if (state is CurrentUserPresencesFetchErrorState) {
            return Center(
              child: MaterialButton(
                  child: Text('riprova'),
                  onPressed: () {
                    _myPresencesBloc.add(FetchCurrentUserPresences());
                  }),
            );
          } else {
            return Center(child: CircularLoading());
          }
        });
  }

  Widget _buildSFCalendar(List<DateTime> userPresences) => SfDateRangePicker(
        showNavigationArrow: true,
        headerHeight: 100,
        selectionColor: dncOrange,
        minDate: DateTime.now().subtract(Duration(days: 365)),
        maxDate: DateTime.now().add(Duration(days: 365)),
        selectionMode: DateRangePickerSelectionMode.multiple,
        headerStyle: DateRangePickerHeaderStyle(textAlign: TextAlign.center),
        initialSelectedDates: userPresences != null ? userPresences : [],
        onSelectionChanged: _onSelectionChanged,
      );

  _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    _myPresencesBloc.add(OnCurrentUserPresencesUpdate(args.value));
  }
}
