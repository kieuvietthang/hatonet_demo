// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hatonet_demo/app/view/sign_in/sign_in_page.dart';

class IntroTrustPage extends StatelessWidget {
  const IntroTrustPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(top: 30),
        child: Column(
          children: [
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => SignInPage(showRegisterPage: (){})));
              },
              child: Padding(
                padding: EdgeInsets.only(right: 20,top: 25),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    'Bỏ qua',
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 22,
            ),
            Center(child: SvgPicture.asset('assets/icons/ic_trust.svg')),
            SizedBox(
              height: 30,
            ),
            Text(
              'TIN CẬY',
              style: TextStyle(
                  fontSize: 22,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFFF6116)),
            ),
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: EdgeInsets.only(left: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/icons/ic_circle_solid.svg',
                    width: 8,
                    height: 8,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Mức phí tối ưu nhất trên thị trường.',
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Padding(
              padding: EdgeInsets.only(left: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: SvgPicture.asset(
                      'assets/icons/ic_circle_solid.svg',
                      width: 8,
                      height: 8,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Hệ thống CMS được cập nhật và \nphát triển liên tục.',
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Padding(
              padding: EdgeInsets.only(left: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: SvgPicture.asset(
                      'assets/icons/ic_circle_solid.svg',
                      width: 8,
                      height: 8,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Luôn phát triển và đồng hành \ncùng doanh nghiệp CNTT Việt Nam.',
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
