import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:ny_articles/utils/constants.dart';

Dio initDio(String baseUrl){
  final dio = Dio()..options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 30));

  dio.options.queryParameters.addAll({"api-key": dotenv.get(apiKey)});

  if(kDebugMode){
    dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
  }

  return dio;
}