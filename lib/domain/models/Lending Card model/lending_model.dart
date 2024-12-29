import 'package:cloud_firestore/cloud_firestore.dart';
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
    // ignore: invalid_annotation_target
    @JsonKey(fromJson: _timestampListFromJson, toJson: _timestampListToJson)
    List<Timestamp>? listOfTImestamp,
  }) = _LendingModel;

  factory LendingModel.fromJson(Map<String, dynamic> json) =>
      _$LendingModelFromJson(json);
}

List<Timestamp>? _timestampListFromJson(List<dynamic>? jsonList) {
  if (jsonList == null) return null;

  return jsonList.map((e) {
    if (e is Timestamp) return e; // Already a Timestamp
    if (e is String)
      return Timestamp.fromDate(
          DateTime.parse(e)); // Convert String to Timestamp
    throw Exception('Invalid data type for timestamp');
  }).toList();
}

List<dynamic>? _timestampListToJson(List<Timestamp>? list) {
  return list
      ?.map((timestamp) => timestamp.toDate().toIso8601String())
      .toList();
}
