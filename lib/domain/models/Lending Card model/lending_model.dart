import 'package:freezed_annotation/freezed_annotation.dart';

part 'lending_model.freezed.dart';
part 'lending_model.g.dart';

@freezed
class LendingModel with _$LendingModel {
  factory LendingModel({
    bool? IsMoneyLent,
    String? id,
    String? name,
    String? phone,
    String? description,
    String? amount,
    String? installmentAmount,
    String? installmentType,
    DateTime? dailyInstallment,
    String? weeklyInstalmentDate,
    DateTime? monthlyInstalmentDate,
  }) = _LendingModel;

  factory LendingModel.fromJson(Map<String, dynamic> json) =>
      _$LendingModelFromJson(json);
}
