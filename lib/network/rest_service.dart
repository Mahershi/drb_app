import 'package:dio/dio.dart';

import '../app_config.dart';
import '../utilities/custom_trace.dart';


class RestService{
  static Dio? dio;
  static String baseUrl = AppConfig.config.baseUrl;

  static void init(){
    dio = Dio(
        BaseOptions(baseUrl: baseUrl)
    );
    dio!.interceptors.add(AppInterceptors());
  }

  static Future<dynamic> request(
      {
        required String endpoint,
        String method = 'GET',
        bool auth = false,
        Map<String, dynamic> queryParams = const {},
        dynamic data = const {},
        bool showLoader = false,
      }) async {
    try{
      String language = 'es';

      Options _cacheOptions = Options();
      _cacheOptions.method = method;
      _cacheOptions.headers = {
        'accept-language': language,
        'authrequired': auth
      };

      Response<dynamic> response = await dio!.request(
          '$endpoint',
          data: data,
          queryParameters: queryParams,
          options:_cacheOptions
      );

      var res = response.data;
      print(response.requestOptions.method);
      print(response.requestOptions.baseUrl + response.requestOptions.path);
      print(response.requestOptions.queryParameters);
      print(response.requestOptions.data.toString());
      print(res);
      return res;

    }catch(e){
      CustomTrace(StackTrace.current, message: e.toString());
      print("Error: " + e.toString());
    }

  }
}

class AppInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    super.onRequest(options, handler);
    if (options.headers['authrequired'] == true) {
      options.headers.remove("authrequired");
      options.headers.addAll({
        // 'Authorization': 'Token ' + userRepo.currentUser!.token!,
        // 'Access-Control-Allow-Origin': '*'
      });
    }else{
      options.headers.remove('authrequired');
    }
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print(response.headers);
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    print('ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');
    print(err.requestOptions.uri);
    print(err.requestOptions.queryParameters);
    print(err.requestOptions.data);
    super.onError(err, handler);
  }

}