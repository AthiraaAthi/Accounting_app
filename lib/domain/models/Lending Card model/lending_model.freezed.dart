// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lending_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LendingModel _$LendingModelFromJson(Map<String, dynamic> json) {
  return _LendingModel.fromJson(json);
}

/// @nodoc
mixin _$LendingModel {
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get amount => throw _privateConstructorUsedError;

  /// Serializes this LendingModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LendingModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LendingModelCopyWith<LendingModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LendingModelCopyWith<$Res> {
  factory $LendingModelCopyWith(
          LendingModel value, $Res Function(LendingModel) then) =
      _$LendingModelCopyWithImpl<$Res, LendingModel>;
  @useResult
  $Res call(
      {String? id,
      String? name,
      String? phone,
      String? description,
      String? amount});
}

/// @nodoc
class _$LendingModelCopyWithImpl<$Res, $Val extends LendingModel>
    implements $LendingModelCopyWith<$Res> {
  _$LendingModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LendingModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? phone = freezed,
    Object? description = freezed,
    Object? amount = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LendingModelImplCopyWith<$Res>
    implements $LendingModelCopyWith<$Res> {
  factory _$$LendingModelImplCopyWith(
          _$LendingModelImpl value, $Res Function(_$LendingModelImpl) then) =
      __$$LendingModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? name,
      String? phone,
      String? description,
      String? amount});
}

/// @nodoc
class __$$LendingModelImplCopyWithImpl<$Res>
    extends _$LendingModelCopyWithImpl<$Res, _$LendingModelImpl>
    implements _$$LendingModelImplCopyWith<$Res> {
  __$$LendingModelImplCopyWithImpl(
      _$LendingModelImpl _value, $Res Function(_$LendingModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of LendingModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? phone = freezed,
    Object? description = freezed,
    Object? amount = freezed,
  }) {
    return _then(_$LendingModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LendingModelImpl implements _LendingModel {
  _$LendingModelImpl(
      {this.id, this.name, this.phone, this.description, this.amount});

  factory _$LendingModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$LendingModelImplFromJson(json);

  @override
  final String? id;
  @override
  final String? name;
  @override
  final String? phone;
  @override
  final String? description;
  @override
  final String? amount;

  @override
  String toString() {
    return 'LendingModel(id: $id, name: $name, phone: $phone, description: $description, amount: $amount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LendingModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.amount, amount) || other.amount == amount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, phone, description, amount);

  /// Create a copy of LendingModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LendingModelImplCopyWith<_$LendingModelImpl> get copyWith =>
      __$$LendingModelImplCopyWithImpl<_$LendingModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LendingModelImplToJson(
      this,
    );
  }
}

abstract class _LendingModel implements LendingModel {
  factory _LendingModel(
      {final String? id,
      final String? name,
      final String? phone,
      final String? description,
      final String? amount}) = _$LendingModelImpl;

  factory _LendingModel.fromJson(Map<String, dynamic> json) =
      _$LendingModelImpl.fromJson;

  @override
  String? get id;
  @override
  String? get name;
  @override
  String? get phone;
  @override
  String? get description;
  @override
  String? get amount;

  /// Create a copy of LendingModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LendingModelImplCopyWith<_$LendingModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
