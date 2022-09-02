import '../utilities/custom_trace.dart';

class User{
  String? name;
  String? username;
  bool? isSuper;
  bool? isStaff;
  String? id;
  String? token;


  User.fromJson({jsonMap, token}){
    try{
      this.name = jsonMap['name'] ?? '';
      this.username = jsonMap['username'] ?? '';
      this.id = jsonMap['id'].toString() ?? '';
      this.isSuper = jsonMap['is_superuser'] ?? false;
      this.isStaff = jsonMap['is_staff'] ?? false;
      this.token = token;
    }catch(e){
      CustomTrace(StackTrace.current, message: e.toString());
    }
  }
}