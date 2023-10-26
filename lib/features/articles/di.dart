import 'package:dio/dio.dart';
import 'package:ny_articles/core/di.dart';
import 'package:ny_articles/features/articles/data/data_sources/remote/remote_articles_source.dart';
import 'package:ny_articles/features/articles/data/repositories/articles_repository_impl.dart';
import 'package:ny_articles/features/articles/domain/repositories/articles_repository.dart';
import 'package:ny_articles/features/articles/domain/use_cases/get_articles_list_use_case.dart';

Future<void> initArticlesDI() async {
  di.registerLazySingleton<RemoteArticlesSource>(()=> RemoteArticlesSource(di<Dio>()));
  di.registerLazySingleton<ArticlesRepository>(()=> ArticlesRepositoryImpl(di<RemoteArticlesSource>()));
  di.registerLazySingleton<GetArticlesListUseCase>(()=> GetArticlesListUseCase(di<ArticlesRepository>()));
}