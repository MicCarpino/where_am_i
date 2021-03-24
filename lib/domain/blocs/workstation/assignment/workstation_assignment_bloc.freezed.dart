// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'workstation_assignment_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$WorkstationAssignmentEventTearOff {
  const _$WorkstationAssignmentEventTearOff();

// ignore: unused_element
  _OnListUpdated onListUpdated(
      List<UserWithWorkstation> allUsersWithWorkstations) {
    return _OnListUpdated(
      allUsersWithWorkstations,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $WorkstationAssignmentEvent = _$WorkstationAssignmentEventTearOff();

/// @nodoc
mixin _$WorkstationAssignmentEvent {
  List<UserWithWorkstation> get allUsersWithWorkstations;

  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required
        TResult onListUpdated(
            List<UserWithWorkstation> allUsersWithWorkstations),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult onListUpdated(List<UserWithWorkstation> allUsersWithWorkstations),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult onListUpdated(_OnListUpdated value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult onListUpdated(_OnListUpdated value),
    @required TResult orElse(),
  });

  @JsonKey(ignore: true)
  $WorkstationAssignmentEventCopyWith<WorkstationAssignmentEvent> get copyWith;
}

/// @nodoc
abstract class $WorkstationAssignmentEventCopyWith<$Res> {
  factory $WorkstationAssignmentEventCopyWith(WorkstationAssignmentEvent value,
          $Res Function(WorkstationAssignmentEvent) then) =
      _$WorkstationAssignmentEventCopyWithImpl<$Res>;
  $Res call({List<UserWithWorkstation> allUsersWithWorkstations});
}

/// @nodoc
class _$WorkstationAssignmentEventCopyWithImpl<$Res>
    implements $WorkstationAssignmentEventCopyWith<$Res> {
  _$WorkstationAssignmentEventCopyWithImpl(this._value, this._then);

  final WorkstationAssignmentEvent _value;
  // ignore: unused_field
  final $Res Function(WorkstationAssignmentEvent) _then;

  @override
  $Res call({
    Object allUsersWithWorkstations = freezed,
  }) {
    return _then(_value.copyWith(
      allUsersWithWorkstations: allUsersWithWorkstations == freezed
          ? _value.allUsersWithWorkstations
          : allUsersWithWorkstations as List<UserWithWorkstation>,
    ));
  }
}

/// @nodoc
abstract class _$OnListUpdatedCopyWith<$Res>
    implements $WorkstationAssignmentEventCopyWith<$Res> {
  factory _$OnListUpdatedCopyWith(
          _OnListUpdated value, $Res Function(_OnListUpdated) then) =
      __$OnListUpdatedCopyWithImpl<$Res>;
  @override
  $Res call({List<UserWithWorkstation> allUsersWithWorkstations});
}

/// @nodoc
class __$OnListUpdatedCopyWithImpl<$Res>
    extends _$WorkstationAssignmentEventCopyWithImpl<$Res>
    implements _$OnListUpdatedCopyWith<$Res> {
  __$OnListUpdatedCopyWithImpl(
      _OnListUpdated _value, $Res Function(_OnListUpdated) _then)
      : super(_value, (v) => _then(v as _OnListUpdated));

  @override
  _OnListUpdated get _value => super._value as _OnListUpdated;

  @override
  $Res call({
    Object allUsersWithWorkstations = freezed,
  }) {
    return _then(_OnListUpdated(
      allUsersWithWorkstations == freezed
          ? _value.allUsersWithWorkstations
          : allUsersWithWorkstations as List<UserWithWorkstation>,
    ));
  }
}

/// @nodoc
class _$_OnListUpdated implements _OnListUpdated {
  const _$_OnListUpdated(this.allUsersWithWorkstations)
      : assert(allUsersWithWorkstations != null);

  @override
  final List<UserWithWorkstation> allUsersWithWorkstations;

  @override
  String toString() {
    return 'WorkstationAssignmentEvent.onListUpdated(allUsersWithWorkstations: $allUsersWithWorkstations)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _OnListUpdated &&
            (identical(
                    other.allUsersWithWorkstations, allUsersWithWorkstations) ||
                const DeepCollectionEquality().equals(
                    other.allUsersWithWorkstations, allUsersWithWorkstations)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(allUsersWithWorkstations);

  @JsonKey(ignore: true)
  @override
  _$OnListUpdatedCopyWith<_OnListUpdated> get copyWith =>
      __$OnListUpdatedCopyWithImpl<_OnListUpdated>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required
        TResult onListUpdated(
            List<UserWithWorkstation> allUsersWithWorkstations),
  }) {
    assert(onListUpdated != null);
    return onListUpdated(allUsersWithWorkstations);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult onListUpdated(List<UserWithWorkstation> allUsersWithWorkstations),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (onListUpdated != null) {
      return onListUpdated(allUsersWithWorkstations);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult onListUpdated(_OnListUpdated value),
  }) {
    assert(onListUpdated != null);
    return onListUpdated(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult onListUpdated(_OnListUpdated value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (onListUpdated != null) {
      return onListUpdated(this);
    }
    return orElse();
  }
}

abstract class _OnListUpdated implements WorkstationAssignmentEvent {
  const factory _OnListUpdated(
      List<UserWithWorkstation> allUsersWithWorkstations) = _$_OnListUpdated;

  @override
  List<UserWithWorkstation> get allUsersWithWorkstations;
  @override
  @JsonKey(ignore: true)
  _$OnListUpdatedCopyWith<_OnListUpdated> get copyWith;
}

/// @nodoc
class _$WorkstationAssignmentStateTearOff {
  const _$WorkstationAssignmentStateTearOff();

// ignore: unused_element
  _Initial initial() {
    return const _Initial();
  }

// ignore: unused_element
  _LoadSuccess loadSuccess(
      {@required int workstationCode,
      @required List<UserWithWorkstation> assignedResources,
      @required List<UserWithWorkstation> assignableResources}) {
    return _LoadSuccess(
      workstationCode: workstationCode,
      assignedResources: assignedResources,
      assignableResources: assignableResources,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $WorkstationAssignmentState = _$WorkstationAssignmentStateTearOff();

/// @nodoc
mixin _$WorkstationAssignmentState {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required
        TResult loadSuccess(
            int workstationCode,
            List<UserWithWorkstation> assignedResources,
            List<UserWithWorkstation> assignableResources),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult loadSuccess(
        int workstationCode,
        List<UserWithWorkstation> assignedResources,
        List<UserWithWorkstation> assignableResources),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(_Initial value),
    @required TResult loadSuccess(_LoadSuccess value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    TResult loadSuccess(_LoadSuccess value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $WorkstationAssignmentStateCopyWith<$Res> {
  factory $WorkstationAssignmentStateCopyWith(WorkstationAssignmentState value,
          $Res Function(WorkstationAssignmentState) then) =
      _$WorkstationAssignmentStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$WorkstationAssignmentStateCopyWithImpl<$Res>
    implements $WorkstationAssignmentStateCopyWith<$Res> {
  _$WorkstationAssignmentStateCopyWithImpl(this._value, this._then);

  final WorkstationAssignmentState _value;
  // ignore: unused_field
  final $Res Function(WorkstationAssignmentState) _then;
}

/// @nodoc
abstract class _$InitialCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) then) =
      __$InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$InitialCopyWithImpl<$Res>
    extends _$WorkstationAssignmentStateCopyWithImpl<$Res>
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
    return 'WorkstationAssignmentState.initial()';
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
    @required
        TResult loadSuccess(
            int workstationCode,
            List<UserWithWorkstation> assignedResources,
            List<UserWithWorkstation> assignableResources),
  }) {
    assert(initial != null);
    assert(loadSuccess != null);
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult loadSuccess(
        int workstationCode,
        List<UserWithWorkstation> assignedResources,
        List<UserWithWorkstation> assignableResources),
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
    @required TResult loadSuccess(_LoadSuccess value),
  }) {
    assert(initial != null);
    assert(loadSuccess != null);
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    TResult loadSuccess(_LoadSuccess value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements WorkstationAssignmentState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$LoadSuccessCopyWith<$Res> {
  factory _$LoadSuccessCopyWith(
          _LoadSuccess value, $Res Function(_LoadSuccess) then) =
      __$LoadSuccessCopyWithImpl<$Res>;
  $Res call(
      {int workstationCode,
      List<UserWithWorkstation> assignedResources,
      List<UserWithWorkstation> assignableResources});
}

/// @nodoc
class __$LoadSuccessCopyWithImpl<$Res>
    extends _$WorkstationAssignmentStateCopyWithImpl<$Res>
    implements _$LoadSuccessCopyWith<$Res> {
  __$LoadSuccessCopyWithImpl(
      _LoadSuccess _value, $Res Function(_LoadSuccess) _then)
      : super(_value, (v) => _then(v as _LoadSuccess));

  @override
  _LoadSuccess get _value => super._value as _LoadSuccess;

  @override
  $Res call({
    Object workstationCode = freezed,
    Object assignedResources = freezed,
    Object assignableResources = freezed,
  }) {
    return _then(_LoadSuccess(
      workstationCode: workstationCode == freezed
          ? _value.workstationCode
          : workstationCode as int,
      assignedResources: assignedResources == freezed
          ? _value.assignedResources
          : assignedResources as List<UserWithWorkstation>,
      assignableResources: assignableResources == freezed
          ? _value.assignableResources
          : assignableResources as List<UserWithWorkstation>,
    ));
  }
}

/// @nodoc
class _$_LoadSuccess implements _LoadSuccess {
  const _$_LoadSuccess(
      {@required this.workstationCode,
      @required this.assignedResources,
      @required this.assignableResources})
      : assert(workstationCode != null),
        assert(assignedResources != null),
        assert(assignableResources != null);

  @override
  final int workstationCode;
  @override
  final List<UserWithWorkstation> assignedResources;
  @override
  final List<UserWithWorkstation> assignableResources;

  @override
  String toString() {
    return 'WorkstationAssignmentState.loadSuccess(workstationCode: $workstationCode, assignedResources: $assignedResources, assignableResources: $assignableResources)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _LoadSuccess &&
            (identical(other.workstationCode, workstationCode) ||
                const DeepCollectionEquality()
                    .equals(other.workstationCode, workstationCode)) &&
            (identical(other.assignedResources, assignedResources) ||
                const DeepCollectionEquality()
                    .equals(other.assignedResources, assignedResources)) &&
            (identical(other.assignableResources, assignableResources) ||
                const DeepCollectionEquality()
                    .equals(other.assignableResources, assignableResources)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(workstationCode) ^
      const DeepCollectionEquality().hash(assignedResources) ^
      const DeepCollectionEquality().hash(assignableResources);

  @JsonKey(ignore: true)
  @override
  _$LoadSuccessCopyWith<_LoadSuccess> get copyWith =>
      __$LoadSuccessCopyWithImpl<_LoadSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required
        TResult loadSuccess(
            int workstationCode,
            List<UserWithWorkstation> assignedResources,
            List<UserWithWorkstation> assignableResources),
  }) {
    assert(initial != null);
    assert(loadSuccess != null);
    return loadSuccess(workstationCode, assignedResources, assignableResources);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult loadSuccess(
        int workstationCode,
        List<UserWithWorkstation> assignedResources,
        List<UserWithWorkstation> assignableResources),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (loadSuccess != null) {
      return loadSuccess(
          workstationCode, assignedResources, assignableResources);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(_Initial value),
    @required TResult loadSuccess(_LoadSuccess value),
  }) {
    assert(initial != null);
    assert(loadSuccess != null);
    return loadSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    TResult loadSuccess(_LoadSuccess value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (loadSuccess != null) {
      return loadSuccess(this);
    }
    return orElse();
  }
}

abstract class _LoadSuccess implements WorkstationAssignmentState {
  const factory _LoadSuccess(
          {@required int workstationCode,
          @required List<UserWithWorkstation> assignedResources,
          @required List<UserWithWorkstation> assignableResources}) =
      _$_LoadSuccess;

  int get workstationCode;
  List<UserWithWorkstation> get assignedResources;
  List<UserWithWorkstation> get assignableResources;
  @JsonKey(ignore: true)
  _$LoadSuccessCopyWith<_LoadSuccess> get copyWith;
}
