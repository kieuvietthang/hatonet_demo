
import 'package:hatonet_demo/app/view/home/detail_home_page/home_page.dart';
import 'package:hatonet_demo/app/view/intro/intro_page.dart';

import '../../di/injection.dart';
import '../../module/common/config.dart';
import '../../module/common/navigator_screen.dart';
import '../../module/local_storage/shared_pref_manager.dart';
import '../../module/repository/data_repository.dart';
import '../../viewmodel/base_viewmodel.dart';

class SplashViewModel extends BaseViewModel {
  final DataRepository _dataRepo;
  NavigationService _navigationService = getIt<NavigationService>();
  UserSharePref _userSharePref = getIt<UserSharePref>();

  SplashViewModel(this._dataRepo);

  Future<void> startApi() async {
    Future.delayed(
      Duration(milliseconds: DELAY_SPLASH_PAGE),
      () {
        if (_userSharePref.isLogin())
          _navigationService.pushReplacementScreenWithFade(HomePage());
        else
          _navigationService.pushReplacementScreenWithFade(IntroPage());
      },
    );
  }
}
