import 'package:drb/network/API.dart';
import 'package:drb/network/rest_service.dart';
import 'package:drb/services/cart_service.dart';
import 'package:drb/utilities/global_vars.dart';

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

void logout(){
  GlobalVars.currentUser = null;
  MyCart.clearCart();
}