import 'package:drb/controllers/homescreen_controller.dart';
import 'package:drb/utilities/constants.dart';
import 'package:drb/view/components/app_bar_2.dart';
import 'package:drb/view/components/looking_for.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import '../../utilities/global_vars.dart';
import 'CategoryScreen.dart';
import 'MainScreen.dart';

class HomeScreen extends StatefulWidget{
  @override
  PageState createState() => PageState();
}

class PageState extends StateMVC<HomeScreen>{
  HomeScreenController? con;

  PageState() : super(HomeScreenController()){
    con = controller as HomeScreenController;
    GlobalVars.hsCon = con;
  }

  @override
  void initState(){
    super.initState();
    con!.switchPage(page: 0);
  }
  @override
  Widget build(BuildContext context){
    return SafeArea(
      child: Scaffold(
        backgroundColor: primaryColor,
        body: Column(
          children: [
            Container(
              padding: ei20,
              child: CustomAppBar2()
            ),
            Expanded(
              child: con!.current!
            )
          ],
        ),
      ),
    );
  }
}