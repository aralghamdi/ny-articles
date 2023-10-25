import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

Dio initDio(String baseUrl){
  final dio = Dio()..options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 30));

  if(kDebugMode){
    dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
  }

  return dio;
}