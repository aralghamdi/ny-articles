import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:ny_articles/core/data/remote/dio_client.dart';
import 'package:ny_articles/features/articles/di.dart';
import 'package:ny_articles/utils/constants.dart';

final di = GetIt.instance;

Future<void> initDI() async {
  final dio = initDio(dotenv.get(baseurl));
  di.registerSingleton<Dio>(dio);

  await initArticlesDI();
}