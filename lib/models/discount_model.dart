import 'package:drb/utilities/global_vars.dart';

import '../utilities/custom_trace.dart';

class Discount{
  String? qty;
  String? dis_price;
  String? id;

  Discount.fromJson({jsonMap}){
    try{
      this.qty = jsonMap['discount_qty'].toString() ?? '';
      this.dis_price = jsonMap['discount_price'].toString() ?? '';
      this.id = jsonMap['id'].toString() ?? '';
    }
    catch(e){
      CustomTrace(StackTrace.current, message: e.toString());
    }
  }

  static dynamic getById({id}){
    print(GlobalVars.discounts!.length);
    for(var dis in GlobalVars.discounts!){
      if(dis.id == id){
        return dis;
      }
    }
    return null;
  }
}