
import 'package:flutter/material.dart';
import 'package:hatonet_demo/app/view/error/error_page.dart';
import 'package:hatonet_demo/app/view/intro/intro_page.dart';
import 'package:hatonet_demo/app/view/splash/splash_page.dart';
import 'package:hatonet_demo/app/view/widget_utlis/dialog/dialog_log_out_app.dart';
import 'package:page_transition/page_transition.dart';

import '../../di/injection.dart';
import '../local_storage/shared_pref_manager.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey =
  new GlobalKey<NavigatorState>();
  int currentHomeIndex = -1;
  int allNotificationTabIndexFromPush = -1;
  int myPageGameTitileIdFromPush = -1;
  String myPageTypeFromPush = "player";


  //replace with anim fade
  Future<dynamic>? pushReplacementScreenWithFade(Widget widget) {
    return navigatorKey.currentState?.pushReplacement(
      PageTransition(type: PageTransitionType.fade, child: widget),
    );
  }

  //replace with anim slide left in right out
  Future<dynamic>? pushReplacementScreenWithSlideLeftIn(Widget widget) {
    return navigatorKey.currentState?.pushReplacement(
      PageTransition(type: PageTransitionType.leftToRight, child: widget),
    );
  }

  //replace with anim slide left in right out
  Future<dynamic>? pushReplacementScreenWithSlideRightIn(Widget widget) {
    return navigatorKey.currentState?.pushReplacement(
      PageTransition(type: PageTransitionType.rightToLeft, child: widget),
    );
  }

  Future<dynamic>? pushEnterFadeExitDown(Widget widget) {
    return navigatorKey.currentState?.push(
      PageRouteBuilder(
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            if (animation.status == AnimationStatus.reverse) {
              //do your dismiss animation here
              return SlideTransition(
                  position: new Tween<Offset>(
                    begin: const Offset(0.0, 1.0),
                    end: Offset.zero,
                  ).animate(animation),
                  child: child);
            } else {
              return
                FadeTransition(
                  opacity: animation,
                  child: child,
                );
            }
          },
          pageBuilder: (BuildContext context, Animation animation,
              Animation secondaryAnimation) {
            return widget;
          }),
    );
  }

  //push with anim fade
  Future<dynamic>? pushScreenWithFade(Widget widget) {
    return navigatorKey.currentState?.push(
      PageTransition(type: PageTransitionType.fade, child: widget),
    );
  }

  //push with anim slide up
  Future<dynamic>? pushScreenWithSlideUp(Widget widget) {
    return navigatorKey.currentState?.push(
      PageTransition(type: PageTransitionType.bottomToTop, child: widget),
    );
  }

  //clear all page and push new page
  Future<dynamic>? pushAndRemoveUntilWithFade(Widget widget) {
    return navigatorKey.currentState?.pushAndRemoveUntil(
      PageTransition(type: PageTransitionType.fade, child: widget),
          (route) => false,
    );
  }

  //push with anim fade
  Future<dynamic>? pushScreenWithSlideLeftRight(Widget widget) {
    return navigatorKey.currentState?.push(
      PageTransition(type: PageTransitionType.rightToLeft, child: widget),
    );
  }

  //push no anim
  Future<dynamic>? pushScreenNoAnim(Widget widget) {
    return navigatorKey.currentState?.push(
      MaterialPageRoute(builder: (context) => widget),
    );
  }

  refreshApp() {
    pushAndRemoveUntilWithFade(SplashPage());
  }

  gotoErrorPage({String? message}) {
    pushAndRemoveUntilWithFade(ErrorPage(
      message: message,
    ));
  }

  back() {
    navigatorKey.currentState?.pop();
  }

  void signOut(){
    showDialog(
        context: navigatorKey.currentContext!,
        builder: (BuildContext context) {
          return DialogExitApp(
            funcExit: () {
              getIt<UserSharePref>().setIsLogin(false);
              pushAndRemoveUntilWithFade(IntroPage());
            },
          );
        });

  }

  dimiss() {
    navigatorKey.currentState?.pop();
  }
}
