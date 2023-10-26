import 'package:dio/dio.dart';
import 'package:ny_articles/features/articles/data/models/articles_response.dart';
import 'package:retrofit/retrofit.dart';
part 'remote_articles_source.g.dart';

@RestApi()
abstract class RemoteArticlesSource {
  factory RemoteArticlesSource(Dio dio, {String baseUrl}) = _RemoteArticlesSource;

  @GET("/svc/mostpopular/v2/mostviewed/all-sections/{period}.json")
  Future<HttpResponse<ArticleResponse?>> getArticles(@Path() String period);
}