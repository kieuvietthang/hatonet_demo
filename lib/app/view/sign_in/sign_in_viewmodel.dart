import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:hatonet_demo/app/module/common/toast_util.dart';
import 'package:hatonet_demo/app/view/widget_utlis/custom/flutter_easyloading/flutter_easyloading.dart';
import 'package:hatonet_demo/generated/locale_keys.g.dart';

import '../../di/injection.dart';
import '../../module/common/extension.dart';
import '../../module/common/navigator_screen.dart';
import '../../module/local_storage/shared_pref_manager.dart';
import '../../module/network/response/login_response.dart';
import '../../module/repository/data_repository.dart';
import '../../viewmodel/base_viewmodel.dart';

class SignInViewModel extends BaseViewModel {
  final DataRepository _dataRepo;
  late LoginResponse _response;
  NavigationService _navigationService = getIt<NavigationService>();
  UserSharePref _userSharePref = getIt<UserSharePref>();
  final emailFC = FocusNode();
  final passwordFC = FocusNode();
  String email = '';
  String password = '';
  var emailController = TextEditingController();
  var passController = TextEditingController();

  SignInViewModel(this._dataRepo);

  bool get validate =>
      Utils.isEmail(email.trim()) && password.isNotEmpty && password.length > 5;

  onChangeEmail(String value) {
    this.email = value;
    validate;
    notifyListeners();
  }

  onChangePassword(String value) {
    this.password = value;
    validate;
    notifyListeners();
  }


  LoginResponse get response => _response;

  setloginType(int loginType) => _userSharePref.saveLoginType(loginType);



  Future<void> signOut() async {

  }
}
