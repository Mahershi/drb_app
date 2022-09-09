import 'package:drb/models/product_meta_model.dart';
import 'package:drb/view/screens/CartScreen.dart';
import 'package:drb/view/screens/FlavoursBaseScreen.dart';
import 'package:drb/view/screens/HomeScreen.dart';
import 'package:drb/view/screens/LoginScreen.dart';
import 'package:drb/view/screens/SettingsScreen.dart';
import 'package:drb/view/screens/SplashScreen.dart';
import 'package:flutter/material.dart';
import 'package:drb/models/product_meta_model.dart';

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
      case '/FlavourScreen':
        return MaterialPageRoute(builder: (_) => FlavoursBaseScreen(product: args as ProductMeta));
      case '/CartScreen':
        return MaterialPageRoute(builder: (_) => CartScreen());
      case '/SettingsScreen':
        return MaterialPageRoute(builder: (_) => SettingsScreen());
      default:
        return MaterialPageRoute(builder: (_) => Scaffold(body: SafeArea(child: Text('Route Error'))));
    }
  }
}
