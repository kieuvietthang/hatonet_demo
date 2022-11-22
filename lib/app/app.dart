import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hatonet_demo/app/provider/google_sign_in_provider.dart';
import 'package:hatonet_demo/app/provider/internet_provider.dart';
import 'package:hatonet_demo/app/view/home/hello_page/hello.dart';
import 'package:provider/provider.dart';
import 'package:hatonet_demo/app/di/injection.dart';
import 'package:hatonet_demo/app/module/common/navigator_screen.dart';
import 'package:hatonet_demo/app/module/common/system_utils.dart';
import 'package:hatonet_demo/app/view/sign_in/sign_in_page.dart';
import 'package:hatonet_demo/app/view/widget_utlis/custom/flutter_easyloading/flutter_easyloading.dart';
import '../flavors.dart';
import 'module/res/themes.dart';

class App extends StatefulWidget {
  const App({
    Key? key,
  }) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();
    SystemUtils.setPortraitScreenOrientation();
    //SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: kColor202330));
    //SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: transparent));
  }

  @override
  void dispose() {
    super.dispose();
  }

  void backPress(BuildContext context) {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          FocusManager.instance.primaryFocus?.unfocus();
        }
      },
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => SignInProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => InternetProvider(),
          ),
        ],
        child: MaterialApp(
          theme: theme,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          title: F.title,
          //hide badge debug
          debugShowCheckedModeBanner: false,
           home: HelloPage(),
          routes: {
            '/SignInPage': (context) =>  SignInPage(showRegisterPage: (){}),
          },
          builder: EasyLoading.init(),
          navigatorKey: getIt<NavigationService>().navigatorKey,
        ),
      ),

    );
  }
}
