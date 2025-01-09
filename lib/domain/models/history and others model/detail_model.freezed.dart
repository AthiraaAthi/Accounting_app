// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'detail_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DetailModel _$DetailModelFromJson(Map<String, dynamic> json) {
  return _DetailModel.fromJson(json);
}

/// @nodoc
mixin _$DetailModel {
  String? get id => throw _privateConstructorUsedError;
  String? get date => throw _privateConstructorUsedError;
  String? get amount => throw _privateConstructorUsedError;
  String? get balanceAmount => throw _privateConstructorUsedError;
  bool? get isAddedMore => throw _privateConstructorUsedError;

  /// Serializes this DetailModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DetailModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DetailModelCopyWith<DetailModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailModelCopyWith<$Res> {
  factory $DetailModelCopyWith(
          DetailModel value, $Res Function(DetailModel) then) =
      _$DetailModelCopyWithImpl<$Res, DetailModel>;
  @useResult
  $Res call(
      {String? id,
      String? date,
      String? amount,
      String? balanceAmount,
      bool? isAddedMore});
}

/// @nodoc
class _$DetailModelCopyWithImpl<$Res, $Val extends DetailModel>
    implements $DetailModelCopyWith<$Res> {
  _$DetailModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DetailModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? date = freezed,
    Object? amount = freezed,
    Object? balanceAmount = freezed,
    Object? isAddedMore = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String?,
      balanceAmount: freezed == balanceAmount
          ? _value.balanceAmount
          : balanceAmount // ignore: cast_nullable_to_non_nullable
              as String?,
      isAddedMore: freezed == isAddedMore
          ? _value.isAddedMore
          : isAddedMore // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DetailModelImplCopyWith<$Res>
    implements $DetailModelCopyWith<$Res> {
  factory _$$DetailModelImplCopyWith(
          _$DetailModelImpl value, $Res Function(_$DetailModelImpl) then) =
      __$$DetailModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? date,
      String? amount,
      String? balanceAmount,
      bool? isAddedMore});
}

/// @nodoc
class __$$DetailModelImplCopyWithImpl<$Res>
    extends _$DetailModelCopyWithImpl<$Res, _$DetailModelImpl>
    implements _$$DetailModelImplCopyWith<$Res> {
  __$$DetailModelImplCopyWithImpl(
      _$DetailModelImpl _value, $Res Function(_$DetailModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of DetailModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? date = freezed,
    Object? amount = freezed,
    Object? balanceAmount = freezed,
    Object? isAddedMore = freezed,
  }) {
    return _then(_$DetailModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String?,
      balanceAmount: freezed == balanceAmount
          ? _value.balanceAmount
          : balanceAmount // ignore: cast_nullable_to_non_nullable
              as String?,
      isAddedMore: freezed == isAddedMore
          ? _value.isAddedMore
          : isAddedMore // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DetailModelImpl implements _DetailModel {
  const _$DetailModelImpl(
      {this.id, this.date, this.amount, this.balanceAmount, this.isAddedMore});

  factory _$DetailModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DetailModelImplFromJson(json);

  @override
  final String? id;
  @override
  final String? date;
  @override
  final String? amount;
  @override
  final String? balanceAmount;
  @override
  final bool? isAddedMore;

  @override
  String toString() {
    return 'DetailModel(id: $id, date: $date, amount: $amount, balanceAmount: $balanceAmount, isAddedMore: $isAddedMore)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetailModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.balanceAmount, balanceAmount) ||
                other.balanceAmount == balanceAmount) &&
            (identical(other.isAddedMore, isAddedMore) ||
                other.isAddedMore == isAddedMore));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, date, amount, balanceAmount, isAddedMore);

  /// Create a copy of DetailModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DetailModelImplCopyWith<_$DetailModelImpl> get copyWith =>
      __$$DetailModelImplCopyWithImpl<_$DetailModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DetailModelImplToJson(
      this,
    );
  }
}

abstract class _DetailModel implements DetailModel {
  const factory _DetailModel(
      {final String? id,
      final String? date,
      final String? amount,
      final String? balanceAmount,
      final bool? isAddedMore}) = _$DetailModelImpl;

  factory _DetailModel.fromJson(Map<String, dynamic> json) =
      _$DetailModelImpl.fromJson;

  @override
  String? get id;
  @override
  String? get date;
  @override
  String? get amount;
  @override
  String? get balanceAmount;
  @override
  bool? get isAddedMore;

  /// Create a copy of DetailModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DetailModelImplCopyWith<_$DetailModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
