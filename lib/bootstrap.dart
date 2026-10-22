import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'account_manager/account_manager.dart';
import 'env/app_env_config.dart';
import 'my_app.dart';
import 'utils/storage.dart';

Future<void> bootstrap(Environment environment) async {
  WidgetsFlutterBinding.ensureInitialized();
  AppEnvironment.setupEnv(environment);

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await Storage().init();

  final isFirst = await AccountManager().getIsFirstLaunch();
  runApp(MyApp(isFirst: isFirst));
}
