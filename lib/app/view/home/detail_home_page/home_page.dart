// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hatonet_demo/app/module/res/colors.dart';
import 'package:hatonet_demo/app/provider/google_sign_in_provider.dart';
import 'package:hatonet_demo/app/utils/next_screen.dart';
import 'package:hatonet_demo/app/view/home/details_page/details_page.dart';
import 'package:hatonet_demo/app/view/sign_in/sign_in_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 70,
                width: double.infinity,
                color: Colors.white,
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsPage(onClick: (){},)));
                        },
                        child: Container(
                          padding: EdgeInsets.all(7),
                          height: 35,
                          width: 35,
                          decoration: BoxDecoration(
                              color: kColorDDDDDD, shape: BoxShape.circle),
                          child: SvgPicture.asset(
                            'assets/icons/ic_user_solid.svg',
                            width: 16,
                            height: 16,
                            color: kColorffffff,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Container(
                        width: double.infinity,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Color(0xFFF5F5F5).withOpacity(0.5),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Center(
                          child: TextField(
                            decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.search,color: Color(0xFFFF6116),),
                                hintText: 'Tìm kiếm',
                                border: InputBorder.none),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        child: SvgPicture.asset(
                          'assets/icons/ic_bell.svg',
                          width: 26,
                          height: 26,color: Color(0xFF999999),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  color: Color(0xFFF5F5F5),
                ),
              ),
            ],
          )),
    );
  }
}
