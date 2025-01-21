import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'history_model.freezed.dart';
part 'history_model.g.dart';

@freezed
class HistoryModel with _$HistoryModel {
  const factory HistoryModel({
    String? id,
    String? amount,
    // ignore: invalid_annotation_target
    @JsonKey(fromJson: timestampFromJson, toJson: timestampToJson)
    Timestamp? date,
    bool? asPayment,
    String? timestamp,
  }) = _HistoryModel;

  factory HistoryModel.fromJson(Map<String, dynamic> json) =>
      _$HistoryModelFromJson(json);
}

Timestamp? timestampFromJson(dynamic json) {
  if (json == null) {
    return null;
  }
  return json is Timestamp ? json : Timestamp.fromMillisecondsSinceEpoch(json);
}

// toJson function to convert a Dart object to JSON
dynamic timestampToJson(Timestamp? timestamp) {
  return timestamp?.millisecondsSinceEpoch;
}
