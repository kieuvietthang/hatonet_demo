import 'package:flutter/material.dart';

class Indicator extends StatelessWidget {
 // final bool isActive;
  const Indicator({Key? key, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width:  8.0,
      height: 8.0,
      decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(8.0)),
    );
  }
}
