import 'package:drb/utilities/constants.dart';
import 'package:flutter/material.dart';

class CommingSoon extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Container(
      padding: eiTop40,
      alignment: Alignment.center,
      child: Text(
        "Comming Soon",
        style: font.merge(TextStyle(
          fontSize: body1,
          letterSpacing: 1.1,
          color: primaryTextColor
        )),
      )
    );
  }
}