import 'package:drb/network/API.dart';
import 'package:drb/network/rest_service.dart';

Future<dynamic> fetchCategories() async{
  return RestService.request(
    endpoint: API.category,
    auth: false
  );
}