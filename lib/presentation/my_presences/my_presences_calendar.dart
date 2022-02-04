import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:where_am_i/core/utils/enums.dart';
import 'package:where_am_i/domain/blocs/my_presences/actor/my_presences_actor_bloc.dart';
import 'package:where_am_i/domain/entities/workstation.dart';
import 'presences_marker.dart';

//https://pub.dev/packages/table_calendar

class MyPresencesCalendar extends StatefulWidget {
  @override
  _MyPresencesCalendarState createState() => _MyPresencesCalendarState();

  const MyPresencesCalendar({Key key, @required this.userPresences})
      : super(key: key);

  final List<Workstation> userPresences;
}

class _MyPresencesCalendarState extends State<MyPresencesCalendar>
    with TickerProviderStateMixin {
  final _calendarController = CalendarController();

  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    )..forward();
  }

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      //disable sunday
      enabledDayPredicate: (day) => day.weekday != DateTime.sunday,
      initialSelectedDay: DateTime.now(),
      locale: 'it_IT',
      calendarController: _calendarController,
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
      headerStyle: HeaderStyle(
        centerHeaderTitle: true,
        formatButtonVisible: false,
      ),
      //the widget representing the days
      builders: CalendarBuilders(
        selectedDayBuilder: (context, date, _) => Center(
          child: Text('${date.day}',
              style: TextStyle().copyWith(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              )),
        ),
        //optional marker for the day widget, in this case the "circles"
        // representing the time slot
        markersBuilder: (_, date, events, __) => events.isNotEmpty
            ? [PresencesMarker(workstation: events.first)]
            : List.empty(),
        //the style of the widget for the current day
        todayDayBuilder: (context, date, events) => Container(
          alignment: Alignment.center,
          child: Text('${date.day}'),
        ),
      ),
      // on single tap perform presences insert (full day) or remove
      onDaySelected: (date, events, holidays) => context
          .read<MyPresencesActorBloc>()
          .add(events.isEmpty
              ? MyPresencesActorEvent.added(TimeSlot.fullDay,date)
              : (MyPresencesActorEvent.removed(events.first as Workstation))),
      //on long press show the time slot dialog
      onDayLongPressed: (day, events, _) =>
          context.read<MyPresencesActorBloc>().add(
                MyPresencesActorEvent.editRequested(
                    day, events.isEmpty ? null : events.first),
              ),
      //the object (workstation) assigned to a specific date
      events: {
        for (Workstation v in widget.userPresences) v.workstationDate: [v]
      },
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    _calendarController.dispose();
    super.dispose();
  }
}
