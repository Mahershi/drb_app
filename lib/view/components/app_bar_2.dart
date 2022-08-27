import 'package:drb/view/components/custom_spacer.dart';
import 'package:drb/view/components/icon_buttons.dart';
import 'package:flutter/material.dart';

import '../../utilities/constants.dart';

class CustomAppBar2 extends StatefulWidget{
  @override
  PageState createState() => PageState();
}

class PageState extends State<CustomAppBar2>{
  @override
  Widget build(BuildContext context){
    return Container(
      decoration: BoxDecoration(
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "DRB",
            style: font.merge(TextStyle(
                fontSize: head1
            )),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomIconButton(
                iconPath: 'assets/img/search.png',
                iconSize: appBarIconSize,
                iconColor: primaryColor,
                onTap: (){},
              ),
              CustomSpacer(width: 30,),
              CustomIconButton(
                iconPath: 'assets/img/bag.png',
                iconSize: appBarIconSize,
                iconColor: primaryColor,
                onTap: (){},
              ),
              CustomSpacer(width: 30,),
              CustomIconButton(
                iconPath: 'assets/img/setting.png',
                iconSize: appBarIconSize,
                iconColor: primaryColor,
                onTap: (){},
              ),

            ],
          )
        ],
      ),
    );
  }
}