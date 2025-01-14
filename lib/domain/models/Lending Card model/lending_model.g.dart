// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lending_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LendingModelImpl _$$LendingModelImplFromJson(Map<String, dynamic> json) =>
    _$LendingModelImpl(
      IsMoneyLent: json['IsMoneyLent'] as bool?,
      id: json['id'] as String?,
      name: json['name'] as String?,
      phone: json['phone'] as String?,
      description: json['description'] as String?,
      amount: json['amount'] as String?,
      installmentAmount: json['installmentAmount'] as String?,
      installmentType: json['installmentType'] as String?,
      listOfTImestamp: _timestampListFromJson(json['listOfTImestamp'] as List?),
      shareCode: json['shareCode'] as String?,
      asJoiner: json['asJoiner'] as bool?,
      balanceAmount: json['balanceAmount'] as String?,
    );

Map<String, dynamic> _$$LendingModelImplToJson(_$LendingModelImpl instance) =>
    <String, dynamic>{
      'IsMoneyLent': instance.IsMoneyLent,
      'id': instance.id,
      'name': instance.name,
      'phone': instance.phone,
      'description': instance.description,
      'amount': instance.amount,
      'installmentAmount': instance.installmentAmount,
      'installmentType': instance.installmentType,
      'listOfTImestamp': _timestampListToJson(instance.listOfTImestamp),
      'shareCode': instance.shareCode,
      'asJoiner': instance.asJoiner,
      'balanceAmount': instance.balanceAmount,
    };
