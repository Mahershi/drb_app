import 'package:drb/utilities/constants.dart';
import 'package:flutter/material.dart';

class SubCatHeading extends StatelessWidget{
  SubCatHeading({required this.title, required this.buttonTitle, required this.onTap});

  String title;
  String buttonTitle;
  Function onTap;

  @override
  Widget build(BuildContext context){
    return Container(
      padding: ei24,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: font.merge(TextStyle(
              fontSize: head4
            )),
          ),
          InkWell(
            onTap: (){
              onTap();
            },
            child: Container(
              child: Text(
                buttonTitle,
                style: font.merge(TextStyle(
                  fontSize: body4,
                )),
              )
            )
          )
        ],
      )
    );
  }
}