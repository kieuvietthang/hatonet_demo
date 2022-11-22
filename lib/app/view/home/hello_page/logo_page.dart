// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hatonet_demo/app/view/home/lottie/loading_page.dart';

class LogoPage extends StatefulWidget {
  const LogoPage({Key? key}) : super(key: key);

  @override
  State<LogoPage> createState() => _LogoPageState();
}

class _LogoPageState extends State<LogoPage> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => LoadingPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(30, 100, 30, 0),
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Image.asset('assets/images/img_hatonet.png'),
            ),
          ),
          // Container(
          //   padding: EdgeInsets.all(30),
          //   child: Image.asset('assets/images/logo hatonet-06 (2).png'),
          // ),
          Spacer(),
          Container(
            child: Padding(
              padding: EdgeInsets.only(bottom: 15),
              child: Center(
                child: Text(
                  'Copyright © 2021 by Hatonet.com. All Rights Reserved.',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
