import 'package:freezed_annotation/freezed_annotation.dart';
part 'detail_model.freezed.dart';
part 'detail_model.g.dart';

@freezed
class DetailModel with _$DetailModel {
  const factory DetailModel(
      {String? id,
      String? date,
      String? amount,
      String? balanceAmount,
      bool? isAddedMore}) = _DetailModel;

  factory DetailModel.fromJson(Map<String, dynamic> json) =>
      _$DetailModelFromJson(json);
}
