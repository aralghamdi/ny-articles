import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:ny_articles/core/data/remote/response_state.dart';
import 'package:ny_articles/features/articles/data/models/articles_response.dart';
import 'package:ny_articles/features/articles/domain/repositories/articles_repository.dart';
import 'package:ny_articles/features/articles/domain/use_cases/get_articles_list_use_case.dart';

import '../../../../fixtures/fixture_reader.dart';
import 'get_articles_list_use_case_test.mocks.dart';



@GenerateNiceMocks([MockSpec<ArticlesRepository>()])
void main() {
  late GetArticlesListUseCase getArticlesListUseCase;
  late ArticlesRepository articlesRepository;

  setUp(() {
    articlesRepository = MockArticlesRepository();
    getArticlesListUseCase = GetArticlesListUseCase(articlesRepository);
  });


  test('when getArticlesList() receives success expect ResponseSuccess of type ArticleResponse?', () async {
    final response = json.decode(fixture("success_articles_response.json"));
    final articlesResponse =  ArticleResponse.fromJson(json.decode(fixture("success_articles_response.json")));
    final successResponse = ResponseSuccess<ArticleResponse?>(articlesResponse, response);
    when(articlesRepository.getArticlesList("1")).thenAnswer((realInvocation) async => successResponse);

    final result = await getArticlesListUseCase.call(period: "1");

    verify(articlesRepository.getArticlesList("1"));
    expect(result, successResponse);
  });


  test('when getArticlesList() receives error expect ResponseFailed of type ArticleResponse?', () async {
    const errorResponse = ResponseFailed<ArticleResponse?>("error");
    when(articlesRepository.getArticlesList("1")).thenAnswer((realInvocation) async => errorResponse);

    final result = await getArticlesListUseCase.call(period: "1");

    verify(articlesRepository.getArticlesList("1"));
    expect(result, errorResponse);
  });
}
