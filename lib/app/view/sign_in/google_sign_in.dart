// // ignore_for_file: prefer_const_constructors
//
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:hatonet_mobile/app/view/home/auth/auth_page.dart';
// import 'package:hatonet_mobile/app/view/home/bottom/bottom_bar.dart';
// import 'package:hatonet_mobile/app/view/home/home/home_page.dart';
// import 'package:hatonet_mobile/app/view/sign_in/sign_in_page.dart';
//
// class GOogleSignIn extends StatelessWidget {
//   const GOogleSignIn({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: StreamBuilder(
//         stream: FirebaseAuth.instance.authStateChanges(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(
//               child: CircularProgressIndicator(),
//             );
//           } else if (snapshot.hasData) {
//             return BottomBarPage();
//           } else if (snapshot.hasError) {
//             return Center(
//               child: Text('Something Went Wrong'),
//             );
//           }else{
//             return SignInPage(showRegisterPage: (){});
//           }
//         },
//       ),
//     );
//   }
// }
