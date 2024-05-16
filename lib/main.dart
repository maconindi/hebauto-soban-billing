import 'package:flutter/material.dart';
import 'package:worker_manager/worker_manager.dart';

import 'core/util/config.dart';
import 'injection.dart';
import 'autoheb_app.dart';


void main() async {
  await configureDependencies();

  await workerManager.init();

  await initialize();
  //setPathUrlStrategy();
  runApp(const AutoHeb());
}











