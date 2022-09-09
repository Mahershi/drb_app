import 'package:drb/utilities/constants.dart';
import 'package:flutter/material.dart';

class Loader extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Material(
      color: Colors.transparent,
      child: Center(
        child: SizedBox(
          height: 40,
          width: 40,
          child: CircularProgressIndicator(
            color: primaryColor,
          ),
        ),
      ),
    );
  }
}