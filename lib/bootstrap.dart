import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'app_service/account_service.dart';
import 'app_service/theme_service.dart';
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

  final accountService = Get.put(AccountService());
  final themeService = Get.put(ThemeService());
  final isFirst = await accountService.getIsFirstLaunch();
  await themeService.getThemeType();
  runApp(MyApp(isFirst: isFirst));
}
