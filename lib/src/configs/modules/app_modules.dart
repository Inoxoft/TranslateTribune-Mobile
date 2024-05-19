import 'package:injectable/injectable.dart';
import 'package:translatetribune/src/configs/router/app_router.dart';

@module
abstract class AppModules {
  @singleton
  @factoryMethod
  AppRouter get router => AppRouter();
}
