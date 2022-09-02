import 'package:drb/network/API.dart';
import 'package:drb/network/rest_service.dart';

Future<dynamic> fetchBrands() async{
  return RestService.request(
      endpoint: API.brand,
      auth: false
  );
}