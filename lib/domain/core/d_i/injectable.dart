import 'package:curved_nav/domain/core/d_i/injectable.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final getit = GetIt.instance;
@InjectableInit()
Future<void> configInjectable() async {
  await getit.init(environment: Environment.prod);
}
