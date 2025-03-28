// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'join_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$JoinEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JoinEventCopyWith<$Res> {
  factory $JoinEventCopyWith(JoinEvent value, $Res Function(JoinEvent) then) =
      _$JoinEventCopyWithImpl<$Res, JoinEvent>;
}

/// @nodoc
class _$JoinEventCopyWithImpl<$Res, $Val extends JoinEvent>
    implements $JoinEventCopyWith<$Res> {
  _$JoinEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of JoinEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$StartedImplCopyWith<$Res> {
  factory _$$StartedImplCopyWith(
          _$StartedImpl value, $Res Function(_$StartedImpl) then) =
      __$$StartedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StartedImplCopyWithImpl<$Res>
    extends _$JoinEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);

  /// Create a copy of JoinEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'JoinEvent.started()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StartedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements JoinEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
mixin _$JoinState {
  List<LendingModel> get joinData => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isError => throw _privateConstructorUsedError;
  Option<dynamic> get getFailureOrSuccess => throw _privateConstructorUsedError;

  /// Create a copy of JoinState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $JoinStateCopyWith<JoinState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JoinStateCopyWith<$Res> {
  factory $JoinStateCopyWith(JoinState value, $Res Function(JoinState) then) =
      _$JoinStateCopyWithImpl<$Res, JoinState>;
  @useResult
  $Res call(
      {List<LendingModel> joinData,
      bool isLoading,
      bool isError,
      Option<dynamic> getFailureOrSuccess});
}

/// @nodoc
class _$JoinStateCopyWithImpl<$Res, $Val extends JoinState>
    implements $JoinStateCopyWith<$Res> {
  _$JoinStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of JoinState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? joinData = null,
    Object? isLoading = null,
    Object? isError = null,
    Object? getFailureOrSuccess = null,
  }) {
    return _then(_value.copyWith(
      joinData: null == joinData
          ? _value.joinData
          : joinData // ignore: cast_nullable_to_non_nullable
              as List<LendingModel>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isError: null == isError
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
      getFailureOrSuccess: null == getFailureOrSuccess
          ? _value.getFailureOrSuccess
          : getFailureOrSuccess // ignore: cast_nullable_to_non_nullable
              as Option<dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$JoinStateImplCopyWith<$Res>
    implements $JoinStateCopyWith<$Res> {
  factory _$$JoinStateImplCopyWith(
          _$JoinStateImpl value, $Res Function(_$JoinStateImpl) then) =
      __$$JoinStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<LendingModel> joinData,
      bool isLoading,
      bool isError,
      Option<dynamic> getFailureOrSuccess});
}

/// @nodoc
class __$$JoinStateImplCopyWithImpl<$Res>
    extends _$JoinStateCopyWithImpl<$Res, _$JoinStateImpl>
    implements _$$JoinStateImplCopyWith<$Res> {
  __$$JoinStateImplCopyWithImpl(
      _$JoinStateImpl _value, $Res Function(_$JoinStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of JoinState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? joinData = null,
    Object? isLoading = null,
    Object? isError = null,
    Object? getFailureOrSuccess = null,
  }) {
    return _then(_$JoinStateImpl(
      joinData: null == joinData
          ? _value._joinData
          : joinData // ignore: cast_nullable_to_non_nullable
              as List<LendingModel>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isError: null == isError
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
      getFailureOrSuccess: null == getFailureOrSuccess
          ? _value.getFailureOrSuccess
          : getFailureOrSuccess // ignore: cast_nullable_to_non_nullable
              as Option<dynamic>,
    ));
  }
}

/// @nodoc

class _$JoinStateImpl implements _JoinState {
  const _$JoinStateImpl(
      {required final List<LendingModel> joinData,
      required this.isLoading,
      required this.isError,
      required this.getFailureOrSuccess})
      : _joinData = joinData;

  final List<LendingModel> _joinData;
  @override
  List<LendingModel> get joinData {
    if (_joinData is EqualUnmodifiableListView) return _joinData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_joinData);
  }

  @override
  final bool isLoading;
  @override
  final bool isError;
  @override
  final Option<dynamic> getFailureOrSuccess;

  @override
  String toString() {
    return 'JoinState(joinData: $joinData, isLoading: $isLoading, isError: $isError, getFailureOrSuccess: $getFailureOrSuccess)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JoinStateImpl &&
            const DeepCollectionEquality().equals(other._joinData, _joinData) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isError, isError) || other.isError == isError) &&
            (identical(other.getFailureOrSuccess, getFailureOrSuccess) ||
                other.getFailureOrSuccess == getFailureOrSuccess));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_joinData),
      isLoading,
      isError,
      getFailureOrSuccess);

  /// Create a copy of JoinState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$JoinStateImplCopyWith<_$JoinStateImpl> get copyWith =>
      __$$JoinStateImplCopyWithImpl<_$JoinStateImpl>(this, _$identity);
}

abstract class _JoinState implements JoinState {
  const factory _JoinState(
      {required final List<LendingModel> joinData,
      required final bool isLoading,
      required final bool isError,
      required final Option<dynamic> getFailureOrSuccess}) = _$JoinStateImpl;

  @override
  List<LendingModel> get joinData;
  @override
  bool get isLoading;
  @override
  bool get isError;
  @override
  Option<dynamic> get getFailureOrSuccess;

  /// Create a copy of JoinState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$JoinStateImplCopyWith<_$JoinStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
