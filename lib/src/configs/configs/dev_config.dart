import 'package:flutter/material.dart';
import 'package:translatetribune/src/data/services/notifications.dart';
import 'package:timezone/data/latest.dart';

import 'app_config.dart';
import 'get_it.dart';

class DevConfig extends AppConfig {
  @override
  String get name => 'dev';

  @override
  Future<void> init() async {
    await super.init();

    initDependencies(this);

    WidgetsFlutterBinding.ensureInitialized();

    initializeTimeZones();

    await getIt<NotificationsService>().initNotification();

    // await Future.delayed(
    //   const Duration(milliseconds: 100),
    // );
  }
}
