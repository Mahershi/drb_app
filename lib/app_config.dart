import 'package:flutter/widgets.dart';

enum Environment { DEVELOPMENT, STAGING, PRODUCTION }
enum Device { IOS, ANDROID }

class Config {
  String environment;
  String baseUrl;
  String apiUrl;

  Config({
    required this.environment,
    required this.baseUrl,
    required this.apiUrl
  });
}

class AppConfig {
  static Config config = _Config.empty;

  static void setEnvironment(Environment env) {
    switch (env) {
      case Environment.DEVELOPMENT:
        config = _Config.development;
        break;
      case Environment.STAGING:
        config = _Config.staging;
        break;
      case Environment.PRODUCTION:
        config = _Config.production;
        break;
    }
  }
}

class _Config {

  static const version = "1.0.0";
  static const api = '/app';
  static const baseUrl = "http://172.16.1.102:9999";


  static Config empty = Config(
      environment: 'development',
      baseUrl: '',
    apiUrl: ''
  );

  static Config development = Config(
    environment: 'development',
    baseUrl: baseUrl,
    apiUrl: '$baseUrl$api',
  );

  static Config staging = Config(
    environment: 'staging',
    apiUrl: 'https://bhavsarexpensemanager.herokuapp.com/$api',
    baseUrl: baseUrl

  );

  static Config production = Config(
    environment: 'production',
    baseUrl: '',
    apiUrl: ''
  );
}
