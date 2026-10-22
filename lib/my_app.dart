import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import '../account_manager/account_binding.dart';
import '../env/app_env_config.dart';
import '../base/getx_router_observer.dart';
import '../extension/theme_data_extension.dart';
import '../logger/logger.dart';
import 'routes/routes.dart';

class MyApp extends StatelessWidget {
  final bool isFirst;

  const MyApp({Key? key, required this.isFirst}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("build isFirst : $isFirst");

    return ScreenUtilInit(
      designSize: const Size(375, 667),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          title: '麦卡出行',
          navigatorObservers: [GetXRouterObserver(), FlutterSmartDialog.observer],
          unknownRoute: Routes.unknownPage,
          debugShowCheckedModeBanner:
              AppEnvironment.environment == Environment.dev ? true : false,

          /// 通过使用initialRoute来保证绑定的操作
          initialRoute: isFirst ? Routes.welcome : Routes.splash,
          getPages: Routes.routePage,
          onGenerateRoute: (settings) {
            logger.d(settings.name);
            return null;
          },

          /// 经过初始化的binding,
          initialBinding: AccountBinding(),

          builder: FlutterSmartDialog.init(builder: _builder),

          /// 自定义主题
          theme: FlexThemeData.light(
            colors: const FlexSchemeColor(
              primary: Color(0xffFF8A00),
              primaryContainer: Color(0xffFF8A00),
              secondary: Color(0xff365b37),
              secondaryContainer: Color(0xffaebdaf),
              tertiary: Color(0xff2c7e2e),
              tertiaryContainer: Color(0xffb8e6b9),
              appBarColor: Color(0xffb8e6b9),
              error: Color(0xffb00020),
            ),
            surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
            blendLevel: 7,
            subThemesData: const FlexSubThemesData(
              appBarBackgroundSchemeColor: SchemeColor.surface,
              // appBarBackgroundSchemeColor: Colors.white,
              blendOnLevel: 10,
              blendOnColors: false,
              useM2StyleDividerInM3: true,
              adaptiveAppBarScrollUnderOff: FlexAdaptive.all(),
              inputDecoratorBorderType: FlexInputBorderType.underline,
            ),
            visualDensity: FlexColorScheme.comfortablePlatformDensity,
            useMaterial3: true,
            swapLegacyOnMaterial3: true,
          ).copyWith(
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
              ),
            ),
          ),
          darkTheme: FlexThemeData.dark(
            colors: const FlexSchemeColor(
              primary: Color(0xffFF8A00),
              primaryContainer: Color(0xffFF8A00),
              secondary: Color(0xff81b39a),
              secondaryContainer: Color(0xff4d6b5c),
              tertiary: Color(0xff88c5a6),
              tertiaryContainer: Color(0xff356c50),
              appBarColor: Color(0xff356c50),
              error: Color(0xffcf6679),
            ),
            surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
            blendLevel: 13,
            subThemesData: const FlexSubThemesData(
              appBarBackgroundSchemeColor: SchemeColor.error,
              blendOnLevel: 20,
              useM2StyleDividerInM3: true,
              inputDecoratorBorderType: FlexInputBorderType.underline,
              adaptiveAppBarScrollUnderOff: FlexAdaptive.all(),
            ),
            visualDensity: FlexColorScheme.comfortablePlatformDensity,
            useMaterial3: true,
            swapLegacyOnMaterial3: true,
          ).copyWith(
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
              ),
            ),
          ),
          themeMode: ThemeMode.system,
        );
      },
    );
  }

  Widget _builder(context, widget) {
      widget = EasyLoading.init()(context, widget);
      // widget = FlutterSmartDialog.init()(context, widget);
      // return child;
      return MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaler: TextScaler.noScaling),
        child: widget,
      );
    }

  /// App运行过程中,如果在iOS的设置中更改了亮度模式,还是无法实时进行更改,只能下次运行的时候才能体现变化,体验不好
  ThemeData _getMaterialCurrentTheme() {
    return SchedulerBinding.instance.window.platformBrightness.themeData;
  }

  CupertinoThemeData _getCupertinoCurrentTheme() {
    return const CupertinoThemeData(
        barBackgroundColor: Colors.white, brightness: Brightness.light);
  }
}
