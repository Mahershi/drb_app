import 'package:drb/network/API.dart';
import 'package:drb/network/rest_service.dart';

Future<void> fetchPopular({catId}) async {
  return RestService.request(
    endpoint: API.popular,
    queryParams: {
      'cat_id': catId
    }
  );
}

Future<void> fetchNew({catId}) async {
  return RestService.request(
      endpoint: API.new_,
      queryParams: {
        'cat_id': catId
      }
  );
}

Future<void> fetchStrong({catId}) async {
  return RestService.request(
      endpoint: API.strong,
      queryParams: {
        'cat_id': catId
      }
  );
}

Future<void> fetchOnSale({catId}) async {
  return RestService.request(
      endpoint: API.sale,
      queryParams: {
        'cat_id': catId
      }
  );
}