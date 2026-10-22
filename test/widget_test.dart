import 'package:cp_driver_app/env/app_env_config.dart';
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
    expect(find.byType(WelcomePage), findsOneWidget);
    expect(find.text('点击进入'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}
