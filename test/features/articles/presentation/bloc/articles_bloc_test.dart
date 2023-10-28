import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:ny_articles/core/data/remote/response_state.dart';
import 'package:ny_articles/features/articles/data/models/articles_response.dart';
import 'package:ny_articles/features/articles/domain/use_cases/get_articles_list_use_case.dart';
import 'package:ny_articles/features/articles/presentation/bloc/articles_bloc.dart';

import '../../../../fixtures/fixture_reader.dart';
import 'articles_bloc_test.mocks.dart';

@GenerateNiceMocks([MockSpec<GetArticlesListUseCase>()])
void main() {
  late ArticlesBloc articlesBloc;
  late GetArticlesListUseCase getArticlesListUseCase;
  final response = json.decode(fixture("success_articles_response.json"));
  const String period = "1";
  const String errorMessage = "error";
  const String selectedSection = "World";
  final articlesResponse =  ArticleResponse.fromJson(json.decode(fixture("success_articles_response.json")));
  final successResponse = ResponseSuccess<ArticleResponse?>(articlesResponse, response);
  const errorResponse = ResponseFailed<ArticleResponse?>(errorMessage);
  final articlesList = articlesResponse.articlesList;
  final articlesSections = articlesList.map((e) => e.section).toSet().toList();
  final filteredArticles = articlesList.where((element) => element.section == selectedSection).toList();



    setUp((){
       getArticlesListUseCase = MockGetArticlesListUseCase();
       articlesBloc = ArticlesBloc(getArticlesListUseCase);
    });

    blocTest<ArticlesBloc, ArticlesState>(
      'when GetArticlesEvent is added and getArticlesListUseCase() receive success'
      'expect ArticlesLoading() and ArticlesSuccess() with articlesList, articlesSections and period',
      setUp: (){
        when(getArticlesListUseCase.call(period: period)).thenAnswer((realInvocation) async => successResponse);
      },
      build: () => articlesBloc,
      act: (bloc) {
        bloc.add(const GetArticlesEvent(period: period));
      },
      expect: () => <ArticlesState>[
        ArticlesLoading(),
        ArticlesSuccess(articlesList, articlesSections, period)
      ],
      verify: (bloc) {
        verify(getArticlesListUseCase.call(period: period));
      }
    );



  blocTest<ArticlesBloc, ArticlesState>(
    'when GetArticlesEvent is added and getArticlesListUseCase() receive error'
    'expect ArticlesLoading() and ArticlesError() with error message',
    setUp: (){
      when(getArticlesListUseCase.call(period: period)).thenAnswer((realInvocation) async => errorResponse);
    },
    build: () => articlesBloc,
    act: (bloc) {
      bloc.add(const GetArticlesEvent(period: period));
    },
    expect: () => <ArticlesState>[
      ArticlesLoading(),
      const ArticlesError(errorMessage)
    ],
    verify: (bloc) {
        verify(getArticlesListUseCase.call(period: period));
    }
  );


  blocTest<ArticlesBloc, ArticlesState>(
    'when FilterArticlesEvent is added'
    'expect ArticlesSuccess() with filtered articles list and selected section',
    setUp: (){
      when(getArticlesListUseCase.call(period: period)).thenAnswer((realInvocation) async => successResponse);
      articlesBloc.add(const GetArticlesEvent(period: period));
    },
    build: () => articlesBloc,
    act: (bloc) {
      bloc.add(const FilterArticlesEvent(selectedSection));
    },
    expect: () => <ArticlesState>[
       ArticlesSuccess(filteredArticles, articlesSections, period, selectedSection: selectedSection)
    ],
    skip: 1
  );
}