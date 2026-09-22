import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(
      RequestOptions options,
      RequestInterceptorHandler handler,
      ) {
    options.headers.addAll({
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    });

    debugPrint('┌──────────────── API REQUEST ────────────────');
    debugPrint('│ ${options.method} ${options.uri}');
    debugPrint('│ Headers: ${options.headers}');

    if (options.queryParameters.isNotEmpty) {
      debugPrint('│ Query: ${options.queryParameters}');
    }

    if (options.data != null) {
      debugPrint('│ Body: ${options.data}');
    }

    debugPrint('└─────────────────────────────────────────────');

    handler.next(options);
  }

  @override
  void onResponse(
      Response response,
      ResponseInterceptorHandler handler,
      ) {
    debugPrint('┌──────────────── API RESPONSE ───────────────');
    debugPrint(
      '│ ${response.requestOptions.method} '
          '${response.requestOptions.uri}',
    );
    debugPrint('│ Status: ${response.statusCode}');
    // debugPrint('│ Data: ${response.data}');
    debugPrint('└─────────────────────────────────────────────');

    handler.next(response);
  }

  @override
  void onError(
      DioException err,
      ErrorInterceptorHandler handler,
      ) {
    debugPrint('┌──────────────── API ERROR ──────────────────');
    debugPrint(
      '│ ${err.requestOptions.method} '
          '${err.requestOptions.uri}',
    );
    debugPrint('│ Error: ${err.message}');
    debugPrint('│ Status: ${err.response?.statusCode}');
    debugPrint('│ Response: ${err.response?.data}');
    debugPrint('└─────────────────────────────────────────────');

    handler.next(err);
  }
}