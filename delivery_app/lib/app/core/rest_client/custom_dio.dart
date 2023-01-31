// ignore_for_file: depend_on_referenced_packages

import 'package:delivery_app/app/core/config/env/env.dart';
import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';

class CustomDio extends DioForNative {
  CustomDio()
      : super(BaseOptions(
          baseUrl: Env.i['URL_BACKEND'] ?? "",
          connectTimeout: 5000,
          receiveTimeout: 60000,
        )) {
    interceptors.add(LogInterceptor(requestBody: true, responseBody: true, requestHeader: true));
  }

  CustomDio auth() {
    options.headers = {
      "authorization": "Bearer dasfDHVdghsavds",
    };
    return this;
  }

  CustomDio unauth() {
    return this;
  }
}
