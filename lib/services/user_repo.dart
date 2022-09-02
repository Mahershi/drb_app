import 'package:drb/network/API.dart';
import 'package:drb/network/rest_service.dart';

Future<dynamic> login({username, password}) async{
  return RestService.request(
    endpoint: API.login,
    auth: false,
    method: 'POST',
    data: {
      'username': username,
      'password': password
    }
  );
}