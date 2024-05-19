import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:translatetribune/src/configs/configs/get_it.config.dart';

import 'app_config.dart';

final getIt = GetIt.instance;

@injectableInit
void initDependencies(AppConfig config) {
  getIt.registerSingleton<AppConfig>(config);

  getIt.init(environment: config.name);
}
