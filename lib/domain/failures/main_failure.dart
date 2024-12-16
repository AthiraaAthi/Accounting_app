import 'package:freezed_annotation/freezed_annotation.dart';
part 'main_failure.freezed.dart';

@freezed
class MainFailures with _$MainFailures {
  const factory MainFailures.clientfailure() = _Clientfailure;
  const factory MainFailures.serverfailure() = _Serverfailure;
}
