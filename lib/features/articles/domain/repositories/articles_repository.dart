import 'package:ny_articles/core/data/remote/response_state.dart';
import 'package:ny_articles/features/articles/data/models/articles_response.dart';

abstract class ArticlesRepository {

Future<ResponseState<ArticleResponse?>> getArticlesList(String period);

}