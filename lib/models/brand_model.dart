import '../utilities/custom_trace.dart';
import '../utilities/global_vars.dart';

class Brand{
  String? id;
  String? brand;
  String? date_created;

  Brand.fromJson({jsonMap}){
    try{
      this.id = jsonMap['id'].toString() ?? '';
      this.brand = jsonMap['brand'] ?? '';
      this.date_created = jsonMap['date_created'].toString() ?? '';
    }catch(e){
      CustomTrace(StackTrace.current, message: e.toString());
    }
  }

  static dynamic getById({id}){
    print("Get brand by id");
    for(var dis in GlobalVars.brands!){
      print("Checking : " + dis.id!);
      if(dis.id == id){
        return dis;
      }
    }
    print("null");
    return null;
  }
}