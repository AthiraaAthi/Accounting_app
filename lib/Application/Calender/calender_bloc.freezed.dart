// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'calender_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CalenderEvent {
  DateTime get datetime => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime datetime) getDate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DateTime datetime)? getDate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime datetime)? getDate,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetDate value) getDate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetDate value)? getDate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetDate value)? getDate,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of CalenderEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CalenderEventCopyWith<CalenderEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CalenderEventCopyWith<$Res> {
  factory $CalenderEventCopyWith(
          CalenderEvent value, $Res Function(CalenderEvent) then) =
      _$CalenderEventCopyWithImpl<$Res, CalenderEvent>;
  @useResult
  $Res call({DateTime datetime});
}

/// @nodoc
class _$CalenderEventCopyWithImpl<$Res, $Val extends CalenderEvent>
    implements $CalenderEventCopyWith<$Res> {
  _$CalenderEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CalenderEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? datetime = null,
  }) {
    return _then(_value.copyWith(
      datetime: null == datetime
          ? _value.datetime
          : datetime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetDateImplCopyWith<$Res>
    implements $CalenderEventCopyWith<$Res> {
  factory _$$GetDateImplCopyWith(
          _$GetDateImpl value, $Res Function(_$GetDateImpl) then) =
      __$$GetDateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime datetime});
}

/// @nodoc
class __$$GetDateImplCopyWithImpl<$Res>
    extends _$CalenderEventCopyWithImpl<$Res, _$GetDateImpl>
    implements _$$GetDateImplCopyWith<$Res> {
  __$$GetDateImplCopyWithImpl(
      _$GetDateImpl _value, $Res Function(_$GetDateImpl) _then)
      : super(_value, _then);

  /// Create a copy of CalenderEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? datetime = null,
  }) {
    return _then(_$GetDateImpl(
      datetime: null == datetime
          ? _value.datetime
          : datetime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$GetDateImpl implements GetDate {
  const _$GetDateImpl({required this.datetime});

  @override
  final DateTime datetime;

  @override
  String toString() {
    return 'CalenderEvent.getDate(datetime: $datetime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetDateImpl &&
            (identical(other.datetime, datetime) ||
                other.datetime == datetime));
  }

  @override
  int get hashCode => Object.hash(runtimeType, datetime);

  /// Create a copy of CalenderEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetDateImplCopyWith<_$GetDateImpl> get copyWith =>
      __$$GetDateImplCopyWithImpl<_$GetDateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime datetime) getDate,
  }) {
    return getDate(datetime);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DateTime datetime)? getDate,
  }) {
    return getDate?.call(datetime);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime datetime)? getDate,
    required TResult orElse(),
  }) {
    if (getDate != null) {
      return getDate(datetime);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetDate value) getDate,
  }) {
    return getDate(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetDate value)? getDate,
  }) {
    return getDate?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetDate value)? getDate,
    required TResult orElse(),
  }) {
    if (getDate != null) {
      return getDate(this);
    }
    return orElse();
  }
}

abstract class GetDate implements CalenderEvent {
  const factory GetDate({required final DateTime datetime}) = _$GetDateImpl;

  @override
  DateTime get datetime;

  /// Create a copy of CalenderEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetDateImplCopyWith<_$GetDateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CalenderState {
  DateTime? get dateTime => throw _privateConstructorUsedError;

  /// Create a copy of CalenderState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CalenderStateCopyWith<CalenderState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CalenderStateCopyWith<$Res> {
  factory $CalenderStateCopyWith(
          CalenderState value, $Res Function(CalenderState) then) =
      _$CalenderStateCopyWithImpl<$Res, CalenderState>;
  @useResult
  $Res call({DateTime? dateTime});
}

/// @nodoc
class _$CalenderStateCopyWithImpl<$Res, $Val extends CalenderState>
    implements $CalenderStateCopyWith<$Res> {
  _$CalenderStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CalenderState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dateTime = freezed,
  }) {
    return _then(_value.copyWith(
      dateTime: freezed == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CalenderStateImplCopyWith<$Res>
    implements $CalenderStateCopyWith<$Res> {
  factory _$$CalenderStateImplCopyWith(
          _$CalenderStateImpl value, $Res Function(_$CalenderStateImpl) then) =
      __$$CalenderStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime? dateTime});
}

/// @nodoc
class __$$CalenderStateImplCopyWithImpl<$Res>
    extends _$CalenderStateCopyWithImpl<$Res, _$CalenderStateImpl>
    implements _$$CalenderStateImplCopyWith<$Res> {
  __$$CalenderStateImplCopyWithImpl(
      _$CalenderStateImpl _value, $Res Function(_$CalenderStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of CalenderState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dateTime = freezed,
  }) {
    return _then(_$CalenderStateImpl(
      dateTime: freezed == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$CalenderStateImpl implements _CalenderState {
  const _$CalenderStateImpl({required this.dateTime});

  @override
  final DateTime? dateTime;

  @override
  String toString() {
    return 'CalenderState(dateTime: $dateTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CalenderStateImpl &&
            (identical(other.dateTime, dateTime) ||
                other.dateTime == dateTime));
  }

  @override
  int get hashCode => Object.hash(runtimeType, dateTime);

  /// Create a copy of CalenderState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CalenderStateImplCopyWith<_$CalenderStateImpl> get copyWith =>
      __$$CalenderStateImplCopyWithImpl<_$CalenderStateImpl>(this, _$identity);
}

abstract class _CalenderState implements CalenderState {
  const factory _CalenderState({required final DateTime? dateTime}) =
      _$CalenderStateImpl;

  @override
  DateTime? get dateTime;

  /// Create a copy of CalenderState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CalenderStateImplCopyWith<_$CalenderStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
