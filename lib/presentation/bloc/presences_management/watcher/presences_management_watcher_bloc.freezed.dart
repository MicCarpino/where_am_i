// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'presences_management_watcher_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$PresencesManagementWatcherEventTearOff {
  const _$PresencesManagementWatcherEventTearOff();

// ignore: unused_element
  _GetUserPresences getAllUsersPresencesByDate(DateTime date) {
    return _GetUserPresences(
      date,
    );
  }

// ignore: unused_element
  _PresencesReceived presencesReceived(
      List<UserWithWorkstation> usersWithWorkstations) {
    return _PresencesReceived(
      usersWithWorkstations,
    );
  }

// ignore: unused_element
  _OnFilterUpdated onFilterUpdated(String filterString) {
    return _OnFilterUpdated(
      filterString,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $PresencesManagementWatcherEvent =
    _$PresencesManagementWatcherEventTearOff();

/// @nodoc
mixin _$PresencesManagementWatcherEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult getAllUsersPresencesByDate(DateTime date),
    @required
        TResult presencesReceived(
            List<UserWithWorkstation> usersWithWorkstations),
    @required TResult onFilterUpdated(String filterString),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult getAllUsersPresencesByDate(DateTime date),
    TResult presencesReceived(List<UserWithWorkstation> usersWithWorkstations),
    TResult onFilterUpdated(String filterString),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult getAllUsersPresencesByDate(_GetUserPresences value),
    @required TResult presencesReceived(_PresencesReceived value),
    @required TResult onFilterUpdated(_OnFilterUpdated value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult getAllUsersPresencesByDate(_GetUserPresences value),
    TResult presencesReceived(_PresencesReceived value),
    TResult onFilterUpdated(_OnFilterUpdated value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $PresencesManagementWatcherEventCopyWith<$Res> {
  factory $PresencesManagementWatcherEventCopyWith(
          PresencesManagementWatcherEvent value,
          $Res Function(PresencesManagementWatcherEvent) then) =
      _$PresencesManagementWatcherEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$PresencesManagementWatcherEventCopyWithImpl<$Res>
    implements $PresencesManagementWatcherEventCopyWith<$Res> {
  _$PresencesManagementWatcherEventCopyWithImpl(this._value, this._then);

  final PresencesManagementWatcherEvent _value;
  // ignore: unused_field
  final $Res Function(PresencesManagementWatcherEvent) _then;
}

/// @nodoc
abstract class _$GetUserPresencesCopyWith<$Res> {
  factory _$GetUserPresencesCopyWith(
          _GetUserPresences value, $Res Function(_GetUserPresences) then) =
      __$GetUserPresencesCopyWithImpl<$Res>;
  $Res call({DateTime date});
}

/// @nodoc
class __$GetUserPresencesCopyWithImpl<$Res>
    extends _$PresencesManagementWatcherEventCopyWithImpl<$Res>
    implements _$GetUserPresencesCopyWith<$Res> {
  __$GetUserPresencesCopyWithImpl(
      _GetUserPresences _value, $Res Function(_GetUserPresences) _then)
      : super(_value, (v) => _then(v as _GetUserPresences));

  @override
  _GetUserPresences get _value => super._value as _GetUserPresences;

  @override
  $Res call({
    Object date = freezed,
  }) {
    return _then(_GetUserPresences(
      date == freezed ? _value.date : date as DateTime,
    ));
  }
}

/// @nodoc
class _$_GetUserPresences implements _GetUserPresences {
  const _$_GetUserPresences(this.date) : assert(date != null);

  @override
  final DateTime date;

  @override
  String toString() {
    return 'PresencesManagementWatcherEvent.getAllUsersPresencesByDate(date: $date)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _GetUserPresences &&
            (identical(other.date, date) ||
                const DeepCollectionEquality().equals(other.date, date)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(date);

  @JsonKey(ignore: true)
  @override
  _$GetUserPresencesCopyWith<_GetUserPresences> get copyWith =>
      __$GetUserPresencesCopyWithImpl<_GetUserPresences>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult getAllUsersPresencesByDate(DateTime date),
    @required
        TResult presencesReceived(
            List<UserWithWorkstation> usersWithWorkstations),
    @required TResult onFilterUpdated(String filterString),
  }) {
    assert(getAllUsersPresencesByDate != null);
    assert(presencesReceived != null);
    assert(onFilterUpdated != null);
    return getAllUsersPresencesByDate(date);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult getAllUsersPresencesByDate(DateTime date),
    TResult presencesReceived(List<UserWithWorkstation> usersWithWorkstations),
    TResult onFilterUpdated(String filterString),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (getAllUsersPresencesByDate != null) {
      return getAllUsersPresencesByDate(date);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult getAllUsersPresencesByDate(_GetUserPresences value),
    @required TResult presencesReceived(_PresencesReceived value),
    @required TResult onFilterUpdated(_OnFilterUpdated value),
  }) {
    assert(getAllUsersPresencesByDate != null);
    assert(presencesReceived != null);
    assert(onFilterUpdated != null);
    return getAllUsersPresencesByDate(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult getAllUsersPresencesByDate(_GetUserPresences value),
    TResult presencesReceived(_PresencesReceived value),
    TResult onFilterUpdated(_OnFilterUpdated value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (getAllUsersPresencesByDate != null) {
      return getAllUsersPresencesByDate(this);
    }
    return orElse();
  }
}

abstract class _GetUserPresences implements PresencesManagementWatcherEvent {
  const factory _GetUserPresences(DateTime date) = _$_GetUserPresences;

  DateTime get date;
  @JsonKey(ignore: true)
  _$GetUserPresencesCopyWith<_GetUserPresences> get copyWith;
}

/// @nodoc
abstract class _$PresencesReceivedCopyWith<$Res> {
  factory _$PresencesReceivedCopyWith(
          _PresencesReceived value, $Res Function(_PresencesReceived) then) =
      __$PresencesReceivedCopyWithImpl<$Res>;
  $Res call({List<UserWithWorkstation> usersWithWorkstations});
}

/// @nodoc
class __$PresencesReceivedCopyWithImpl<$Res>
    extends _$PresencesManagementWatcherEventCopyWithImpl<$Res>
    implements _$PresencesReceivedCopyWith<$Res> {
  __$PresencesReceivedCopyWithImpl(
      _PresencesReceived _value, $Res Function(_PresencesReceived) _then)
      : super(_value, (v) => _then(v as _PresencesReceived));

  @override
  _PresencesReceived get _value => super._value as _PresencesReceived;

  @override
  $Res call({
    Object usersWithWorkstations = freezed,
  }) {
    return _then(_PresencesReceived(
      usersWithWorkstations == freezed
          ? _value.usersWithWorkstations
          : usersWithWorkstations as List<UserWithWorkstation>,
    ));
  }
}

/// @nodoc
class _$_PresencesReceived implements _PresencesReceived {
  const _$_PresencesReceived(this.usersWithWorkstations)
      : assert(usersWithWorkstations != null);

  @override
  final List<UserWithWorkstation> usersWithWorkstations;

  @override
  String toString() {
    return 'PresencesManagementWatcherEvent.presencesReceived(usersWithWorkstations: $usersWithWorkstations)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PresencesReceived &&
            (identical(other.usersWithWorkstations, usersWithWorkstations) ||
                const DeepCollectionEquality().equals(
                    other.usersWithWorkstations, usersWithWorkstations)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(usersWithWorkstations);

  @JsonKey(ignore: true)
  @override
  _$PresencesReceivedCopyWith<_PresencesReceived> get copyWith =>
      __$PresencesReceivedCopyWithImpl<_PresencesReceived>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult getAllUsersPresencesByDate(DateTime date),
    @required
        TResult presencesReceived(
            List<UserWithWorkstation> usersWithWorkstations),
    @required TResult onFilterUpdated(String filterString),
  }) {
    assert(getAllUsersPresencesByDate != null);
    assert(presencesReceived != null);
    assert(onFilterUpdated != null);
    return presencesReceived(usersWithWorkstations);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult getAllUsersPresencesByDate(DateTime date),
    TResult presencesReceived(List<UserWithWorkstation> usersWithWorkstations),
    TResult onFilterUpdated(String filterString),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (presencesReceived != null) {
      return presencesReceived(usersWithWorkstations);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult getAllUsersPresencesByDate(_GetUserPresences value),
    @required TResult presencesReceived(_PresencesReceived value),
    @required TResult onFilterUpdated(_OnFilterUpdated value),
  }) {
    assert(getAllUsersPresencesByDate != null);
    assert(presencesReceived != null);
    assert(onFilterUpdated != null);
    return presencesReceived(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult getAllUsersPresencesByDate(_GetUserPresences value),
    TResult presencesReceived(_PresencesReceived value),
    TResult onFilterUpdated(_OnFilterUpdated value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (presencesReceived != null) {
      return presencesReceived(this);
    }
    return orElse();
  }
}

abstract class _PresencesReceived implements PresencesManagementWatcherEvent {
  const factory _PresencesReceived(
      List<UserWithWorkstation> usersWithWorkstations) = _$_PresencesReceived;

  List<UserWithWorkstation> get usersWithWorkstations;
  @JsonKey(ignore: true)
  _$PresencesReceivedCopyWith<_PresencesReceived> get copyWith;
}

/// @nodoc
abstract class _$OnFilterUpdatedCopyWith<$Res> {
  factory _$OnFilterUpdatedCopyWith(
          _OnFilterUpdated value, $Res Function(_OnFilterUpdated) then) =
      __$OnFilterUpdatedCopyWithImpl<$Res>;
  $Res call({String filterString});
}

/// @nodoc
class __$OnFilterUpdatedCopyWithImpl<$Res>
    extends _$PresencesManagementWatcherEventCopyWithImpl<$Res>
    implements _$OnFilterUpdatedCopyWith<$Res> {
  __$OnFilterUpdatedCopyWithImpl(
      _OnFilterUpdated _value, $Res Function(_OnFilterUpdated) _then)
      : super(_value, (v) => _then(v as _OnFilterUpdated));

  @override
  _OnFilterUpdated get _value => super._value as _OnFilterUpdated;

  @override
  $Res call({
    Object filterString = freezed,
  }) {
    return _then(_OnFilterUpdated(
      filterString == freezed ? _value.filterString : filterString as String,
    ));
  }
}

/// @nodoc
class _$_OnFilterUpdated implements _OnFilterUpdated {
  const _$_OnFilterUpdated(this.filterString) : assert(filterString != null);

  @override
  final String filterString;

  @override
  String toString() {
    return 'PresencesManagementWatcherEvent.onFilterUpdated(filterString: $filterString)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _OnFilterUpdated &&
            (identical(other.filterString, filterString) ||
                const DeepCollectionEquality()
                    .equals(other.filterString, filterString)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(filterString);

  @JsonKey(ignore: true)
  @override
  _$OnFilterUpdatedCopyWith<_OnFilterUpdated> get copyWith =>
      __$OnFilterUpdatedCopyWithImpl<_OnFilterUpdated>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult getAllUsersPresencesByDate(DateTime date),
    @required
        TResult presencesReceived(
            List<UserWithWorkstation> usersWithWorkstations),
    @required TResult onFilterUpdated(String filterString),
  }) {
    assert(getAllUsersPresencesByDate != null);
    assert(presencesReceived != null);
    assert(onFilterUpdated != null);
    return onFilterUpdated(filterString);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult getAllUsersPresencesByDate(DateTime date),
    TResult presencesReceived(List<UserWithWorkstation> usersWithWorkstations),
    TResult onFilterUpdated(String filterString),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (onFilterUpdated != null) {
      return onFilterUpdated(filterString);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult getAllUsersPresencesByDate(_GetUserPresences value),
    @required TResult presencesReceived(_PresencesReceived value),
    @required TResult onFilterUpdated(_OnFilterUpdated value),
  }) {
    assert(getAllUsersPresencesByDate != null);
    assert(presencesReceived != null);
    assert(onFilterUpdated != null);
    return onFilterUpdated(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult getAllUsersPresencesByDate(_GetUserPresences value),
    TResult presencesReceived(_PresencesReceived value),
    TResult onFilterUpdated(_OnFilterUpdated value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (onFilterUpdated != null) {
      return onFilterUpdated(this);
    }
    return orElse();
  }
}

abstract class _OnFilterUpdated implements PresencesManagementWatcherEvent {
  const factory _OnFilterUpdated(String filterString) = _$_OnFilterUpdated;

  String get filterString;
  @JsonKey(ignore: true)
  _$OnFilterUpdatedCopyWith<_OnFilterUpdated> get copyWith;
}

/// @nodoc
class _$PresencesManagementWatcherStateTearOff {
  const _$PresencesManagementWatcherStateTearOff();

// ignore: unused_element
  _Initial initial() {
    return const _Initial();
  }

// ignore: unused_element
  _LoadInProgress loadInProgress() {
    return const _LoadInProgress();
  }

// ignore: unused_element
  _LoadSuccess loadSuccess(
      List<UserWithWorkstation> usersPending,
      List<UserWithWorkstation> usersConfirmed,
      List<UserWithWorkstation> usersRefusedOrAbsent) {
    return _LoadSuccess(
      usersPending,
      usersConfirmed,
      usersRefusedOrAbsent,
    );
  }

// ignore: unused_element
  _LoadFailure loadFailure() {
    return const _LoadFailure();
  }

// ignore: unused_element
  _FilteredList filteredList(List<UserWithWorkstation> filteredPresences) {
    return _FilteredList(
      filteredPresences,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $PresencesManagementWatcherState =
    _$PresencesManagementWatcherStateTearOff();

/// @nodoc
mixin _$PresencesManagementWatcherState {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult loadInProgress(),
    @required
        TResult loadSuccess(
            List<UserWithWorkstation> usersPending,
            List<UserWithWorkstation> usersConfirmed,
            List<UserWithWorkstation> usersRefusedOrAbsent),
    @required TResult loadFailure(),
    @required TResult filteredList(List<UserWithWorkstation> filteredPresences),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult loadInProgress(),
    TResult loadSuccess(
        List<UserWithWorkstation> usersPending,
        List<UserWithWorkstation> usersConfirmed,
        List<UserWithWorkstation> usersRefusedOrAbsent),
    TResult loadFailure(),
    TResult filteredList(List<UserWithWorkstation> filteredPresences),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(_Initial value),
    @required TResult loadInProgress(_LoadInProgress value),
    @required TResult loadSuccess(_LoadSuccess value),
    @required TResult loadFailure(_LoadFailure value),
    @required TResult filteredList(_FilteredList value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    TResult loadInProgress(_LoadInProgress value),
    TResult loadSuccess(_LoadSuccess value),
    TResult loadFailure(_LoadFailure value),
    TResult filteredList(_FilteredList value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $PresencesManagementWatcherStateCopyWith<$Res> {
  factory $PresencesManagementWatcherStateCopyWith(
          PresencesManagementWatcherState value,
          $Res Function(PresencesManagementWatcherState) then) =
      _$PresencesManagementWatcherStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$PresencesManagementWatcherStateCopyWithImpl<$Res>
    implements $PresencesManagementWatcherStateCopyWith<$Res> {
  _$PresencesManagementWatcherStateCopyWithImpl(this._value, this._then);

  final PresencesManagementWatcherState _value;
  // ignore: unused_field
  final $Res Function(PresencesManagementWatcherState) _then;
}

/// @nodoc
abstract class _$InitialCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) then) =
      __$InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$InitialCopyWithImpl<$Res>
    extends _$PresencesManagementWatcherStateCopyWithImpl<$Res>
    implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(_Initial _value, $Res Function(_Initial) _then)
      : super(_value, (v) => _then(v as _Initial));

  @override
  _Initial get _value => super._value as _Initial;
}

/// @nodoc
class _$_Initial implements _Initial {
  const _$_Initial();

  @override
  String toString() {
    return 'PresencesManagementWatcherState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult loadInProgress(),
    @required
        TResult loadSuccess(
            List<UserWithWorkstation> usersPending,
            List<UserWithWorkstation> usersConfirmed,
            List<UserWithWorkstation> usersRefusedOrAbsent),
    @required TResult loadFailure(),
    @required TResult filteredList(List<UserWithWorkstation> filteredPresences),
  }) {
    assert(initial != null);
    assert(loadInProgress != null);
    assert(loadSuccess != null);
    assert(loadFailure != null);
    assert(filteredList != null);
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult loadInProgress(),
    TResult loadSuccess(
        List<UserWithWorkstation> usersPending,
        List<UserWithWorkstation> usersConfirmed,
        List<UserWithWorkstation> usersRefusedOrAbsent),
    TResult loadFailure(),
    TResult filteredList(List<UserWithWorkstation> filteredPresences),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(_Initial value),
    @required TResult loadInProgress(_LoadInProgress value),
    @required TResult loadSuccess(_LoadSuccess value),
    @required TResult loadFailure(_LoadFailure value),
    @required TResult filteredList(_FilteredList value),
  }) {
    assert(initial != null);
    assert(loadInProgress != null);
    assert(loadSuccess != null);
    assert(loadFailure != null);
    assert(filteredList != null);
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    TResult loadInProgress(_LoadInProgress value),
    TResult loadSuccess(_LoadSuccess value),
    TResult loadFailure(_LoadFailure value),
    TResult filteredList(_FilteredList value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements PresencesManagementWatcherState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$LoadInProgressCopyWith<$Res> {
  factory _$LoadInProgressCopyWith(
          _LoadInProgress value, $Res Function(_LoadInProgress) then) =
      __$LoadInProgressCopyWithImpl<$Res>;
}

/// @nodoc
class __$LoadInProgressCopyWithImpl<$Res>
    extends _$PresencesManagementWatcherStateCopyWithImpl<$Res>
    implements _$LoadInProgressCopyWith<$Res> {
  __$LoadInProgressCopyWithImpl(
      _LoadInProgress _value, $Res Function(_LoadInProgress) _then)
      : super(_value, (v) => _then(v as _LoadInProgress));

  @override
  _LoadInProgress get _value => super._value as _LoadInProgress;
}

/// @nodoc
class _$_LoadInProgress implements _LoadInProgress {
  const _$_LoadInProgress();

  @override
  String toString() {
    return 'PresencesManagementWatcherState.loadInProgress()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _LoadInProgress);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult loadInProgress(),
    @required
        TResult loadSuccess(
            List<UserWithWorkstation> usersPending,
            List<UserWithWorkstation> usersConfirmed,
            List<UserWithWorkstation> usersRefusedOrAbsent),
    @required TResult loadFailure(),
    @required TResult filteredList(List<UserWithWorkstation> filteredPresences),
  }) {
    assert(initial != null);
    assert(loadInProgress != null);
    assert(loadSuccess != null);
    assert(loadFailure != null);
    assert(filteredList != null);
    return loadInProgress();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult loadInProgress(),
    TResult loadSuccess(
        List<UserWithWorkstation> usersPending,
        List<UserWithWorkstation> usersConfirmed,
        List<UserWithWorkstation> usersRefusedOrAbsent),
    TResult loadFailure(),
    TResult filteredList(List<UserWithWorkstation> filteredPresences),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (loadInProgress != null) {
      return loadInProgress();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(_Initial value),
    @required TResult loadInProgress(_LoadInProgress value),
    @required TResult loadSuccess(_LoadSuccess value),
    @required TResult loadFailure(_LoadFailure value),
    @required TResult filteredList(_FilteredList value),
  }) {
    assert(initial != null);
    assert(loadInProgress != null);
    assert(loadSuccess != null);
    assert(loadFailure != null);
    assert(filteredList != null);
    return loadInProgress(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    TResult loadInProgress(_LoadInProgress value),
    TResult loadSuccess(_LoadSuccess value),
    TResult loadFailure(_LoadFailure value),
    TResult filteredList(_FilteredList value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (loadInProgress != null) {
      return loadInProgress(this);
    }
    return orElse();
  }
}

abstract class _LoadInProgress implements PresencesManagementWatcherState {
  const factory _LoadInProgress() = _$_LoadInProgress;
}

/// @nodoc
abstract class _$LoadSuccessCopyWith<$Res> {
  factory _$LoadSuccessCopyWith(
          _LoadSuccess value, $Res Function(_LoadSuccess) then) =
      __$LoadSuccessCopyWithImpl<$Res>;
  $Res call(
      {List<UserWithWorkstation> usersPending,
      List<UserWithWorkstation> usersConfirmed,
      List<UserWithWorkstation> usersRefusedOrAbsent});
}

/// @nodoc
class __$LoadSuccessCopyWithImpl<$Res>
    extends _$PresencesManagementWatcherStateCopyWithImpl<$Res>
    implements _$LoadSuccessCopyWith<$Res> {
  __$LoadSuccessCopyWithImpl(
      _LoadSuccess _value, $Res Function(_LoadSuccess) _then)
      : super(_value, (v) => _then(v as _LoadSuccess));

  @override
  _LoadSuccess get _value => super._value as _LoadSuccess;

  @override
  $Res call({
    Object usersPending = freezed,
    Object usersConfirmed = freezed,
    Object usersRefusedOrAbsent = freezed,
  }) {
    return _then(_LoadSuccess(
      usersPending == freezed
          ? _value.usersPending
          : usersPending as List<UserWithWorkstation>,
      usersConfirmed == freezed
          ? _value.usersConfirmed
          : usersConfirmed as List<UserWithWorkstation>,
      usersRefusedOrAbsent == freezed
          ? _value.usersRefusedOrAbsent
          : usersRefusedOrAbsent as List<UserWithWorkstation>,
    ));
  }
}

/// @nodoc
class _$_LoadSuccess implements _LoadSuccess {
  const _$_LoadSuccess(
      this.usersPending, this.usersConfirmed, this.usersRefusedOrAbsent)
      : assert(usersPending != null),
        assert(usersConfirmed != null),
        assert(usersRefusedOrAbsent != null);

  @override
  final List<UserWithWorkstation> usersPending;
  @override
  final List<UserWithWorkstation> usersConfirmed;
  @override
  final List<UserWithWorkstation> usersRefusedOrAbsent;

  @override
  String toString() {
    return 'PresencesManagementWatcherState.loadSuccess(usersPending: $usersPending, usersConfirmed: $usersConfirmed, usersRefusedOrAbsent: $usersRefusedOrAbsent)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _LoadSuccess &&
            (identical(other.usersPending, usersPending) ||
                const DeepCollectionEquality()
                    .equals(other.usersPending, usersPending)) &&
            (identical(other.usersConfirmed, usersConfirmed) ||
                const DeepCollectionEquality()
                    .equals(other.usersConfirmed, usersConfirmed)) &&
            (identical(other.usersRefusedOrAbsent, usersRefusedOrAbsent) ||
                const DeepCollectionEquality()
                    .equals(other.usersRefusedOrAbsent, usersRefusedOrAbsent)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(usersPending) ^
      const DeepCollectionEquality().hash(usersConfirmed) ^
      const DeepCollectionEquality().hash(usersRefusedOrAbsent);

  @JsonKey(ignore: true)
  @override
  _$LoadSuccessCopyWith<_LoadSuccess> get copyWith =>
      __$LoadSuccessCopyWithImpl<_LoadSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult loadInProgress(),
    @required
        TResult loadSuccess(
            List<UserWithWorkstation> usersPending,
            List<UserWithWorkstation> usersConfirmed,
            List<UserWithWorkstation> usersRefusedOrAbsent),
    @required TResult loadFailure(),
    @required TResult filteredList(List<UserWithWorkstation> filteredPresences),
  }) {
    assert(initial != null);
    assert(loadInProgress != null);
    assert(loadSuccess != null);
    assert(loadFailure != null);
    assert(filteredList != null);
    return loadSuccess(usersPending, usersConfirmed, usersRefusedOrAbsent);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult loadInProgress(),
    TResult loadSuccess(
        List<UserWithWorkstation> usersPending,
        List<UserWithWorkstation> usersConfirmed,
        List<UserWithWorkstation> usersRefusedOrAbsent),
    TResult loadFailure(),
    TResult filteredList(List<UserWithWorkstation> filteredPresences),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (loadSuccess != null) {
      return loadSuccess(usersPending, usersConfirmed, usersRefusedOrAbsent);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(_Initial value),
    @required TResult loadInProgress(_LoadInProgress value),
    @required TResult loadSuccess(_LoadSuccess value),
    @required TResult loadFailure(_LoadFailure value),
    @required TResult filteredList(_FilteredList value),
  }) {
    assert(initial != null);
    assert(loadInProgress != null);
    assert(loadSuccess != null);
    assert(loadFailure != null);
    assert(filteredList != null);
    return loadSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    TResult loadInProgress(_LoadInProgress value),
    TResult loadSuccess(_LoadSuccess value),
    TResult loadFailure(_LoadFailure value),
    TResult filteredList(_FilteredList value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (loadSuccess != null) {
      return loadSuccess(this);
    }
    return orElse();
  }
}

abstract class _LoadSuccess implements PresencesManagementWatcherState {
  const factory _LoadSuccess(
      List<UserWithWorkstation> usersPending,
      List<UserWithWorkstation> usersConfirmed,
      List<UserWithWorkstation> usersRefusedOrAbsent) = _$_LoadSuccess;

  List<UserWithWorkstation> get usersPending;
  List<UserWithWorkstation> get usersConfirmed;
  List<UserWithWorkstation> get usersRefusedOrAbsent;
  @JsonKey(ignore: true)
  _$LoadSuccessCopyWith<_LoadSuccess> get copyWith;
}

/// @nodoc
abstract class _$LoadFailureCopyWith<$Res> {
  factory _$LoadFailureCopyWith(
          _LoadFailure value, $Res Function(_LoadFailure) then) =
      __$LoadFailureCopyWithImpl<$Res>;
}

/// @nodoc
class __$LoadFailureCopyWithImpl<$Res>
    extends _$PresencesManagementWatcherStateCopyWithImpl<$Res>
    implements _$LoadFailureCopyWith<$Res> {
  __$LoadFailureCopyWithImpl(
      _LoadFailure _value, $Res Function(_LoadFailure) _then)
      : super(_value, (v) => _then(v as _LoadFailure));

  @override
  _LoadFailure get _value => super._value as _LoadFailure;
}

/// @nodoc
class _$_LoadFailure implements _LoadFailure {
  const _$_LoadFailure();

  @override
  String toString() {
    return 'PresencesManagementWatcherState.loadFailure()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _LoadFailure);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult loadInProgress(),
    @required
        TResult loadSuccess(
            List<UserWithWorkstation> usersPending,
            List<UserWithWorkstation> usersConfirmed,
            List<UserWithWorkstation> usersRefusedOrAbsent),
    @required TResult loadFailure(),
    @required TResult filteredList(List<UserWithWorkstation> filteredPresences),
  }) {
    assert(initial != null);
    assert(loadInProgress != null);
    assert(loadSuccess != null);
    assert(loadFailure != null);
    assert(filteredList != null);
    return loadFailure();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult loadInProgress(),
    TResult loadSuccess(
        List<UserWithWorkstation> usersPending,
        List<UserWithWorkstation> usersConfirmed,
        List<UserWithWorkstation> usersRefusedOrAbsent),
    TResult loadFailure(),
    TResult filteredList(List<UserWithWorkstation> filteredPresences),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (loadFailure != null) {
      return loadFailure();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(_Initial value),
    @required TResult loadInProgress(_LoadInProgress value),
    @required TResult loadSuccess(_LoadSuccess value),
    @required TResult loadFailure(_LoadFailure value),
    @required TResult filteredList(_FilteredList value),
  }) {
    assert(initial != null);
    assert(loadInProgress != null);
    assert(loadSuccess != null);
    assert(loadFailure != null);
    assert(filteredList != null);
    return loadFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    TResult loadInProgress(_LoadInProgress value),
    TResult loadSuccess(_LoadSuccess value),
    TResult loadFailure(_LoadFailure value),
    TResult filteredList(_FilteredList value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (loadFailure != null) {
      return loadFailure(this);
    }
    return orElse();
  }
}

abstract class _LoadFailure implements PresencesManagementWatcherState {
  const factory _LoadFailure() = _$_LoadFailure;
}

/// @nodoc
abstract class _$FilteredListCopyWith<$Res> {
  factory _$FilteredListCopyWith(
          _FilteredList value, $Res Function(_FilteredList) then) =
      __$FilteredListCopyWithImpl<$Res>;
  $Res call({List<UserWithWorkstation> filteredPresences});
}

/// @nodoc
class __$FilteredListCopyWithImpl<$Res>
    extends _$PresencesManagementWatcherStateCopyWithImpl<$Res>
    implements _$FilteredListCopyWith<$Res> {
  __$FilteredListCopyWithImpl(
      _FilteredList _value, $Res Function(_FilteredList) _then)
      : super(_value, (v) => _then(v as _FilteredList));

  @override
  _FilteredList get _value => super._value as _FilteredList;

  @override
  $Res call({
    Object filteredPresences = freezed,
  }) {
    return _then(_FilteredList(
      filteredPresences == freezed
          ? _value.filteredPresences
          : filteredPresences as List<UserWithWorkstation>,
    ));
  }
}

/// @nodoc
class _$_FilteredList implements _FilteredList {
  const _$_FilteredList(this.filteredPresences)
      : assert(filteredPresences != null);

  @override
  final List<UserWithWorkstation> filteredPresences;

  @override
  String toString() {
    return 'PresencesManagementWatcherState.filteredList(filteredPresences: $filteredPresences)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _FilteredList &&
            (identical(other.filteredPresences, filteredPresences) ||
                const DeepCollectionEquality()
                    .equals(other.filteredPresences, filteredPresences)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(filteredPresences);

  @JsonKey(ignore: true)
  @override
  _$FilteredListCopyWith<_FilteredList> get copyWith =>
      __$FilteredListCopyWithImpl<_FilteredList>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult loadInProgress(),
    @required
        TResult loadSuccess(
            List<UserWithWorkstation> usersPending,
            List<UserWithWorkstation> usersConfirmed,
            List<UserWithWorkstation> usersRefusedOrAbsent),
    @required TResult loadFailure(),
    @required TResult filteredList(List<UserWithWorkstation> filteredPresences),
  }) {
    assert(initial != null);
    assert(loadInProgress != null);
    assert(loadSuccess != null);
    assert(loadFailure != null);
    assert(filteredList != null);
    return filteredList(filteredPresences);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult loadInProgress(),
    TResult loadSuccess(
        List<UserWithWorkstation> usersPending,
        List<UserWithWorkstation> usersConfirmed,
        List<UserWithWorkstation> usersRefusedOrAbsent),
    TResult loadFailure(),
    TResult filteredList(List<UserWithWorkstation> filteredPresences),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (filteredList != null) {
      return filteredList(filteredPresences);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(_Initial value),
    @required TResult loadInProgress(_LoadInProgress value),
    @required TResult loadSuccess(_LoadSuccess value),
    @required TResult loadFailure(_LoadFailure value),
    @required TResult filteredList(_FilteredList value),
  }) {
    assert(initial != null);
    assert(loadInProgress != null);
    assert(loadSuccess != null);
    assert(loadFailure != null);
    assert(filteredList != null);
    return filteredList(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    TResult loadInProgress(_LoadInProgress value),
    TResult loadSuccess(_LoadSuccess value),
    TResult loadFailure(_LoadFailure value),
    TResult filteredList(_FilteredList value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (filteredList != null) {
      return filteredList(this);
    }
    return orElse();
  }
}

abstract class _FilteredList implements PresencesManagementWatcherState {
  const factory _FilteredList(List<UserWithWorkstation> filteredPresences) =
      _$_FilteredList;

  List<UserWithWorkstation> get filteredPresences;
  @JsonKey(ignore: true)
  _$FilteredListCopyWith<_FilteredList> get copyWith;
}
