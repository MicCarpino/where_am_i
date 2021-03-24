part of 'date_picker_cubit.dart';

@freezed
abstract class DatePickerState with _$DatePickerState {
  const factory DatePickerState({@required DateTime visualizedDate}) = _DatePickerState;
}
