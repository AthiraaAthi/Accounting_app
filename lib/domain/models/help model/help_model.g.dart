// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'help_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HelpModelImpl _$$HelpModelImplFromJson(Map<String, dynamic> json) =>
    _$HelpModelImpl(
      IsMoneyLent: json['IsMoneyLent'] as bool?,
      id: json['id'] as String?,
      name: json['name'] as String?,
      phone: json['phone'] as String?,
      problem: json['problem'] as String?,
    );

Map<String, dynamic> _$$HelpModelImplToJson(_$HelpModelImpl instance) =>
    <String, dynamic>{
      'IsMoneyLent': instance.IsMoneyLent,
      'id': instance.id,
      'name': instance.name,
      'phone': instance.phone,
      'problem': instance.problem,
    };
