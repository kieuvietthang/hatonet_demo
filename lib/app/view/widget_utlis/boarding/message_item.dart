import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hatonet_demo/app/module/res/dimens.dart';



class MessageItem extends StatelessWidget {
  const MessageItem({
    Key? key,
    required this.onBoardingTitle,
    required this.onBoardingDescription,
  }) : super(key: key);

  final String onBoardingTitle;
  final String onBoardingDescription;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: size_24_h,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [

          SizedBox(
            height: size_18_h,
          ),

        ],
      ),
    );
  }
}