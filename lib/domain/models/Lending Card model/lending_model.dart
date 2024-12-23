import 'package:freezed_annotation/freezed_annotation.dart';

part 'lending_model.freezed.dart';
part 'lending_model.g.dart';

@freezed
class LendingModel with _$LendingModel {
  factory LendingModel({
    String? id,
    String? name,
    String? phone,
    String? description,
    String? amount,
  }) = _LendingModel;

  factory LendingModel.fromJson(Map<String, dynamic> json) =>
      _$LendingModelFromJson(json);
}
