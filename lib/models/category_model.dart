import '../utilities/custom_trace.dart';
import '../utilities/global_vars.dart';

class Category{
  String? id;
  String? category;
  String? date_created;

  Category.fromJson({jsonMap}){
    try{
      this.id = jsonMap['id'].toString() ?? '';
      this.category = jsonMap['category'] ?? '';
      this.date_created = jsonMap['date_created'].toString() ?? '';
    }catch(e){
      CustomTrace(StackTrace.current, message: e.toString());
    }
  }

  static dynamic getById({id}){
    for(var dis in GlobalVars.categories!){
      if(dis.id == id){
        return dis;
      }
    }
    return null;
  }
}