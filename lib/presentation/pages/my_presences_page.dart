import 'package:get_it/get_it.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:where_am_i/core/usecases/usecase.dart';
import 'package:where_am_i/core/utils/constants.dart';
import 'package:where_am_i/data/models/workstation_model.dart';
import 'package:where_am_i/domain/entities/workstation.dart';
import 'package:where_am_i/presentation/bloc/my_presences/my_presences_bloc.dart';
import 'package:where_am_i/presentation/widgets/circular_loading.dart';
import 'package:where_am_i/presentation/widgets/presences_marker.dart';
import 'package:where_am_i/presentation/widgets/retry_widget.dart';
import 'package:where_am_i/presentation/widgets/time_slot_dialog.dart';

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
        vsync: this, duration: const Duration(milliseconds: 400));
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MyPresencesBloc, MyPresencesState>(
      cubit: _myPresencesBloc,
      buildWhen: (previous, current) =>
          current is PresencesFetchLoadingState ||
          current is PresencesFetchErrorState ||
          current is PresencesFetchCompletedState,
      builder: (context, state) {
        if (state is PresencesFetchLoadingState) {
          return Center(child: CircularLoading());
        }
        if (state is PresencesFetchCompletedState) {
          //converting list to map{Date:List<Workstation>}
          _userPresences = {
            for (Workstation v in state.currentUserPresences)
              v.workstationDate: [v]
          };
          return _buildCalendar();
        } else {
          return Container(
              width: double.infinity,
              height: double.infinity,
              child: Center(
                child: RetryWidget(
                    onTryAgainPressed: () =>
                        _myPresencesBloc.add(FetchCurrentUserPresences())),
              ));
        }
      },
      listener: (context, state) {
        if (state is PresencesErrorMessageState) {
          Scaffold.of(context).showSnackBar(
            SnackBar(content: Text(state.errorMessage)),
          );
        }
      },
    );
  }

  var calendarBuild = 0;

  Widget _buildCalendar() {
    return TableCalendar(
        enabledDayPredicate: (day) => day.weekday != DateTime.sunday,
        locale: 'it_IT',
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
          _onDaySelected(date, events);
          //_animationController.forward(from: 0.0);
        },
        onDayLongPressed: (day, events, _) => _onDayLongPress(day, events),
        onVisibleDaysChanged: null,
        //onCalendarCreated: _onCalendarCreated,
        events: _userPresences);
  }

  _onDaySelected(DateTime date, List events) {
    if (events.isEmpty) {
      //performing insert
      _myPresencesBloc.add(OnPresenceAdded(PresenceNewParameters(
          date: date, startTime: TIME_SLOT_NINE, endTime: TIME_SLOT_EIGHTEEN)));
    } else if (events.isNotEmpty && events.first is Workstation) {
      WorkstationModel workstation = events.first;
      if (workstation.status == WORKSTATION_STATUS_REFUSED) {
        Scaffold.of(context).showSnackBar(
          SnackBar(
              content:
                  Text("Non è possibile eliminare una richiesta rifiutata")),
        );
      } else {
        //performing delete
        _myPresencesBloc.add(OnPresenceRemoved(workstation.idWorkstation));
      }
    }
  }

  _onDayLongPress(DateTime day, List events) {
    Workstation workstation;
    if (events.isNotEmpty) {
      workstation = events.first as Workstation;
    }
    if (workstation?.status == WORKSTATION_STATUS_CONFIRMED) {
      Scaffold.of(context).showSnackBar(
        SnackBar(
            content: Text(
                'Per modificare richieste di presenza già confermate contattare l\'amministrazione')),
      );
    } else if (workstation?.status == WORKSTATION_STATUS_REFUSED) {
      Scaffold.of(context).showSnackBar(
        SnackBar(
            content: Text(
                "Per modificare richieste di presenza rifiutate contattare l\'amministrazione")),
      );
    } else {
      return showDialog(
          context: context,
          builder: (BuildContext context) {
            return TimeSlotDialog(workstation, day);
          }).then(
        (value) {
          //checking if callback result contains a value
          if (value != null && value is List<PresenceNewParameters>) {
            //single insert or update
            if (value.length == 1) {
              _myPresencesBloc.add(workstation != null
                  ? OnPresenceUpdate(workstation, value.first)
                  : OnPresenceAdded(value.first));
            } else {
              _myPresencesBloc.add(OnMultiplePresencesAdded(value));
            }
          }
        },
      );
    }
  }

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
