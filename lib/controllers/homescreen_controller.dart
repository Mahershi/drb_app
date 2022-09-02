import 'package:drb/view/screens/CategoryScreen.dart';
import 'package:drb/view/screens/MainScreen.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class HomeScreenController extends ControllerMVC{
  int currentPage = 0;
  Widget? current;


  void switchPage({required int page, dynamic args}){
    switch(page){
      case 0:
        current = MainScreen();
        break;
      case 1:
        current = CategoryScreen(currentCatId: args);
        break;
      default:
        current = MainScreen();
    }

    this.state!.setState(() { });
  }
}