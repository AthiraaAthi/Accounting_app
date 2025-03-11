import 'package:freezed_annotation/freezed_annotation.dart';
part 'main_failure.freezed.dart';

@freezed
class MainFailures with _$MainFailures {
  const factory MainFailures.clientfailure() = Clientfailure;
  const factory MainFailures.cfailure() = Cfailure;
  const factory MainFailures.serverfailure() = Serverfailure;
}
