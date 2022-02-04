import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';
import 'package:where_am_i/core/utils/extensions.dart';

part 'date_picker_state.dart';

part 'date_picker_cubit.freezed.dart';

// this bloc handle the date picker logic
class DatePickerCubit extends Cubit<DatePickerState> {
  DatePickerCubit()
      : super(DatePickerState(visualizedDate: DateTime.now().zeroed()));

  //increment the date displayed by one day, skipping sunday
  void incrementDate() {
    final newDate = state.visualizedDate.add(
      Duration(days: state.visualizedDate.weekday == DateTime.saturday ? 2 : 1),
    );
    emit(state.copyWith(visualizedDate: newDate.zeroed()));
  }

  //decrement the date displayed by one day, skipping sunday
  void decrementDate() {
    final newDate = state.visualizedDate.subtract(
      Duration(days: state.visualizedDate.weekday == DateTime.monday ? 2 : 1),
    );
    emit(state.copyWith(visualizedDate: newDate.zeroed()));
  }

  //date chose from the calendar dialog
  void onDateChanged(DateTime date) =>
      emit(state.copyWith(visualizedDate: date));

  //return false for past days
  bool isEditAllowed() =>
      state.visualizedDate.isAtSameMomentOrAfter(DateTime.now().zeroed());
}
