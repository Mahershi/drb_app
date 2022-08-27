import 'package:drb/utilities/constants.dart';
import 'package:drb/view/components/app_bar_2.dart';
import 'package:drb/view/components/looking_for.dart';
import 'package:flutter/material.dart';

import 'CategoryScreen.dart';
import 'MainScreen.dart';

class HomeScreen extends StatefulWidget{
  @override
  PageState createState() => PageState();
}

class PageState extends State<HomeScreen>{
  @override
  Widget build(BuildContext context){
    return SafeArea(
      child: Scaffold(
        backgroundColor: secondaryColor,
        body: Column(
          children: [
            Container(
              padding: ei20,
              child: CustomAppBar2()
            ),
            Expanded(
              child: CategoryScreen()
            )
          ],
        ),
      ),
    );
  }
}