import 'dart:convert';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:ny_articles/core/data/remote/response_state.dart';
import 'package:ny_articles/features/articles/data/models/articles_response.dart';
import 'package:ny_articles/features/articles/domain/use_cases/get_articles_list_use_case.dart';
import 'package:ny_articles/features/articles/presentation/bloc/articles_bloc.dart';
import 'package:ny_articles/features/articles/presentation/widgets/articles_list_widget.dart';
import 'package:ny_articles/features/articles/presentation/widgets/empty_articles_state_widget.dart';
import 'package:ny_articles/features/articles/presentation/widgets/error_articles_state_widget.dart';
import 'package:ny_articles/features/articles/presentation/widgets/loading_articles_sate_widget.dart';
import 'package:ny_articles/main.dart';

import '../../../../fixtures/fixture_reader.dart';
import '../bloc/articles_bloc_test.mocks.dart';


class MockArticles extends MockBloc<ArticlesEvent, ArticlesState> implements ArticlesBloc {}


void main() {
  late MockArticles articlesBloc;
  late GetArticlesListUseCase getArticlesListUseCase;
  final response = json.decode(fixture("success_articles_response.json"));
  const String period = "1";
  const String errorMessage = "error";
  final articlesResponse =  ArticleResponse.fromJson(json.decode(fixture("success_articles_response.json")));
  final successResponse = ResponseSuccess<ArticleResponse?>(articlesResponse, response);
  const errorResponse = ResponseFailed<ArticleResponse?>(errorMessage);
  final articlesList = articlesResponse.articlesList;
  final articlesSections = articlesList.map((e) => e.section).toSet().toList();

  Widget makeTestableWidget() {
    return BlocProvider<ArticlesBloc>(
      create: (context) => articlesBloc,
      child: const MyApp(),
    );
  }

  setUp((){
    getArticlesListUseCase = MockGetArticlesListUseCase();
    articlesBloc = MockArticles();
  });




  testWidgets('when ArticlesScreen is initialized expect LoadingArticlesStateWidget is present', (tester) async {

    when(getArticlesListUseCase.call(period: period)).thenAnswer((realInvocation) async => successResponse);
    whenListen(articlesBloc, Stream.value(ArticlesLoading()), initialState: ArticlesLoading());

    await tester.pumpWidget(makeTestableWidget());
    await tester.pump();

    final widgetFinder = find.byType(const LoadingArticlesStateWidget().runtimeType);

    expect(widgetFinder, findsOneWidget);
  });




  testWidgets('when getArticlesListUseCase receive success expect ArticlesListWidget is present', (tester) async {

    when(getArticlesListUseCase.call(period: period)).thenAnswer((realInvocation) async => successResponse);
    whenListen(articlesBloc, Stream.value(ArticlesSuccess(articlesList, articlesSections, period)), initialState: ArticlesLoading());

    await tester.pumpWidget(makeTestableWidget());
    await tester.pumpAndSettle();

    final widgetFinder = find.byType(ArticlesListWidget(articlesList: articlesList).runtimeType);

    expect(widgetFinder, findsOneWidget);
  });




  testWidgets('when getArticlesListUseCase receive success and empty articles list expect ArticlesListWidget is present', (tester) async {

    when(getArticlesListUseCase.call(period: period)).thenAnswer((realInvocation) async => successResponse);
    whenListen(articlesBloc, Stream.value(ArticlesSuccess(articlesResponse.copyWith(articlesList: []).articlesList, articlesSections, period)), initialState: ArticlesLoading());

    await tester.pumpWidget(makeTestableWidget());
    await tester.pumpAndSettle();

    final widgetFinder = find.byType(const EmptyArticlesState().runtimeType);

    expect(widgetFinder, findsOneWidget);
  });



  testWidgets('when getArticlesListUseCase receive error expect ErrorArticlesStateWidget is present', (tester) async {

    when(getArticlesListUseCase.call(period: period)).thenAnswer((realInvocation) async => errorResponse);
    whenListen(articlesBloc, Stream.value(const ArticlesError(errorMessage)), initialState: ArticlesLoading());

    await tester.pumpWidget(makeTestableWidget());
    await tester.pumpAndSettle();

    final widgetFinder = find.byType(const ErrorArticlesStateWidget(errorMessage: errorMessage).runtimeType);

    expect(widgetFinder, findsOneWidget);
  });

}