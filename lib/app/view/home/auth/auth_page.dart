import 'package:flutter/material.dart';
import 'package:hatonet_demo/app/view/sign_in/sign_in_page.dart';
import 'package:hatonet_demo/app/view/sign_up/sign_up_page.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {

  bool showLoginPage = true;

  void toggleScreens(){
    setState((){
      //showLoginPage = !showLoginPage;
      Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage(showLoginPage: () { },),));
    });
  }

  @override
  Widget build(BuildContext context) {
    if(showLoginPage) {
      return SignInPage(showRegisterPage: toggleScreens);
    }else{
      return SignUpPage(showLoginPage: toggleScreens,);
    }
  }
}
