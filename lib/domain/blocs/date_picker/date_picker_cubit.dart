import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';
import 'package:where_am_i/core/utils/extensions.dart';

part 'date_picker_state.dart';

part 'date_picker_cubit.freezed.dart';

class DatePickerCubit extends Cubit<DatePickerState> {
  DatePickerCubit()
      : super(DatePickerState(visualizedDate: DateTime.now().zeroed()));

  void incrementDate() {
    final newDate = state.visualizedDate.toUtc().add(
      Duration(days: state.visualizedDate.weekday == DateTime.saturday ? 2 : 1),
    );
    emit(state.copyWith(visualizedDate: newDate));
  }

  void decrementDate() {
    final newDate = state.visualizedDate.toUtc().subtract(
      Duration(days: state.visualizedDate.weekday == DateTime.monday ? 2 : 1),
    );
    emit(state.copyWith(visualizedDate: newDate));
  }

  void onDateChanged(DateTime date) =>
      emit(state.copyWith(visualizedDate: date));

  bool isEditAllowed() =>
      state.visualizedDate.isAtSameMomentOrAfter(DateTime.now().zeroed());
}
