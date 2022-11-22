import 'package:easy_localization/easy_localization.dart';
import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hatonet_demo/app/view/widget_utlis/custom/flutter_easyloading/custom_animation_loading.dart';
import 'package:hatonet_demo/app/view/widget_utlis/custom/flutter_easyloading/src/easy_loading.dart';
import 'package:firebase_core/firebase_core.dart';
import 'app/app.dart';
import 'app/di/injection.dart';
import 'app/module/local_storage/shared_pref_manager.dart';
import 'flavors.dart';


//event bus global
EventBus eventBus = EventBus();

Future main() async {
  F.appFlavor = Flavor.DEVELOPMENT;
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await EasyLocalization.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top]);
  //Start DI

  await SharedPrefManager.getInstance();
  await configureDependencies();
  configLoading();

  runApp(
    ScreenUtilInit(
      designSize: ScreenUtil.defaultSize,
      builder: (BuildContext context, Widget? child) => EasyLocalization(
              supportedLocales: [Locale('en', 'US'), Locale('de', 'DE')],
              path: 'assets/translations', // <-- change the path of the translation files
              fallbackLocale: Locale('en', 'US'),
              child: App(),
          ),

          /*GetMaterialApp(
        translationsKeys: AppTranslation.translations,
        locale: Locale('en', 'US'),
        fallbackLocale: Locale('en', 'US'),
        home: App(),
        title: F.name,
      ),*/
    ),
  );
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.circle
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..contentPadding = EdgeInsets.zero
    ..progressColor = Colors.white
    ..backgroundColor = Colors.black26
    ..indicatorColor = Colors.white
    ..textColor = Colors.yellow
    ..maskColor = Colors.black.withOpacity(0.3)
    ..maskType = EasyLoadingMaskType.custom
    ..userInteractions = false
    ..dismissOnTap = false
    ..customAnimation = CustomAnimation();
}
