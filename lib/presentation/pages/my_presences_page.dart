import 'package:get_it/get_it.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:where_am_i/core/utils/constants.dart';
import 'package:where_am_i/data/models/workstation_model.dart';
import 'package:where_am_i/presentation/bloc/my_presences/my_presences_bloc.dart';
import 'package:where_am_i/presentation/widgets/circular_loading.dart';
import 'package:where_am_i/presentation/widgets/presences_marker.dart';

final serviceLocator = GetIt.instance;

class MyPresencesPage extends StatefulWidget {
  @override
  _MyPresencesPageState createState() => _MyPresencesPageState();
}

class _MyPresencesPageState extends State<MyPresencesPage>
    with TickerProviderStateMixin {
  MyPresencesBloc _myPresencesBloc = serviceLocator<MyPresencesBloc>();
  AnimationController _animationController;
  CalendarController _calendarController;
  Map<DateTime, List> _userPresences = new Map<DateTime, List>();

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
            state.currentUserPresences.forEach((workstation) {
              _userPresences.putIfAbsent(
                  workstation.workstationDate, () => [workstation]);
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
          weekendStyle: TextStyle().copyWith(color: Colors.red[800]),
        ),
        headerStyle:
            HeaderStyle(centerHeaderTitle: true, formatButtonVisible: false),
        builders: CalendarBuilders(
          selectedDayBuilder: (context, date, _) {
            return Center(
              child: Text(
                '${date.day}',
                style: TextStyle()
                    .copyWith(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
            );
          },
          markersBuilder: (ctx, date, events, _) => _buildMarkers(date, events),
          todayDayBuilder: (context, date, _) => _buildTodayMarker(date),
        ),
        onDaySelected: (date, events, _) {
          _onDaySelected(date,events);
          _animationController.forward(from: 0.0);
        },onDayLongPressed:(day, events, _) => _onDayLongPress(day,events) ,
        onVisibleDaysChanged: null,
        //onCalendarCreated: _onCalendarCreated,
        events: _userPresences);
  }

   _onDaySelected(DateTime date, List events) {
    if(events.isEmpty){
      _myPresencesBloc.add(OnPresenceAdded(date,TIME_SLOT_NINE,TIME_SLOT_THIRTEEN));
    } else if( events.isNotEmpty && events.first is WorkstationModel){
      WorkstationModel workstation = events.first;
      _myPresencesBloc.add(OnPresenceRemoved(workstation.idWorkstation));
    }
  }

  _onDayLongPress(DateTime day, List events) {}

  _buildMarkers(DateTime date, List workstationsForDate) {
    print('build  markers');
    final children = <Widget>[];
    if (workstationsForDate.length == 1) {
      children.add(PresencesMarker(workstation: workstationsForDate.first));
    }
    return children;
  }

  Widget _buildTodayMarker(DateTime date) {
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
  }

  @override
  void dispose() {
    _animationController.dispose();
    _calendarController.dispose();
    super.dispose();
  }
}
