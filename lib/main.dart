import 'package:drb/utilities/global_vars.dart';
import 'package:drb/utilities/route_generator.dart';
import 'package:flutter/material.dart';

import 'app_config.dart';
import 'network/rest_service.dart';

void main(){
  setUpConfiguration();
  RestService.init();
  runApp(DRB());
}

class DRB extends StatelessWidget{
  @override
  Widget build(BuildContext buildContext){
    return MaterialApp(
      onGenerateRoute: RouteGenerator.generateRoute,
      debugShowCheckedModeBanner: false,
      initialRoute: '/SplashScreen',
      navigatorObservers: [GlobalVars.routeObserver],
    );
  }
}

void setUpConfiguration() {
  AppConfig.setEnvironment(Environment.DEVELOPMENT);
}