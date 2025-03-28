import 'package:freezed_annotation/freezed_annotation.dart';

part 'help_model.freezed.dart';
part 'help_model.g.dart';

@freezed
class HelpModel with _$HelpModel {
  factory HelpModel({
    String? id,
    String? name,
    String? phone,
    String? problem,
  }) = _HelpModel;

  factory HelpModel.fromJson(Map<String, dynamic> json) =>
      _$HelpModelFromJson(json);
}
