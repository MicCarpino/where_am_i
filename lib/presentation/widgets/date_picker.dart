import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:where_am_i/core/utils/constants.dart';
import 'package:where_am_i/presentation/bloc/date_picker/date_picker_cubit.dart';

class DatePicker extends StatelessWidget {
  final Function(DateTime date) onDateChanged;

  DatePicker(this.onDateChanged);

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
                    child: Icon(
                      Icons.keyboard_arrow_left,
                      color: Colors.white,
                    )),
                onTap: () => context.read<DatePickerCubit>().decrementDate(),
              ),
            ),
          ),
          GestureDetector(
              child: BlocConsumer<DatePickerCubit, DatePickerState>(
                listenWhen: (previous, current) =>
                    previous.visualizedDate != current.visualizedDate,
                listener: (context, state) =>
                    onDateChanged(state.visualizedDate),
                buildWhen: (previous, current) =>
                    previous.visualizedDate != current.visualizedDate,
                builder: (context, state) => Text(
                    DateFormat('EEEE d MMMM').format(state.visualizedDate),
                    style: TextStyle(color: Colors.white, fontSize: 16)),
              ),
              onTap: () => _showCalendar(context)),
          ClipOval(
            child: Material(
              color: Colors.transparent, // button color
              child: InkWell(
                splashColor: dncLightBlue, // inkwell color
                child: SizedBox(
                    width: 40,
                    height: 40,
                    child: Icon(
                      Icons.keyboard_arrow_right,
                      color: Colors.white,
                    )),
                onTap: () => context.read<DatePickerCubit>().incrementDate(),
              ),
            ),
          )
        ],
      ),
    );
  }

  _showCalendar(BuildContext context) async {
    await showDatePicker(
        context: context,
        initialDate: context.read<DatePickerCubit>().state.visualizedDate,
        selectableDayPredicate: (day) => day.weekday != DateTime.sunday,
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
        context.read<DatePickerCubit>().onDateChanged(selectedDate);
      }
    });
  }
}
