import 'package:flutter/widgets.dart';

enum Environment { DEVELOPMENT, STAGING, PRODUCTION }
enum Device { IOS, ANDROID }

class Config {
  String environment;
  String baseUrl;

  Config({
    required this.environment,
    required this.baseUrl,
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
  static const api = 'app/';
  static const baseUrl = "http://192.168.1.200:8000/";

  static Config empty = Config(
      environment: 'development',
      baseUrl: baseUrl,
  );

  static Config development = Config(
    environment: 'development',
    baseUrl: '$baseUrl$api',
  );

  static Config staging = Config(
    environment: 'staging',
    baseUrl: 'https://bhavsarexpensemanager.herokuapp.com/$api',

  );

  static Config production = Config(
    environment: 'production',
    baseUrl: ''
  );
}
