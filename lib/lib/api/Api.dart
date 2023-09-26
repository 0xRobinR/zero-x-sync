import 'package:dio/dio.dart';
import 'package:wallet/config/endpoints.dart';

class Api {
  static Dio dio() {
    BaseOptions options = BaseOptions(
      baseUrl: endpointURL,
      headers: {
        "Accept": "application/json",
        'Content-type': 'application/json'
      },
    );

    var _dio = Dio(options);
    return _dio;
  }
}