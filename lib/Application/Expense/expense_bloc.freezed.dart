// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'expense_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ExpenseEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getExpense,
    required TResult Function() addExpense,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getExpense,
    TResult? Function()? addExpense,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getExpense,
    TResult Function()? addExpense,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetExpense value) getExpense,
    required TResult Function(AddExpense value) addExpense,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetExpense value)? getExpense,
    TResult? Function(AddExpense value)? addExpense,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetExpense value)? getExpense,
    TResult Function(AddExpense value)? addExpense,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExpenseEventCopyWith<$Res> {
  factory $ExpenseEventCopyWith(
          ExpenseEvent value, $Res Function(ExpenseEvent) then) =
      _$ExpenseEventCopyWithImpl<$Res, ExpenseEvent>;
}

/// @nodoc
class _$ExpenseEventCopyWithImpl<$Res, $Val extends ExpenseEvent>
    implements $ExpenseEventCopyWith<$Res> {
  _$ExpenseEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ExpenseEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$GetExpenseImplCopyWith<$Res> {
  factory _$$GetExpenseImplCopyWith(
          _$GetExpenseImpl value, $Res Function(_$GetExpenseImpl) then) =
      __$$GetExpenseImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetExpenseImplCopyWithImpl<$Res>
    extends _$ExpenseEventCopyWithImpl<$Res, _$GetExpenseImpl>
    implements _$$GetExpenseImplCopyWith<$Res> {
  __$$GetExpenseImplCopyWithImpl(
      _$GetExpenseImpl _value, $Res Function(_$GetExpenseImpl) _then)
      : super(_value, _then);

  /// Create a copy of ExpenseEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GetExpenseImpl implements GetExpense {
  const _$GetExpenseImpl();

  @override
  String toString() {
    return 'ExpenseEvent.getExpense()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetExpenseImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getExpense,
    required TResult Function() addExpense,
  }) {
    return getExpense();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getExpense,
    TResult? Function()? addExpense,
  }) {
    return getExpense?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getExpense,
    TResult Function()? addExpense,
    required TResult orElse(),
  }) {
    if (getExpense != null) {
      return getExpense();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetExpense value) getExpense,
    required TResult Function(AddExpense value) addExpense,
  }) {
    return getExpense(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetExpense value)? getExpense,
    TResult? Function(AddExpense value)? addExpense,
  }) {
    return getExpense?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetExpense value)? getExpense,
    TResult Function(AddExpense value)? addExpense,
    required TResult orElse(),
  }) {
    if (getExpense != null) {
      return getExpense(this);
    }
    return orElse();
  }
}

abstract class GetExpense implements ExpenseEvent {
  const factory GetExpense() = _$GetExpenseImpl;
}

/// @nodoc
abstract class _$$AddExpenseImplCopyWith<$Res> {
  factory _$$AddExpenseImplCopyWith(
          _$AddExpenseImpl value, $Res Function(_$AddExpenseImpl) then) =
      __$$AddExpenseImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AddExpenseImplCopyWithImpl<$Res>
    extends _$ExpenseEventCopyWithImpl<$Res, _$AddExpenseImpl>
    implements _$$AddExpenseImplCopyWith<$Res> {
  __$$AddExpenseImplCopyWithImpl(
      _$AddExpenseImpl _value, $Res Function(_$AddExpenseImpl) _then)
      : super(_value, _then);

  /// Create a copy of ExpenseEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$AddExpenseImpl implements AddExpense {
  const _$AddExpenseImpl();

  @override
  String toString() {
    return 'ExpenseEvent.addExpense()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AddExpenseImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getExpense,
    required TResult Function() addExpense,
  }) {
    return addExpense();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getExpense,
    TResult? Function()? addExpense,
  }) {
    return addExpense?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getExpense,
    TResult Function()? addExpense,
    required TResult orElse(),
  }) {
    if (addExpense != null) {
      return addExpense();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetExpense value) getExpense,
    required TResult Function(AddExpense value) addExpense,
  }) {
    return addExpense(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetExpense value)? getExpense,
    TResult? Function(AddExpense value)? addExpense,
  }) {
    return addExpense?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetExpense value)? getExpense,
    TResult Function(AddExpense value)? addExpense,
    required TResult orElse(),
  }) {
    if (addExpense != null) {
      return addExpense(this);
    }
    return orElse();
  }
}

abstract class AddExpense implements ExpenseEvent {
  const factory AddExpense() = _$AddExpenseImpl;
}

