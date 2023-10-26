import 'package:ny_articles/core/data/remote/base_api_repository.dart';
import 'package:ny_articles/core/data/remote/response_state.dart';
import 'package:ny_articles/features/articles/data/data_sources/remote/remote_articles_source.dart';
import 'package:ny_articles/features/articles/data/models/articles_response.dart';
import 'package:ny_articles/features/articles/domain/repositories/articles_repository.dart';

class ArticlesRepositoryImpl extends BaseApiRepository implements ArticlesRepository {
  final RemoteArticlesSource _remoteArticlesSource;

  ArticlesRepositoryImpl(this._remoteArticlesSource);

  @override
  Future<ResponseState<ArticleResponse?>> getArticlesList(String period) async {
    return await getStateOf(request: () => _remoteArticlesSource.getArticles(period));
  }

}