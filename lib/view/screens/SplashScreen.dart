import 'package:drb/controllers/splashscreen_controller.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../utilities/constants.dart';

class SplashScreen extends StatefulWidget{
  @override
  PageState createState() => PageState();
}

class PageState extends StateMVC<SplashScreen>{
  SplashScreenController? con;

  PageState() : super(SplashScreenController()){
    con = controller as SplashScreenController;
  }

  @override
  void initState(){
    super.initState();
    con!.initialize();
  }

  @override
  Widget build(BuildContext context){
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                colorFilter: ColorFilter.mode(primaryColor.withOpacity(0.35), BlendMode.srcIn),
                image: AssetImage('assets/img/smoke.png')
            )
          ),
          alignment: Alignment.center,
          child: Text(
            "DRB",
            style: font.merge(TextStyle(
                fontSize: head2
            )),
          )
        ),
      ),
    );
  }
}