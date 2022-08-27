import 'package:drb/utilities/constants.dart';
import 'package:flutter/material.dart';

class CustomIconButton extends StatefulWidget{
  CustomIconButton({
    required this.iconPath,
    required this.iconColor,
    required this.iconSize,
    required this.onTap
  });

  String iconPath;
  double iconSize;
  Color iconColor;
  Function onTap;

  @override
  PageState createState() => PageState();
}

class PageState extends State<CustomIconButton>{
  @override
  Widget build(BuildContext context){
    return Container(
      decoration: BoxDecoration(
        // border: testBorder
      ),
      child: Image.asset(
        widget.iconPath,
        color: widget.iconColor,
        width: widget.iconSize,
      )
    );
  }
}