/// @nodoc
mixin _$ExpenseState {
  bool get isEmpty => throw _privateConstructorUsedError;
  List<ExpenseModel> get expense => throw _privateConstructorUsedError;
  Option<dynamic> get getFailureOrSuccessState =>
      throw _privateConstructorUsedError;

  /// Create a copy of ExpenseState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExpenseStateCopyWith<ExpenseState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExpenseStateCopyWith<$Res> {
  factory $ExpenseStateCopyWith(
          ExpenseState value, $Res Function(ExpenseState) then) =
      _$ExpenseStateCopyWithImpl<$Res, ExpenseState>;
  @useResult
  $Res call(
      {bool isEmpty,
      List<ExpenseModel> expense,
      Option<dynamic> getFailureOrSuccessState});
}

/// @nodoc
class _$ExpenseStateCopyWithImpl<$Res, $Val extends ExpenseState>
    implements $ExpenseStateCopyWith<$Res> {
  _$ExpenseStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ExpenseState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isEmpty = null,
    Object? expense = null,
    Object? getFailureOrSuccessState = null,
  }) {
    return _then(_value.copyWith(
      isEmpty: null == isEmpty
          ? _value.isEmpty
          : isEmpty // ignore: cast_nullable_to_non_nullable
              as bool,
      expense: null == expense
          ? _value.expense
          : expense // ignore: cast_nullable_to_non_nullable
              as List<ExpenseModel>,
      getFailureOrSuccessState: null == getFailureOrSuccessState
          ? _value.getFailureOrSuccessState
          : getFailureOrSuccessState // ignore: cast_nullable_to_non_nullable
              as Option<dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ExpenseStateImplCopyWith<$Res>
    implements $ExpenseStateCopyWith<$Res> {
  factory _$$ExpenseStateImplCopyWith(
          _$ExpenseStateImpl value, $Res Function(_$ExpenseStateImpl) then) =
      __$$ExpenseStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isEmpty,
      List<ExpenseModel> expense,
      Option<dynamic> getFailureOrSuccessState});
}

/// @nodoc
class __$$ExpenseStateImplCopyWithImpl<$Res>
    extends _$ExpenseStateCopyWithImpl<$Res, _$ExpenseStateImpl>
    implements _$$ExpenseStateImplCopyWith<$Res> {
  __$$ExpenseStateImplCopyWithImpl(
      _$ExpenseStateImpl _value, $Res Function(_$ExpenseStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ExpenseState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isEmpty = null,
    Object? expense = null,
    Object? getFailureOrSuccessState = null,
  }) {
    return _then(_$ExpenseStateImpl(
      isEmpty: null == isEmpty
          ? _value.isEmpty
          : isEmpty // ignore: cast_nullable_to_non_nullable
              as bool,
      expense: null == expense
          ? _value._expense
          : expense // ignore: cast_nullable_to_non_nullable
              as List<ExpenseModel>,
      getFailureOrSuccessState: null == getFailureOrSuccessState
          ? _value.getFailureOrSuccessState
          : getFailureOrSuccessState // ignore: cast_nullable_to_non_nullable
              as Option<dynamic>,
    ));
  }
}

/// @nodoc

class _$ExpenseStateImpl implements _ExpenseState {
  const _$ExpenseStateImpl(
      {required this.isEmpty,
      required final List<ExpenseModel> expense,
      required this.getFailureOrSuccessState})
      : _expense = expense;

  @override
  final bool isEmpty;
  final List<ExpenseModel> _expense;
  @override
  List<ExpenseModel> get expense {
    if (_expense is EqualUnmodifiableListView) return _expense;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_expense);
  }

  @override
  final Option<dynamic> getFailureOrSuccessState;

  @override
  String toString() {
    return 'ExpenseState(isEmpty: $isEmpty, expense: $expense, getFailureOrSuccessState: $getFailureOrSuccessState)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExpenseStateImpl &&
            (identical(other.isEmpty, isEmpty) || other.isEmpty == isEmpty) &&
            const DeepCollectionEquality().equals(other._expense, _expense) &&
            (identical(
                    other.getFailureOrSuccessState, getFailureOrSuccessState) ||
                other.getFailureOrSuccessState == getFailureOrSuccessState));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isEmpty,
      const DeepCollectionEquality().hash(_expense), getFailureOrSuccessState);

  /// Create a copy of ExpenseState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExpenseStateImplCopyWith<_$ExpenseStateImpl> get copyWith =>
      __$$ExpenseStateImplCopyWithImpl<_$ExpenseStateImpl>(this, _$identity);
}

abstract class _ExpenseState implements ExpenseState {
  const factory _ExpenseState(
          {required final bool isEmpty,
          required final List<ExpenseModel> expense,
          required final Option<dynamic> getFailureOrSuccessState}) =
      _$ExpenseStateImpl;

  @override
  bool get isEmpty;
  @override
  List<ExpenseModel> get expense;
  @override
  Option<dynamic> get getFailureOrSuccessState;

  /// Create a copy of ExpenseState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExpenseStateImplCopyWith<_$ExpenseStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
