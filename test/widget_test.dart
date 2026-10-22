import 'package:cp_driver_app/env/app_env_config.dart';
import 'package:cp_driver_app/app_service/account_service.dart';
import 'package:cp_driver_app/app_service/theme_service.dart';
import 'package:cp_driver_app/enum/theme_type.dart';
import 'package:cp_driver_app/main.dart' as app;
import 'package:cp_driver_app/pages/launch/welcome_page.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  testWidgets('Default entry point opens the first-launch welcome page', (
    tester,
  ) async {
    SharedPreferences.setMockInitialValues({});
    Get.testMode = true;
    addTearDown(Get.reset);

    await tester.runAsync(app.main);
    await tester.pumpAndSettle();

    expect(AppEnvironment.environment, Environment.dev);
    expect(Get.isRegistered<AccountService>(), isTrue);
    expect(Get.isRegistered<ThemeService>(), isTrue);
    expect(find.byType(WelcomePage), findsOneWidget);
    expect(find.text('点击进入'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  test(
    'Merged services restore existing account and theme preferences',
    () async {
      SharedPreferences.setMockInitialValues({
        'kIsFirstLaunch': false,
        'kLastLoginUserName': 'existing-user',
        'kThemeSetting': ThemeType.green.index,
      });
      addTearDown(Get.reset);

      final accountService = Get.put(AccountService());
      final themeService = Get.put(ThemeService());

      expect(await accountService.getIsFirstLaunch(), isFalse);
      expect(await accountService.getLastLoginUserName(), 'existing-user');
      expect(await themeService.getThemeType(), ThemeType.green);
      expect(themeService.themeData, ThemeType.green.theme);
    },
  );
}
