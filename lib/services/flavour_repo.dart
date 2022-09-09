import 'package:drb/network/API.dart';
import 'package:drb/network/rest_service.dart';
import 'package:drb/utilities/global_vars.dart';

Future<dynamic> fetchDisposableFlavours({productId, storeId}) async {
  return RestService.request(
    endpoint: API.disposable,
    queryParams: {
      'product': productId,
      'store': storeId
    },
    auth: false
  );
}

Future<dynamic> fetchPodFlavour({productId, storeId}) async {
  return RestService.request(
      endpoint: API.juice,
      queryParams: {
        'product': productId,
        'store': storeId
      },
      auth: false
  );
}

Future<dynamic> fetchJuiceFlavour({productId, storeId}) async {
  return RestService.request(
      endpoint: API.juice,
      queryParams: {
        'product': productId,
        'store': storeId
      },
      auth: false
  );
}

Future<dynamic> fetchDisposable({flavourId}) async{
  print("Fetch DISPO");
  return RestService.request(
    endpoint: API.get_disposable,
    queryParams: {
      'flavour': flavourId,
      'store': GlobalVars.currentStore!.id
    }
  );
}

Future<dynamic> fetchPod({flavourId}) async{
  return RestService.request(
      endpoint: API.get_pod,
      queryParams: {
        'flavour': flavourId,
        'store': GlobalVars.currentStore!.id
      }
  );
}

Future<dynamic> fetchJuice({flavourId}) async{
  print("Fetcg juice");
  return RestService.request(
      endpoint: API.get_juice,
      queryParams: {
        'flavour': flavourId,
        'store': GlobalVars.currentStore!.id
      }
  );
}