import 'package:drb/utilities/constants.dart';
import 'package:flutter/material.dart';

class CustomSpacer extends StatelessWidget{
  CustomSpacer({this.width = 0, this.height = 0, this.show_frame=false});

  double width;
  double height;
  bool show_frame;

  @override
  Widget build(BuildContext context){
    return Container(
      decoration: BoxDecoration(
        border: show_frame ? testBorder : null
      ),
      width: width,
      height: height,
    );
  }
}