import 'package:drb/utilities/route_generator.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(DRB());
}

class DRB extends StatelessWidget{
  @override
  Widget build(BuildContext buildContext){
    return MaterialApp(
      onGenerateRoute: RouteGenerator.generateRoute,
      debugShowCheckedModeBanner: false,
      initialRoute: '/HomeScreen',
    );
  }
}