// import 'dart:html';

import 'package:drb/services/settings_repo.dart' as sr;
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../models/store_model.dart';
import '../utilities/global_vars.dart';
import '../utilities/scripts.dart';


class SplashScreenController extends ControllerMVC{
  Future<void> initialize() async{
    await getParameters();
    await getStores();
    Navigator.of(this.state!.context).pushNamedAndRemoveUntil('/LoginScreen', (route) => false);
  }

  Future<void> getParameters() async{
    var data = await sr.fetchParameters();
    print(data);
    if (isSuccess(data)){
      await ParseParameters.parseParameter(data['data']);
    }
  }

  Future<void> getStores() async{
    GlobalVars.stores = [];
    var data = await sr.fetchStores();
    if(isSuccess(data)){
      data = data['data'];
      for(var inst in data){
        GlobalVars.stores!.add(Store.fromJson(jsonMap: inst));
      }
      if(GlobalVars.stores!.isNotEmpty){
        GlobalVars.currentStore = GlobalVars.stores!.first;
      }

    }
  }
}