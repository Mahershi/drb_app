import 'package:drb/utilities/constants.dart';
import 'package:flutter/material.dart';

class SideNav extends StatefulWidget{

  @override
  PageState createState() => PageState();
}

class PageState extends State<SideNav>{
  List<String> cats = ['Disposables', 'Pods', 'eJuice', 'Coild', 'Devices', 'Accessories', 'Misc', 'a', 'b', 'c', 'd'];
  int current = 0;
  @override
  Widget build(BuildContext context){
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: cats.map((element){
          return Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            padding: ei20,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: current == cats.indexOf(element) ? radius20 : Radius.circular(0),
                bottomLeft: current == cats.indexOf(element) ? radius20 : Radius.circular(0),
              ),
              color: current == cats.indexOf(element) ? Colors.white : Colors.transparent,
            ),
            child: Text(
              element,
              style: font.merge(TextStyle(
                fontSize: body1
              )),
            )
          );
        }).toList(),
      ),
    );
  }
}