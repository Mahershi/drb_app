import 'package:drb/utilities/constants.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Container(
      padding: ei20,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "DRB",
            style: font.merge(TextStyle(
              fontSize: head2
            )),
          )
        ],
      ),
    );
  }
}