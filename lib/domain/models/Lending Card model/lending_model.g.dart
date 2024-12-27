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
      dailyInstallment: json['dailyInstallment'] == null
          ? null
          : DateTime.parse(json['dailyInstallment'] as String),
      weeklyInstalmentDate: json['weeklyInstalmentDate'] as String?,
      monthlyInstalmentDate: json['monthlyInstalmentDate'] == null
          ? null
          : DateTime.parse(json['monthlyInstalmentDate'] as String),
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
      'dailyInstallment': instance.dailyInstallment?.toIso8601String(),
      'weeklyInstalmentDate': instance.weeklyInstalmentDate,
      'monthlyInstalmentDate':
          instance.monthlyInstalmentDate?.toIso8601String(),
    };
