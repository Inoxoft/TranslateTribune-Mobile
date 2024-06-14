import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:translatetribune/src/app.dart';
import 'package:translatetribune/src/configs/configs/dev_config.dart';

void main() async {
  final config = DevConfig();
  await config.init();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Platform.isAndroid ? Colors.transparent : null,
    ),
  );

  runApp(const Application());
}
