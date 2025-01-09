// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DetailModelImpl _$$DetailModelImplFromJson(Map<String, dynamic> json) =>
    _$DetailModelImpl(
      id: json['id'] as String?,
      date: json['date'] as String?,
      amount: json['amount'] as String?,
      balanceAmount: json['balanceAmount'] as String?,
      isAddedMore: json['isAddedMore'] as bool?,
    );

Map<String, dynamic> _$$DetailModelImplToJson(_$DetailModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date,
      'amount': instance.amount,
      'balanceAmount': instance.balanceAmount,
      'isAddedMore': instance.isAddedMore,
    };
