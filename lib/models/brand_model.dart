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
    for(var dis in GlobalVars.brands!){
      if(dis.id == id){
        return dis;
      }
    }
    return null;
  }
}