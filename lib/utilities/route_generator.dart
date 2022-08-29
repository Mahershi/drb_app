import 'package:drb/view/screens/HomeScreen.dart';
import 'package:drb/view/screens/LoginScreen.dart';
import 'package:drb/view/screens/SplashScreen.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/SplashScreen':
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case '/LoginScreen':
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case '/HomeScreen':
        return MaterialPageRoute(builder: (_) => HomeScreen());
      default:
        return MaterialPageRoute(builder: (_) => Scaffold(body: SafeArea(child: Text('Route Error'))));
    }
  }
}
