// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lending_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LendingModelImpl _$$LendingModelImplFromJson(Map<String, dynamic> json) =>
    _$LendingModelImpl(
      id: json['id'] as String?,
      name: json['name'] as String?,
      phone: json['phone'] as String?,
      description: json['description'] as String?,
      amount: json['amount'] as String?,
    );

Map<String, dynamic> _$$LendingModelImplToJson(_$LendingModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phone': instance.phone,
      'description': instance.description,
      'amount': instance.amount,
    };
