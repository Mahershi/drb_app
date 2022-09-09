import 'package:drb/network/API.dart';
import 'package:drb/network/rest_service.dart';
import 'package:drb/utilities/global_vars.dart';

Future<dynamic> place_order({order_details}) async {
  return RestService.request(
    endpoint: API.place,
    method: 'POST',
    data: order_details,
    queryParams: {
      'store': GlobalVars.currentStore!.id!
    }
  );
}