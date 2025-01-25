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
  bool? get IsMoneyLent => throw _privateConstructorUsedError;
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get amount => throw _privateConstructorUsedError;
  String? get installmentAmount => throw _privateConstructorUsedError;
  String? get installmentType =>
      throw _privateConstructorUsedError; // ignore: invalid_annotation_target
  @JsonKey(fromJson: _timestampListFromJson, toJson: _timestampListToJson)
  List<Timestamp>? get listOfTImestamp => throw _privateConstructorUsedError;
  String? get shareCode => throw _privateConstructorUsedError;
  bool? get asJoiner => throw _privateConstructorUsedError;
  String? get balanceAmount =>
      throw _privateConstructorUsedError; // ignore: invalid_annotation_target
  @JsonKey(fromJson: timestampFromJson, toJson: timestampToJson)
  Timestamp? get datetime => throw _privateConstructorUsedError;
  String? get lastMoneyGivenDate => throw _privateConstructorUsedError;

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
      {bool? IsMoneyLent,
      String? id,
      String? name,
      String? phone,
      String? description,
      String? amount,
      String? installmentAmount,
      String? installmentType,
      @JsonKey(fromJson: _timestampListFromJson, toJson: _timestampListToJson)
      List<Timestamp>? listOfTImestamp,
      String? shareCode,
      bool? asJoiner,
      String? balanceAmount,
      @JsonKey(fromJson: timestampFromJson, toJson: timestampToJson)
      Timestamp? datetime,
      String? lastMoneyGivenDate});
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
    Object? IsMoneyLent = freezed,
    Object? id = freezed,
    Object? name = freezed,
    Object? phone = freezed,
    Object? description = freezed,
    Object? amount = freezed,
    Object? installmentAmount = freezed,
    Object? installmentType = freezed,
    Object? listOfTImestamp = freezed,
    Object? shareCode = freezed,
    Object? asJoiner = freezed,
    Object? balanceAmount = freezed,
    Object? datetime = freezed,
    Object? lastMoneyGivenDate = freezed,
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
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String?,
      installmentAmount: freezed == installmentAmount
          ? _value.installmentAmount
          : installmentAmount // ignore: cast_nullable_to_non_nullable
              as String?,
      installmentType: freezed == installmentType
          ? _value.installmentType
          : installmentType // ignore: cast_nullable_to_non_nullable
              as String?,
      listOfTImestamp: freezed == listOfTImestamp
          ? _value.listOfTImestamp
          : listOfTImestamp // ignore: cast_nullable_to_non_nullable
              as List<Timestamp>?,
      shareCode: freezed == shareCode
          ? _value.shareCode
          : shareCode // ignore: cast_nullable_to_non_nullable
              as String?,
      asJoiner: freezed == asJoiner
          ? _value.asJoiner
          : asJoiner // ignore: cast_nullable_to_non_nullable
              as bool?,
      balanceAmount: freezed == balanceAmount
          ? _value.balanceAmount
          : balanceAmount // ignore: cast_nullable_to_non_nullable
              as String?,
      datetime: freezed == datetime
          ? _value.datetime
          : datetime // ignore: cast_nullable_to_non_nullable
              as Timestamp?,
      lastMoneyGivenDate: freezed == lastMoneyGivenDate
          ? _value.lastMoneyGivenDate
          : lastMoneyGivenDate // ignore: cast_nullable_to_non_nullable
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
      {bool? IsMoneyLent,
      String? id,
      String? name,
      String? phone,
      String? description,
      String? amount,
      String? installmentAmount,
      String? installmentType,
      @JsonKey(fromJson: _timestampListFromJson, toJson: _timestampListToJson)
      List<Timestamp>? listOfTImestamp,
      String? shareCode,
      bool? asJoiner,
      String? balanceAmount,
      @JsonKey(fromJson: timestampFromJson, toJson: timestampToJson)
      Timestamp? datetime,
      String? lastMoneyGivenDate});
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
    Object? IsMoneyLent = freezed,
    Object? id = freezed,
    Object? name = freezed,
    Object? phone = freezed,
    Object? description = freezed,
    Object? amount = freezed,
    Object? installmentAmount = freezed,
    Object? installmentType = freezed,
    Object? listOfTImestamp = freezed,
    Object? shareCode = freezed,
    Object? asJoiner = freezed,
    Object? balanceAmount = freezed,
    Object? datetime = freezed,
    Object? lastMoneyGivenDate = freezed,
  }) {
    return _then(_$LendingModelImpl(
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
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String?,
      installmentAmount: freezed == installmentAmount
          ? _value.installmentAmount
          : installmentAmount // ignore: cast_nullable_to_non_nullable
              as String?,
      installmentType: freezed == installmentType
          ? _value.installmentType
          : installmentType // ignore: cast_nullable_to_non_nullable
              as String?,
      listOfTImestamp: freezed == listOfTImestamp
          ? _value._listOfTImestamp
          : listOfTImestamp // ignore: cast_nullable_to_non_nullable
              as List<Timestamp>?,
      shareCode: freezed == shareCode
          ? _value.shareCode
          : shareCode // ignore: cast_nullable_to_non_nullable
              as String?,
      asJoiner: freezed == asJoiner
          ? _value.asJoiner
          : asJoiner // ignore: cast_nullable_to_non_nullable
              as bool?,
      balanceAmount: freezed == balanceAmount
          ? _value.balanceAmount
          : balanceAmount // ignore: cast_nullable_to_non_nullable
              as String?,
      datetime: freezed == datetime
          ? _value.datetime
          : datetime // ignore: cast_nullable_to_non_nullable
              as Timestamp?,
      lastMoneyGivenDate: freezed == lastMoneyGivenDate
          ? _value.lastMoneyGivenDate
          : lastMoneyGivenDate // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LendingModelImpl implements _LendingModel {
  _$LendingModelImpl(
      {this.IsMoneyLent,
      this.id,
      this.name,
      this.phone,
      this.description,
      this.amount,
      this.installmentAmount,
      this.installmentType,
      @JsonKey(fromJson: _timestampListFromJson, toJson: _timestampListToJson)
      final List<Timestamp>? listOfTImestamp,
      this.shareCode,
      this.asJoiner,
      this.balanceAmount,
      @JsonKey(fromJson: timestampFromJson, toJson: timestampToJson)
      this.datetime,
      this.lastMoneyGivenDate})
      : _listOfTImestamp = listOfTImestamp;

  factory _$LendingModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$LendingModelImplFromJson(json);

  @override
  final bool? IsMoneyLent;
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
  final String? installmentAmount;
  @override
  final String? installmentType;
// ignore: invalid_annotation_target
  final List<Timestamp>? _listOfTImestamp;
// ignore: invalid_annotation_target
  @override
  @JsonKey(fromJson: _timestampListFromJson, toJson: _timestampListToJson)
  List<Timestamp>? get listOfTImestamp {
    final value = _listOfTImestamp;
    if (value == null) return null;
    if (_listOfTImestamp is EqualUnmodifiableListView) return _listOfTImestamp;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? shareCode;
  @override
  final bool? asJoiner;
  @override
  final String? balanceAmount;
// ignore: invalid_annotation_target
  @override
  @JsonKey(fromJson: timestampFromJson, toJson: timestampToJson)
  final Timestamp? datetime;
  @override
  final String? lastMoneyGivenDate;

  @override
  String toString() {
    return 'LendingModel(IsMoneyLent: $IsMoneyLent, id: $id, name: $name, phone: $phone, description: $description, amount: $amount, installmentAmount: $installmentAmount, installmentType: $installmentType, listOfTImestamp: $listOfTImestamp, shareCode: $shareCode, asJoiner: $asJoiner, balanceAmount: $balanceAmount, datetime: $datetime, lastMoneyGivenDate: $lastMoneyGivenDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LendingModelImpl &&
            (identical(other.IsMoneyLent, IsMoneyLent) ||
                other.IsMoneyLent == IsMoneyLent) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.installmentAmount, installmentAmount) ||
                other.installmentAmount == installmentAmount) &&
            (identical(other.installmentType, installmentType) ||
                other.installmentType == installmentType) &&
            const DeepCollectionEquality()
                .equals(other._listOfTImestamp, _listOfTImestamp) &&
            (identical(other.shareCode, shareCode) ||
                other.shareCode == shareCode) &&
            (identical(other.asJoiner, asJoiner) ||
                other.asJoiner == asJoiner) &&
            (identical(other.balanceAmount, balanceAmount) ||
                other.balanceAmount == balanceAmount) &&
            (identical(other.datetime, datetime) ||
                other.datetime == datetime) &&
            (identical(other.lastMoneyGivenDate, lastMoneyGivenDate) ||
                other.lastMoneyGivenDate == lastMoneyGivenDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      IsMoneyLent,
      id,
      name,
      phone,
      description,
      amount,
      installmentAmount,
      installmentType,
      const DeepCollectionEquality().hash(_listOfTImestamp),
      shareCode,
      asJoiner,
      balanceAmount,
      datetime,
      lastMoneyGivenDate);

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
      {final bool? IsMoneyLent,
      final String? id,
      final String? name,
      final String? phone,
      final String? description,
      final String? amount,
      final String? installmentAmount,
      final String? installmentType,
      @JsonKey(fromJson: _timestampListFromJson, toJson: _timestampListToJson)
      final List<Timestamp>? listOfTImestamp,
      final String? shareCode,
      final bool? asJoiner,
      final String? balanceAmount,
      @JsonKey(fromJson: timestampFromJson, toJson: timestampToJson)
      final Timestamp? datetime,
      final String? lastMoneyGivenDate}) = _$LendingModelImpl;

  factory _LendingModel.fromJson(Map<String, dynamic> json) =
      _$LendingModelImpl.fromJson;

  @override
  bool? get IsMoneyLent;
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
  @override
  String? get installmentAmount;
  @override
  String? get installmentType; // ignore: invalid_annotation_target
  @override
  @JsonKey(fromJson: _timestampListFromJson, toJson: _timestampListToJson)
  List<Timestamp>? get listOfTImestamp;
  @override
  String? get shareCode;
  @override
  bool? get asJoiner;
  @override
  String? get balanceAmount; // ignore: invalid_annotation_target
  @override
  @JsonKey(fromJson: timestampFromJson, toJson: timestampToJson)
  Timestamp? get datetime;
  @override
  String? get lastMoneyGivenDate;

  /// Create a copy of LendingModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LendingModelImplCopyWith<_$LendingModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
