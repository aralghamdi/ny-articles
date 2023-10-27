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
  String _articlesPeriod = "1";
  bool isBusy = false;

  ArticlesBloc(this._getArticlesListUseCase) : super(ArticlesLoading()) {

    on<GetArticlesEvent>(_getArticlesEvent);

  }


  Future<void> _getArticlesEvent(GetArticlesEvent event, Emitter<ArticlesState> emit) async {
    if(isBusy) return;

    isBusy = true;

    emit(ArticlesLoading());
    _articlesPeriod = event.period ?? _articlesPeriod;
    var response = await _getArticlesListUseCase.call(period: _articlesPeriod);
    if(response is ResponseSuccess){
      _articlesList.addAll(response.data?.articlesList ?? []);
      emit(ArticlesSuccess(_articlesList, _articlesPeriod));
    } else {
      emit(ArticlesError(response.errorMessage));
    }
    isBusy = false;
  }

}
