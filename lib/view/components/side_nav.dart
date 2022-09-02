import 'package:drb/utilities/constants.dart';
import 'package:drb/utilities/global_vars.dart';
import 'package:flutter/material.dart';

class SideNav extends StatefulWidget{
  SideNav({required this.currentCatId});

  String currentCatId;
  @override
  PageState createState() => PageState();
}

class PageState extends State<SideNav>{
  @override
  Widget build(BuildContext context){
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: GlobalVars.categories!.map((element){
          return InkWell(
            onTap: (){
              GlobalVars.hsCon!.switchPage(page: 1, args: element.id);
            },
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              padding: ei20,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: widget.currentCatId == element.id ? radius20 : Radius.circular(0),
                  bottomLeft: widget.currentCatId == element.id ? radius20 : Radius.circular(0),
                ),
                color: widget.currentCatId == element.id ? Colors.white : Colors.transparent,
              ),
              child: Text(
                element.category!,
                style: font.merge(TextStyle(
                  fontSize: body1
                )),
              )
            ),
          );
        }).toList(),
      ),
    );
  }
}