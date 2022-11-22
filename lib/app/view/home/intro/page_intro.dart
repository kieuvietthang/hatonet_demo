// ignore_for_file: prefer_final_fields, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:hatonet_demo/app/view/home/intro/Intro_optimal_page.dart';
import 'package:hatonet_demo/app/view/home/intro/Intro_speed_page.dart';
import 'package:hatonet_demo/app/view/home/intro/Intro_trust_page.dart';
import 'package:hatonet_demo/app/view/sign_in/sign_in_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  PageController _controller = PageController();
  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                onLastPage = (index == 2);
              });
            },
            children: [
              IntroSpeedPage(),
              IntroOptimalPage(),
              IntroTrustPage(),
            ],
          ),
          Container(
            padding: EdgeInsets.only(bottom: 10),
            alignment: Alignment(0, 0.75),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SmoothPageIndicator(

                  controller: _controller,
                  count: 3,
                  axisDirection: Axis.horizontal,
                  effect:  WormEffect(
                      dotHeight: 16,
                      dotWidth: 16,
                      dotColor:  Colors.grey,
                      activeDotColor:  Color(0xFFFF6116)
                  ),
                  // effect: SwapEffect(
                  //     activeDotColor: Color(0xFFE65C00)
                  // ),
                ),
                SizedBox(
                  height: 25,
                ),
                onLastPage
                    ? GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => SignInPage(showRegisterPage: (){})));
                        },
                        child: Padding(
                          padding: EdgeInsets.only(left: 20, right: 20),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return SignInPage(showRegisterPage: () {});
                                  },
                                ),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Color(0xFFFF6116),
                                  borderRadius: BorderRadius.circular(5)),
                              height: 45,
                              width: double.infinity,
                              child: Center(
                                child: Text(
                                  'Bắt đầu',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    : Padding(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: GestureDetector(
                          onTap: () {
                            _controller.nextPage(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeIn,
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Color(0xFFFF6116),
                                borderRadius: BorderRadius.circular(5)),
                            height: 45,
                            width: double.infinity,
                            child: Center(
                              child: Text(
                                'Tiếp tục',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
