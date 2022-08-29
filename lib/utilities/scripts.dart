import 'dart:ui';

import 'package:drb/utilities/constants.dart';

class ParseParameters{
  static Map<String, Function> mapDict = {
    'primaryColor': setPrimaryColor,
    'secondaryColor': setSecondaryColor,
    'primaryTextColor': setPrimaryTextColor,
  };

  static Future<void> parseParameter(data) async{
    print(data);
    for(var i in data){
      map_func(parameter: i['parameter'], value: i['value']);
    }
  }

  static void map_func({parameter, value}){
    print(parameter);
    mapDict[parameter]!(value);
  }

  static void setPrimaryColor(value){
    print("Set prim: " + value);
    primaryColor = Color(int.parse('0xff${value}'));
  }

  static void setSecondaryColor(value){
    secondaryColor = Color(int.parse('0xff${value}'));
  }

  static void setPrimaryTextColor(value){
    primaryTextColor = Color(int.parse('0xff${value}'));
  }
}

bool isSuccess(resp){
  return resp['success'];
}