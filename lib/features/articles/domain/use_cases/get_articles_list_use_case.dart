import 'package:ny_articles/core/data/remote/response_state.dart';
import 'package:ny_articles/features/articles/data/models/articles_response.dart';
import 'package:ny_articles/features/articles/domain/repositories/articles_repository.dart';

class GetArticlesListUseCase {
  final ArticlesRepository _articlesRepository;

  GetArticlesListUseCase(this._articlesRepository);

  Future<ResponseState<ArticleResponse?>> call({required String period}) async {
    return await _articlesRepository.getArticlesList(period);
  }
}