import 'package:freezed_annotation/freezed_annotation.dart';
part 'history_model.freezed.dart';

@freezed
class HistoryModel with _$HistoryModel {
  const factory HistoryModel({
    required String amount,
    required String date,
    required bool asPayment,
  }) = _HistoryModel;
}
