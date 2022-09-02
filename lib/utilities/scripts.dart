import 'dart:ui';

import 'package:drb/utilities/constants.dart';
import 'package:drb/utilities/global_vars.dart';

class ParseParameters{
  static Map<String, Function> mapDict = {
    'primaryColor': setPrimaryColor,
    'secondaryColor': setSecondaryColor,
    'primaryTextColor': setPrimaryTextColor,
    'show_strong': setShowStrong,
    'show_new': setShowNew,
    'show_popular': setShowPopular,
    'show_sale': setShowSale,
    'popular_label': setPopularLabel,
    'strong_label': setStrongLabel,
    'new_label': setNewLabel,
    'sale_label': setSaleLabel,
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

  static void setPopularLabel(value){
    GlobalVars.popular_label = value;
  }

  static void setSaleLabel(value){
    GlobalVars.sale_label = value;
  }
  static void setStrongLabel(value){
    GlobalVars.strong_label = value;
  }
  static void setNewLabel(value){
    GlobalVars.new_label = value;
  }

  static void setShowPopular(value){
    GlobalVars.show_popular = value.toLowerCase() == 'true' ? true : false;
  }

  static void setShowSale(value){
    GlobalVars.show_sale = value.toLowerCase() == 'true' ? true : false;
  }

  static void setShowStrong(value){
    GlobalVars.show_strong = value.toLowerCase() == 'true' ? true : false;
  }

  static void setShowNew(value){
    GlobalVars.show_new = value.toLowerCase() == 'true' ? true : false;
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