// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'help_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

HelpModel _$HelpModelFromJson(Map<String, dynamic> json) {
  return _HelpModel.fromJson(json);
}

/// @nodoc
mixin _$HelpModel {
  bool? get IsMoneyLent => throw _privateConstructorUsedError;
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String? get problem => throw _privateConstructorUsedError;

  /// Serializes this HelpModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HelpModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HelpModelCopyWith<HelpModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HelpModelCopyWith<$Res> {
  factory $HelpModelCopyWith(HelpModel value, $Res Function(HelpModel) then) =
      _$HelpModelCopyWithImpl<$Res, HelpModel>;
  @useResult
  $Res call(
      {bool? IsMoneyLent,
      String? id,
      String? name,
      String? phone,
      String? problem});
}

/// @nodoc
class _$HelpModelCopyWithImpl<$Res, $Val extends HelpModel>
    implements $HelpModelCopyWith<$Res> {
  _$HelpModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HelpModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? IsMoneyLent = freezed,
    Object? id = freezed,
    Object? name = freezed,
    Object? phone = freezed,
    Object? problem = freezed,
  }) {
    return _then(_value.copyWith(
      IsMoneyLent: freezed == IsMoneyLent
          ? _value.IsMoneyLent
          : IsMoneyLent // ignore: cast_nullable_to_non_nullable
              as bool?,
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
      problem: freezed == problem
          ? _value.problem
          : problem // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HelpModelImplCopyWith<$Res>
    implements $HelpModelCopyWith<$Res> {
  factory _$$HelpModelImplCopyWith(
          _$HelpModelImpl value, $Res Function(_$HelpModelImpl) then) =
      __$$HelpModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool? IsMoneyLent,
      String? id,
      String? name,
      String? phone,
      String? problem});
}

/// @nodoc
class __$$HelpModelImplCopyWithImpl<$Res>
    extends _$HelpModelCopyWithImpl<$Res, _$HelpModelImpl>
    implements _$$HelpModelImplCopyWith<$Res> {
  __$$HelpModelImplCopyWithImpl(
      _$HelpModelImpl _value, $Res Function(_$HelpModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of HelpModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? IsMoneyLent = freezed,
    Object? id = freezed,
    Object? name = freezed,
    Object? phone = freezed,
    Object? problem = freezed,
  }) {
    return _then(_$HelpModelImpl(
      IsMoneyLent: freezed == IsMoneyLent
          ? _value.IsMoneyLent
          : IsMoneyLent // ignore: cast_nullable_to_non_nullable
              as bool?,
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
      problem: freezed == problem
          ? _value.problem
          : problem // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HelpModelImpl implements _HelpModel {
  _$HelpModelImpl(
      {this.IsMoneyLent, this.id, this.name, this.phone, this.problem});

  factory _$HelpModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$HelpModelImplFromJson(json);

  @override
  final bool? IsMoneyLent;
  @override
  final String? id;
  @override
  final String? name;
  @override
  final String? phone;
  @override
  final String? problem;

  @override
  String toString() {
    return 'HelpModel(IsMoneyLent: $IsMoneyLent, id: $id, name: $name, phone: $phone, problem: $problem)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HelpModelImpl &&
            (identical(other.IsMoneyLent, IsMoneyLent) ||
                other.IsMoneyLent == IsMoneyLent) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.problem, problem) || other.problem == problem));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, IsMoneyLent, id, name, phone, problem);

  /// Create a copy of HelpModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HelpModelImplCopyWith<_$HelpModelImpl> get copyWith =>
      __$$HelpModelImplCopyWithImpl<_$HelpModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HelpModelImplToJson(
      this,
    );
  }
}

abstract class _HelpModel implements HelpModel {
  factory _HelpModel(
      {final bool? IsMoneyLent,
      final String? id,
      final String? name,
      final String? phone,
      final String? problem}) = _$HelpModelImpl;

  factory _HelpModel.fromJson(Map<String, dynamic> json) =
      _$HelpModelImpl.fromJson;

  @override
  bool? get IsMoneyLent;
  @override
  String? get id;
  @override
  String? get name;
  @override
  String? get phone;
  @override
  String? get problem;

  /// Create a copy of HelpModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HelpModelImplCopyWith<_$HelpModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
