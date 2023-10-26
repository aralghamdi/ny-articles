part of 'articles_bloc.dart';

abstract class ArticlesState extends Equatable {
  const ArticlesState();

  @override
  List<Object?> get props => [];
}

class ArticlesLoading extends ArticlesState {}

class ArticlesSuccess extends ArticlesState {
  final List<Article> articlesList;
  const ArticlesSuccess(this.articlesList);

  @override
  List<Object?> get props => [articlesList];
}


class ArticlesError extends ArticlesState {
  final String? errorMessage;
  const ArticlesError(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}


