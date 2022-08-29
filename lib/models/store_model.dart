import '../utilities/custom_trace.dart';

class Store{
  String? id;
  String? name;
  String? address;
  String? dateCreated;

  Store.fromJson({jsonMap}){
    try{
      id = jsonMap['id'].toString() ?? '';
      name = jsonMap['name'] ?? '';
      address = jsonMap['address'] ?? '';
      dateCreated = jsonMap['date_created'].toString() ?? '';
    }catch(e){
      CustomTrace(StackTrace.current, message: e.toString());
    }
  }
}