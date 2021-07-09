// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'roles_management_watcher_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$RolesManagementWatcherEventTearOff {
  const _$RolesManagementWatcherEventTearOff();

// ignore: unused_element
  _GetAllUsers getAllUsers() {
    return const _GetAllUsers();
  }

// ignore: unused_element
  _OnFilterUpdate onFilterUpdate({@required String filter}) {
    return _OnFilterUpdate(
      filter: filter,
    );
  }

// ignore: unused_element
  _OnListUpdate onListUpdate() {
    return const _OnListUpdate();
  }
}

/// @nodoc
// ignore: unused_element
const $RolesManagementWatcherEvent = _$RolesManagementWatcherEventTearOff();

/// @nodoc
mixin _$RolesManagementWatcherEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult getAllUsers(),
    @required TResult onFilterUpdate(String filter),
    @required TResult onListUpdate(),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult getAllUsers(),
    TResult onFilterUpdate(String filter),
    TResult onListUpdate(),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult getAllUsers(_GetAllUsers value),
    @required TResult onFilterUpdate(_OnFilterUpdate value),
    @required TResult onListUpdate(_OnListUpdate value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult getAllUsers(_GetAllUsers value),
    TResult onFilterUpdate(_OnFilterUpdate value),
    TResult onListUpdate(_OnListUpdate value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $RolesManagementWatcherEventCopyWith<$Res> {
  factory $RolesManagementWatcherEventCopyWith(
          RolesManagementWatcherEvent value,
          $Res Function(RolesManagementWatcherEvent) then) =
      _$RolesManagementWatcherEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$RolesManagementWatcherEventCopyWithImpl<$Res>
    implements $RolesManagementWatcherEventCopyWith<$Res> {
  _$RolesManagementWatcherEventCopyWithImpl(this._value, this._then);

  final RolesManagementWatcherEvent _value;
  // ignore: unused_field
  final $Res Function(RolesManagementWatcherEvent) _then;
}

/// @nodoc
abstract class _$GetAllUsersCopyWith<$Res> {
  factory _$GetAllUsersCopyWith(
          _GetAllUsers value, $Res Function(_GetAllUsers) then) =
      __$GetAllUsersCopyWithImpl<$Res>;
}

/// @nodoc
class __$GetAllUsersCopyWithImpl<$Res>
    extends _$RolesManagementWatcherEventCopyWithImpl<$Res>
    implements _$GetAllUsersCopyWith<$Res> {
  __$GetAllUsersCopyWithImpl(
      _GetAllUsers _value, $Res Function(_GetAllUsers) _then)
      : super(_value, (v) => _then(v as _GetAllUsers));

  @override
  _GetAllUsers get _value => super._value as _GetAllUsers;
}

/// @nodoc
class _$_GetAllUsers implements _GetAllUsers {
  const _$_GetAllUsers();

  @override
  String toString() {
    return 'RolesManagementWatcherEvent.getAllUsers()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _GetAllUsers);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult getAllUsers(),
    @required TResult onFilterUpdate(String filter),
    @required TResult onListUpdate(),
  }) {
    assert(getAllUsers != null);
    assert(onFilterUpdate != null);
    assert(onListUpdate != null);
    return getAllUsers();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult getAllUsers(),
    TResult onFilterUpdate(String filter),
    TResult onListUpdate(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (getAllUsers != null) {
      return getAllUsers();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult getAllUsers(_GetAllUsers value),
    @required TResult onFilterUpdate(_OnFilterUpdate value),
    @required TResult onListUpdate(_OnListUpdate value),
  }) {
    assert(getAllUsers != null);
    assert(onFilterUpdate != null);
    assert(onListUpdate != null);
    return getAllUsers(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult getAllUsers(_GetAllUsers value),
    TResult onFilterUpdate(_OnFilterUpdate value),
    TResult onListUpdate(_OnListUpdate value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (getAllUsers != null) {
      return getAllUsers(this);
    }
    return orElse();
  }
}

abstract class _GetAllUsers implements RolesManagementWatcherEvent {
  const factory _GetAllUsers() = _$_GetAllUsers;
}

/// @nodoc
abstract class _$OnFilterUpdateCopyWith<$Res> {
  factory _$OnFilterUpdateCopyWith(
          _OnFilterUpdate value, $Res Function(_OnFilterUpdate) then) =
      __$OnFilterUpdateCopyWithImpl<$Res>;
  $Res call({String filter});
}

/// @nodoc
class __$OnFilterUpdateCopyWithImpl<$Res>
    extends _$RolesManagementWatcherEventCopyWithImpl<$Res>
    implements _$OnFilterUpdateCopyWith<$Res> {
  __$OnFilterUpdateCopyWithImpl(
      _OnFilterUpdate _value, $Res Function(_OnFilterUpdate) _then)
      : super(_value, (v) => _then(v as _OnFilterUpdate));

  @override
  _OnFilterUpdate get _value => super._value as _OnFilterUpdate;

  @override
  $Res call({
    Object filter = freezed,
  }) {
    return _then(_OnFilterUpdate(
      filter: filter == freezed ? _value.filter : filter as String,
    ));
  }
}

/// @nodoc
class _$_OnFilterUpdate implements _OnFilterUpdate {
  const _$_OnFilterUpdate({@required this.filter}) : assert(filter != null);

  @override
  final String filter;

  @override
  String toString() {
    return 'RolesManagementWatcherEvent.onFilterUpdate(filter: $filter)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _OnFilterUpdate &&
            (identical(other.filter, filter) ||
                const DeepCollectionEquality().equals(other.filter, filter)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(filter);

  @JsonKey(ignore: true)
  @override
  _$OnFilterUpdateCopyWith<_OnFilterUpdate> get copyWith =>
      __$OnFilterUpdateCopyWithImpl<_OnFilterUpdate>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult getAllUsers(),
    @required TResult onFilterUpdate(String filter),
    @required TResult onListUpdate(),
  }) {
    assert(getAllUsers != null);
    assert(onFilterUpdate != null);
    assert(onListUpdate != null);
    return onFilterUpdate(filter);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult getAllUsers(),
    TResult onFilterUpdate(String filter),
    TResult onListUpdate(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (onFilterUpdate != null) {
      return onFilterUpdate(filter);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult getAllUsers(_GetAllUsers value),
    @required TResult onFilterUpdate(_OnFilterUpdate value),
    @required TResult onListUpdate(_OnListUpdate value),
  }) {
    assert(getAllUsers != null);
    assert(onFilterUpdate != null);
    assert(onListUpdate != null);
    return onFilterUpdate(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult getAllUsers(_GetAllUsers value),
    TResult onFilterUpdate(_OnFilterUpdate value),
    TResult onListUpdate(_OnListUpdate value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (onFilterUpdate != null) {
      return onFilterUpdate(this);
    }
    return orElse();
  }
}

abstract class _OnFilterUpdate implements RolesManagementWatcherEvent {
  const factory _OnFilterUpdate({@required String filter}) = _$_OnFilterUpdate;

  String get filter;
  @JsonKey(ignore: true)
  _$OnFilterUpdateCopyWith<_OnFilterUpdate> get copyWith;
}

/// @nodoc
abstract class _$OnListUpdateCopyWith<$Res> {
  factory _$OnListUpdateCopyWith(
          _OnListUpdate value, $Res Function(_OnListUpdate) then) =
      __$OnListUpdateCopyWithImpl<$Res>;
}

/// @nodoc
class __$OnListUpdateCopyWithImpl<$Res>
    extends _$RolesManagementWatcherEventCopyWithImpl<$Res>
    implements _$OnListUpdateCopyWith<$Res> {
  __$OnListUpdateCopyWithImpl(
      _OnListUpdate _value, $Res Function(_OnListUpdate) _then)
      : super(_value, (v) => _then(v as _OnListUpdate));

  @override
  _OnListUpdate get _value => super._value as _OnListUpdate;
}

/// @nodoc
class _$_OnListUpdate implements _OnListUpdate {
  const _$_OnListUpdate();

  @override
  String toString() {
    return 'RolesManagementWatcherEvent.onListUpdate()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _OnListUpdate);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult getAllUsers(),
    @required TResult onFilterUpdate(String filter),
    @required TResult onListUpdate(),
  }) {
    assert(getAllUsers != null);
    assert(onFilterUpdate != null);
    assert(onListUpdate != null);
    return onListUpdate();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult getAllUsers(),
    TResult onFilterUpdate(String filter),
    TResult onListUpdate(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (onListUpdate != null) {
      return onListUpdate();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult getAllUsers(_GetAllUsers value),
    @required TResult onFilterUpdate(_OnFilterUpdate value),
    @required TResult onListUpdate(_OnListUpdate value),
  }) {
    assert(getAllUsers != null);
    assert(onFilterUpdate != null);
    assert(onListUpdate != null);
    return onListUpdate(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult getAllUsers(_GetAllUsers value),
    TResult onFilterUpdate(_OnFilterUpdate value),
    TResult onListUpdate(_OnListUpdate value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (onListUpdate != null) {
      return onListUpdate(this);
    }
    return orElse();
  }
}

abstract class _OnListUpdate implements RolesManagementWatcherEvent {
  const factory _OnListUpdate() = _$_OnListUpdate;
}

/// @nodoc
class _$RolesManagementWatcherStateTearOff {
  const _$RolesManagementWatcherStateTearOff();

// ignore: unused_element
  _Initial initial() {
    return const _Initial();
  }

// ignore: unused_element
  _LoadInProgress loadInProgress() {
    return const _LoadInProgress();
  }

// ignore: unused_element
  _LoadSuccess loadSuccess(List<User> users) {
    return _LoadSuccess(
      users,
    );
  }

// ignore: unused_element
  _LoadFailure loadFailure() {
    return const _LoadFailure();
  }

// ignore: unused_element
  _FilteredList filteredList(
      {@required String filter, @required List<User> filteredList}) {
    return _FilteredList(
      filter: filter,
      filteredList: filteredList,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $RolesManagementWatcherState = _$RolesManagementWatcherStateTearOff();

/// @nodoc
mixin _$RolesManagementWatcherState {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult loadInProgress(),
    @required TResult loadSuccess(List<User> users),
    @required TResult loadFailure(),
    @required TResult filteredList(String filter, List<User> filteredList),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult loadInProgress(),
    TResult loadSuccess(List<User> users),
    TResult loadFailure(),
    TResult filteredList(String filter, List<User> filteredList),
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
abstract class $RolesManagementWatcherStateCopyWith<$Res> {
  factory $RolesManagementWatcherStateCopyWith(
          RolesManagementWatcherState value,
          $Res Function(RolesManagementWatcherState) then) =
      _$RolesManagementWatcherStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$RolesManagementWatcherStateCopyWithImpl<$Res>
    implements $RolesManagementWatcherStateCopyWith<$Res> {
  _$RolesManagementWatcherStateCopyWithImpl(this._value, this._then);

  final RolesManagementWatcherState _value;
  // ignore: unused_field
  final $Res Function(RolesManagementWatcherState) _then;
}

/// @nodoc
abstract class _$InitialCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) then) =
      __$InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$InitialCopyWithImpl<$Res>
    extends _$RolesManagementWatcherStateCopyWithImpl<$Res>
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
    return 'RolesManagementWatcherState.initial()';
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
    @required TResult loadSuccess(List<User> users),
    @required TResult loadFailure(),
    @required TResult filteredList(String filter, List<User> filteredList),
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
    TResult loadSuccess(List<User> users),
    TResult loadFailure(),
    TResult filteredList(String filter, List<User> filteredList),
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

abstract class _Initial implements RolesManagementWatcherState {
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
    extends _$RolesManagementWatcherStateCopyWithImpl<$Res>
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
    return 'RolesManagementWatcherState.loadInProgress()';
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
    @required TResult loadSuccess(List<User> users),
    @required TResult loadFailure(),
    @required TResult filteredList(String filter, List<User> filteredList),
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
    TResult loadSuccess(List<User> users),
    TResult loadFailure(),
    TResult filteredList(String filter, List<User> filteredList),
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

abstract class _LoadInProgress implements RolesManagementWatcherState {
  const factory _LoadInProgress() = _$_LoadInProgress;
}

/// @nodoc
abstract class _$LoadSuccessCopyWith<$Res> {
  factory _$LoadSuccessCopyWith(
          _LoadSuccess value, $Res Function(_LoadSuccess) then) =
      __$LoadSuccessCopyWithImpl<$Res>;
  $Res call({List<User> users});
}

/// @nodoc
class __$LoadSuccessCopyWithImpl<$Res>
    extends _$RolesManagementWatcherStateCopyWithImpl<$Res>
    implements _$LoadSuccessCopyWith<$Res> {
  __$LoadSuccessCopyWithImpl(
      _LoadSuccess _value, $Res Function(_LoadSuccess) _then)
      : super(_value, (v) => _then(v as _LoadSuccess));

  @override
  _LoadSuccess get _value => super._value as _LoadSuccess;

  @override
  $Res call({
    Object users = freezed,
  }) {
    return _then(_LoadSuccess(
      users == freezed ? _value.users : users as List<User>,
    ));
  }
}

/// @nodoc
class _$_LoadSuccess implements _LoadSuccess {
  const _$_LoadSuccess(this.users) : assert(users != null);

  @override
  final List<User> users;

  @override
  String toString() {
    return 'RolesManagementWatcherState.loadSuccess(users: $users)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _LoadSuccess &&
            (identical(other.users, users) ||
                const DeepCollectionEquality().equals(other.users, users)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(users);

  @JsonKey(ignore: true)
  @override
  _$LoadSuccessCopyWith<_LoadSuccess> get copyWith =>
      __$LoadSuccessCopyWithImpl<_LoadSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult loadInProgress(),
    @required TResult loadSuccess(List<User> users),
    @required TResult loadFailure(),
    @required TResult filteredList(String filter, List<User> filteredList),
  }) {
    assert(initial != null);
    assert(loadInProgress != null);
    assert(loadSuccess != null);
    assert(loadFailure != null);
    assert(filteredList != null);
    return loadSuccess(users);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult loadInProgress(),
    TResult loadSuccess(List<User> users),
    TResult loadFailure(),
    TResult filteredList(String filter, List<User> filteredList),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (loadSuccess != null) {
      return loadSuccess(users);
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

abstract class _LoadSuccess implements RolesManagementWatcherState {
  const factory _LoadSuccess(List<User> users) = _$_LoadSuccess;

  List<User> get users;
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
    extends _$RolesManagementWatcherStateCopyWithImpl<$Res>
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
    return 'RolesManagementWatcherState.loadFailure()';
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
    @required TResult loadSuccess(List<User> users),
    @required TResult loadFailure(),
    @required TResult filteredList(String filter, List<User> filteredList),
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
    TResult loadSuccess(List<User> users),
    TResult loadFailure(),
    TResult filteredList(String filter, List<User> filteredList),
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

abstract class _LoadFailure implements RolesManagementWatcherState {
  const factory _LoadFailure() = _$_LoadFailure;
}

/// @nodoc
abstract class _$FilteredListCopyWith<$Res> {
  factory _$FilteredListCopyWith(
          _FilteredList value, $Res Function(_FilteredList) then) =
      __$FilteredListCopyWithImpl<$Res>;
  $Res call({String filter, List<User> filteredList});
}

/// @nodoc
class __$FilteredListCopyWithImpl<$Res>
    extends _$RolesManagementWatcherStateCopyWithImpl<$Res>
    implements _$FilteredListCopyWith<$Res> {
  __$FilteredListCopyWithImpl(
      _FilteredList _value, $Res Function(_FilteredList) _then)
      : super(_value, (v) => _then(v as _FilteredList));

  @override
  _FilteredList get _value => super._value as _FilteredList;

  @override
  $Res call({
    Object filter = freezed,
    Object filteredList = freezed,
  }) {
    return _then(_FilteredList(
      filter: filter == freezed ? _value.filter : filter as String,
      filteredList: filteredList == freezed
          ? _value.filteredList
          : filteredList as List<User>,
    ));
  }
}

/// @nodoc
class _$_FilteredList implements _FilteredList {
  const _$_FilteredList({@required this.filter, @required this.filteredList})
      : assert(filter != null),
        assert(filteredList != null);

  @override
  final String filter;
  @override
  final List<User> filteredList;

  @override
  String toString() {
    return 'RolesManagementWatcherState.filteredList(filter: $filter, filteredList: $filteredList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _FilteredList &&
            (identical(other.filter, filter) ||
                const DeepCollectionEquality().equals(other.filter, filter)) &&
            (identical(other.filteredList, filteredList) ||
                const DeepCollectionEquality()
                    .equals(other.filteredList, filteredList)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(filter) ^
      const DeepCollectionEquality().hash(filteredList);

  @JsonKey(ignore: true)
  @override
  _$FilteredListCopyWith<_FilteredList> get copyWith =>
      __$FilteredListCopyWithImpl<_FilteredList>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult loadInProgress(),
    @required TResult loadSuccess(List<User> users),
    @required TResult loadFailure(),
    @required TResult filteredList(String filter, List<User> filteredList),
  }) {
    assert(initial != null);
    assert(loadInProgress != null);
    assert(loadSuccess != null);
    assert(loadFailure != null);
    assert(filteredList != null);
    return filteredList(filter, this.filteredList);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult loadInProgress(),
    TResult loadSuccess(List<User> users),
    TResult loadFailure(),
    TResult filteredList(String filter, List<User> filteredList),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (filteredList != null) {
      return filteredList(filter, this.filteredList);
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

abstract class _FilteredList implements RolesManagementWatcherState {
  const factory _FilteredList(
      {@required String filter,
      @required List<User> filteredList}) = _$_FilteredList;

  String get filter;
  List<User> get filteredList;
  @JsonKey(ignore: true)
  _$FilteredListCopyWith<_FilteredList> get copyWith;
}
