import 'package:drb/utilities/constants.dart';
import 'package:drb/utilities/scripts.dart';
import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget{
  SubmitButton({required this.label,
    required this.onPress,
    required this.width,
    required this.height,
    required this.labelColor,
    required this.backgroundColor,
  });

  Function onPress;
  String label;
  double height;
  double width;
  Color labelColor;
  Color backgroundColor;

  @override
  Widget build(BuildContext context){
    return GestureDetector(
      onTap: (){
        onPress();
      },
      child: Container(
        padding: ei24,
        decoration: BoxDecoration(
          borderRadius: borderRadius12,
          color: backgroundColor
        ),
        alignment: Alignment.center,
        width: width,
        // height: double.infinity,
        child: Text(
          label,
          style: font.merge(TextStyle(
            color: labelColor,
            fontSize: body1
          )),
        )
      ),
    );
  }
}