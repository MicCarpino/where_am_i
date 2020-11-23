import 'package:get_it/get_it.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:where_am_i/core/utils/constants.dart';
import 'package:where_am_i/presentation/bloc/my_presences/my_presences_bloc.dart';
import 'package:where_am_i/presentation/widgets/circular_loading.dart';
import 'package:where_am_i/presentation/widgets/presences_marker.dart';

final serviceLocator = GetIt.instance;

enum fasciaOraria { mattina, pomeriggio, full }

class MyPresencesPage extends StatefulWidget {
  @override
  _MyPresencesPageState createState() => _MyPresencesPageState();
}

class _MyPresencesPageState extends State<MyPresencesPage>
    with TickerProviderStateMixin {
  MyPresencesBloc _myPresencesBloc = serviceLocator<MyPresencesBloc>();
  Map<DateTime, List> _userPresences = new Map<DateTime, List>();
  AnimationController _animationController;
  CalendarController _calendarController;

  @override
  void initState() {
    _myPresencesBloc..add(FetchCurrentUserPresences());
    super.initState();
    _calendarController = CalendarController();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyPresencesBloc, MyPresencesState>(
        cubit: _myPresencesBloc,
        builder: (context, state) {
          if (state is CurrentUserPresencesFetchCompleted) {
            int index = 0;
            state.currentUserPresences.forEach((element) {
              index ++;
              fasciaOraria c = index % 2 == 0? fasciaOraria.mattina: index%3 ==0? fasciaOraria.pomeriggio : fasciaOraria.full;
              _userPresences.putIfAbsent(element.workstationDate, () => [c]);
            });
            return _buildCalendar();
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
 var calendarBuild = 0;
  Widget _buildCalendar() {
    calendarBuild++;
    print('calendar built $calendarBuild times');
    return TableCalendar(
      locale: 'en_US',
      calendarController: _calendarController,
      //holidays: _holidays,
      initialCalendarFormat: CalendarFormat.month,
      formatAnimation: FormatAnimation.slide,
      startingDayOfWeek: StartingDayOfWeek.monday,
      availableGestures: AvailableGestures.all,
      availableCalendarFormats: const {CalendarFormat.month: ''},
      calendarStyle: CalendarStyle(
        outsideDaysVisible: false,
        weekendStyle: TextStyle().copyWith(color: Colors.red[800]),
        holidayStyle: TextStyle().copyWith(color: Colors.yellow[800]),
      ),
      daysOfWeekStyle: DaysOfWeekStyle(
        weekendStyle: TextStyle().copyWith(color: Colors.red[600]),
      ),
      headerStyle:
      HeaderStyle(centerHeaderTitle: true, formatButtonVisible: false),
      builders: CalendarBuilders(
        selectedDayBuilder: (context, date, _) {
          return Center(
            child: Text(
              '${date.day}',
              style: TextStyle().copyWith(fontSize: 16.0),
            ),
          );
        },
        markersBuilder: (context, date, events, _) =>
            _buildMarkers(date,events),
        todayDayBuilder: (context, date, _) {
          return Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: dncBlue),
            ),
            alignment: Alignment.center,
            child: Text(
              '${date.day}',
              style: TextStyle(fontSize: 16.0, color: dncBlue),
            ),
          );
        },
      ),
      onDaySelected: (date, events, holidays) {
        _onDaySelected(date, events, holidays);
        _animationController.forward(from: 0.0);
      },
      onVisibleDaysChanged: _onVisibleDaysChanged,
      //onCalendarCreated: _onCalendarCreated,
      events: _userPresences
    );
  }

  void _onDaySelected(DateTime day, List events, List holidays) {
    print('CALLBACK: _onDaySelected');
    setState(() {
      _userPresences.putIfAbsent(DateTime.now().add(Duration(days: 1)),() => [fasciaOraria.mattina]);
      _userPresences.removeWhere((key, value) => key.day == DateTime.monday);
    });
  }

  void _onVisibleDaysChanged(DateTime first, DateTime last,
      CalendarFormat format) {
    setState(() {});
  }

  _buildMarkers(DateTime date, List eventsForDate) {
    print('buil  marker');
    final children = <Widget>[];
    if (eventsForDate.length == 1 && eventsForDate.first is fasciaOraria) {
      children.add(PresencesMarker(date: date,status: true,fa: eventsForDate.first));
    }
    return children;
  }

  @override
  void dispose() {
    _animationController.dispose();
    _calendarController.dispose();
    super.dispose();
  }
/*SfDateRangePicker _buildSFCalendar(List<DateTime> userPresences) => SfDateRangePicker(
        showNavigationArrow: true,
        headerHeight: 100,
        selectionColor: dncOrange,
        minDate: DateTime.now().subtract(Duration(days: 365)),
        maxDate: DateTime.now().add(Duration(days: 365)),
        selectionMode: DateRangePickerSelectionMode.multiple,
        headerStyle: DateRangePickerHeaderStyle(textAlign: TextAlign.center),
        initialSelectedDates: userPresences != null ? userPresences : [],
        onSelectionChanged: _onSelectionChanged,enablePastDates: false,toggleDaySelection: true,
      );

  _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    _myPresencesBloc.add(OnCurrentUserPresencesUpdate(args.value));
  }*/
}
