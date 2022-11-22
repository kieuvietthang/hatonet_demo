// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hatonet_demo/app/view/sign_in/sign_in_page.dart';

class SliderPage extends StatelessWidget {
  final String title;
  final String description;
  final String image;

  SliderPage(
      {Key? key,
      required this.title,
      required this.description,
      required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    final styte = TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold);


    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(bottom: 80),
      alignment: Alignment.topRight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: EdgeInsets.only(right: 15,bottom: 20),
              child: InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SignInPage(showRegisterPage: (){})));
                },
                child: Text(
                  'Bỏ qua',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.normal),
                ),
              ),
            ),
          ),
          SvgPicture.asset(
            image,
            width: width * 0.9,
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            title,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,color: Color(0xFFFF6116)),
          ),
          SizedBox(height: 15),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Text(
              description,
              style: TextStyle(
                color: Colors.black,
                  height: 1.5,
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                  letterSpacing: 0.7),
              textAlign: TextAlign.start,
            ),
          ),
          SizedBox(
            height: 60,
          )
        ],
      ),
    );
  }
}
