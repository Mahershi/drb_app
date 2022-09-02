import 'package:drb/network/rest_service.dart';

import '../network/API.dart';



Future<dynamic> fetchStores() async{
  return RestService.request(
      endpoint: API.stores,
      auth: false
  );
}


Future<dynamic> fetchParameters() async{
  return RestService.request(
    endpoint: API.parameters,
    auth: false
  );
}

Future<dynamic> fetchDiscounts() async{
  return RestService.request(endpoint: API.discount, auth: false);
}