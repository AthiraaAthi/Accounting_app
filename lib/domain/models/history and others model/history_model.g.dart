// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HistoryModelImpl _$$HistoryModelImplFromJson(Map<String, dynamic> json) =>
    _$HistoryModelImpl(
      id: json['id'] as String?,
      amount: json['amount'] as String?,
      date: json['date'] as String?,
      asPayment: json['asPayment'] as bool?,
      timestamp: json['timestamp'] as String?,
    );

Map<String, dynamic> _$$HistoryModelImplToJson(_$HistoryModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'amount': instance.amount,
      'date': instance.date,
      'asPayment': instance.asPayment,
      'timestamp': instance.timestamp,
    };
