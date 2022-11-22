import 'package:get_it/get_it.dart';
import 'package:hatonet_demo/app/module/common/navigator_screen.dart';
import 'package:hatonet_demo/app/module/local_storage/shared_pref_manager.dart';
import 'package:hatonet_demo/app/module/network/request/auth_request.dart';
import 'package:hatonet_demo/app/module/repository/data_repository.dart';
import 'package:hatonet_demo/app/view/intro/intro_viewmodel.dart';
import 'package:hatonet_demo/app/view/sign_in/sign_in_viewmodel.dart';
import 'package:hatonet_demo/app/view/webview/webview_viewmodel.dart';


final getIt = GetIt.instance;

Future<void> configureDependencies() async {
  //local storage
  getIt.registerSingleton<UserSharePref>(UserSharePref());
  getIt.registerSingleton<SharedPrefManager>(SharedPrefManager());
  getIt.registerLazySingleton<NavigationService>(() => NavigationService());

  //repository
  getIt.registerFactory<AuthRequest>(() => AuthRequest());
  //getIt.registerFactory<SocketManager>(() => SocketManager());

  //data repository
  getIt.registerFactory<DataRepository>(() => DataRepository(
    getIt<AuthRequest>(),
    getIt<SharedPrefManager>(),
    // getIt<SocketManager>(),
  ));


  //view model

  getIt.registerFactory<IntroViewModel>(
          () => IntroViewModel(getIt<DataRepository>()));


  getIt.registerFactory<SignInViewModel>(
          () => SignInViewModel(getIt<DataRepository>()));

  getIt.registerFactoryParam<WebviewViewModel, List<dynamic>, dynamic>(
      (param1, _) => //no need param2
          WebviewViewModel(webviewParam: param1[0]));
}
