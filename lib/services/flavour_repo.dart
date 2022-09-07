import 'package:drb/network/API.dart';
import 'package:drb/network/rest_service.dart';

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
      endpoint: API.pod,
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