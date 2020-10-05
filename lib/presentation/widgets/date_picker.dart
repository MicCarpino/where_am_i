import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:where_am_i/core/utils/constants.dart';
import 'package:where_am_i/presentation/bloc/home/home_bloc.dart';

final sl = GetIt.instance;

class DatePicker extends StatefulWidget {
  @override
  _DatePickerState createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  HomeBloc _homeBloc = sl<HomeBloc>();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: dncLightBlue,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipOval(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                child: SizedBox(
                    width: 50,
                    height: 50,
                    child:
                        Icon(Icons.keyboard_arrow_left, color: Colors.white)),
                onTap: () {
                  _homeBloc.add(
                    OnNewDate(
                        date: _homeBloc.visualizedDate.subtract(
                      Duration(days: 1),
                    )),
                  );
                },
              ),
            ),
          ),
          StreamBuilder<DateTime>(
              initialData: DateTime.now(),
              stream: _homeBloc.visualizedDateStream,
              builder: (BuildContext context, AsyncSnapshot<DateTime> date) {
                return GestureDetector(
                    child: Text(DateFormat('EEE, MMM d').format(date.data),
                        style: TextStyle(color: Colors.white, fontSize: 16)),
                    onTap: () {
                      _showCalendar(context);
                    });
              }),
          ClipOval(
            child: Material(
              color: Colors.transparent, // button color
              child: InkWell(
                splashColor: dncLightBlue, // inkwell color
                child: SizedBox(
                    width: 40,
                    height: 40,
                    child:
                        Icon(Icons.keyboard_arrow_right, color: Colors.white)),
                onTap: () {
                  _homeBloc.add(
                    OnNewDate(
                        date: _homeBloc.visualizedDate.add(
                      Duration(days: 1),
                    )),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _homeBloc.close();
    super.dispose();
  }

  _showCalendar(context) async {
    await showDatePicker(
        context: context,
        initialDate: _homeBloc.visualizedDate,
        firstDate: DateTime.now().subtract(Duration(days: 365)),
        lastDate: DateTime.now().add(Duration(days: 365)),
        locale: const Locale("it", ""),
        builder: (context, child) {
          return Theme(
            data: ThemeData(),
            child: child,
          );
        }).then((selectedDate) {
      if (selectedDate != null) {
        _homeBloc.add(
          OnNewDate(date: _homeBloc.visualizedDate = selectedDate),
        );
      }
    });
  }
}
