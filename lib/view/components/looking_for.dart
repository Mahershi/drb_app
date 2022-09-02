import 'package:drb/utilities/constants.dart';
import 'package:flutter/material.dart';

class LookingFor extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Text(
        "Looking for ...",
        style: font.merge(TextStyle(
          fontSize: head2
        )),
      )
    );
  }
}