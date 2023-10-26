import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ny_articles/core/data/remote/response_state.dart';
import 'package:ny_articles/features/articles/domain/entities/article.dart';
import 'package:ny_articles/features/articles/domain/use_cases/get_articles_list_use_case.dart';

part 'articles_event.dart';
part 'articles_state.dart';

class ArticlesBloc extends Bloc<ArticlesEvent, ArticlesState> {
  final GetArticlesListUseCase _getArticlesListUseCase;
  final List<Article> _articlesList = [];

  ArticlesBloc(this._getArticlesListUseCase) : super(ArticlesLoading()) {

    on<GetArticlesEvent>(_getArticlesEvent);

  }


  Future<void> _getArticlesEvent(GetArticlesEvent event, Emitter<ArticlesState> emit) async {
    emit(ArticlesLoading());
    var response = await _getArticlesListUseCase.call(period: event.period);
    if(response is ResponseSuccess){
      _articlesList.addAll(response.data?.articlesList ?? []);
      emit(ArticlesSuccess(_articlesList));
    } else {
      emit(ArticlesError(response.errorMessage));
    }
  }

}
