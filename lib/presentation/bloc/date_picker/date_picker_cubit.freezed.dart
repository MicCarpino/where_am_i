// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'date_picker_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$DatePickerStateTearOff {
  const _$DatePickerStateTearOff();

// ignore: unused_element
  _DatePickerState call({@required DateTime visualizedDate}) {
    return _DatePickerState(
      visualizedDate: visualizedDate,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $DatePickerState = _$DatePickerStateTearOff();

/// @nodoc
mixin _$DatePickerState {
  DateTime get visualizedDate;

  @JsonKey(ignore: true)
  $DatePickerStateCopyWith<DatePickerState> get copyWith;
}

/// @nodoc
abstract class $DatePickerStateCopyWith<$Res> {
  factory $DatePickerStateCopyWith(
          DatePickerState value, $Res Function(DatePickerState) then) =
      _$DatePickerStateCopyWithImpl<$Res>;
  $Res call({DateTime visualizedDate});
}

/// @nodoc
class _$DatePickerStateCopyWithImpl<$Res>
    implements $DatePickerStateCopyWith<$Res> {
  _$DatePickerStateCopyWithImpl(this._value, this._then);

  final DatePickerState _value;
  // ignore: unused_field
  final $Res Function(DatePickerState) _then;

  @override
  $Res call({
    Object visualizedDate = freezed,
  }) {
    return _then(_value.copyWith(
      visualizedDate: visualizedDate == freezed
          ? _value.visualizedDate
          : visualizedDate as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$DatePickerStateCopyWith<$Res>
    implements $DatePickerStateCopyWith<$Res> {
  factory _$DatePickerStateCopyWith(
          _DatePickerState value, $Res Function(_DatePickerState) then) =
      __$DatePickerStateCopyWithImpl<$Res>;
  @override
  $Res call({DateTime visualizedDate});
}

/// @nodoc
class __$DatePickerStateCopyWithImpl<$Res>
    extends _$DatePickerStateCopyWithImpl<$Res>
    implements _$DatePickerStateCopyWith<$Res> {
  __$DatePickerStateCopyWithImpl(
      _DatePickerState _value, $Res Function(_DatePickerState) _then)
      : super(_value, (v) => _then(v as _DatePickerState));

  @override
  _DatePickerState get _value => super._value as _DatePickerState;

  @override
  $Res call({
    Object visualizedDate = freezed,
  }) {
    return _then(_DatePickerState(
      visualizedDate: visualizedDate == freezed
          ? _value.visualizedDate
          : visualizedDate as DateTime,
    ));
  }
}

/// @nodoc
class _$_DatePickerState implements _DatePickerState {
  const _$_DatePickerState({@required this.visualizedDate})
      : assert(visualizedDate != null);

  @override
  final DateTime visualizedDate;

  @override
  String toString() {
    return 'DatePickerState(visualizedDate: $visualizedDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _DatePickerState &&
            (identical(other.visualizedDate, visualizedDate) ||
                const DeepCollectionEquality()
                    .equals(other.visualizedDate, visualizedDate)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(visualizedDate);

  @JsonKey(ignore: true)
  @override
  _$DatePickerStateCopyWith<_DatePickerState> get copyWith =>
      __$DatePickerStateCopyWithImpl<_DatePickerState>(this, _$identity);
}

abstract class _DatePickerState implements DatePickerState {
  const factory _DatePickerState({@required DateTime visualizedDate}) =
      _$_DatePickerState;

  @override
  DateTime get visualizedDate;
  @override
  @JsonKey(ignore: true)
  _$DatePickerStateCopyWith<_DatePickerState> get copyWith;
}
