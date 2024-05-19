import 'package:flutter/material.dart';
import 'package:translatetribune/src/app.dart';
import 'package:translatetribune/src/configs/configs/dev_config.dart';

void main() async {
  final config = DevConfig();
  await config.init();
  
  runApp(const Application());
}
