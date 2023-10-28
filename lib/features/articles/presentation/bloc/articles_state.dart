part of 'articles_bloc.dart';

abstract class ArticlesState extends Equatable {
  const ArticlesState();

  @override
  List<Object?> get props => [];
}

class ArticlesLoading extends ArticlesState {}

class ArticlesSuccess extends ArticlesState {
  final List<Article> articlesList;
  final List<String> articlesSections;
  final String period;
  final String? selectedSection;
  const ArticlesSuccess(this.articlesList, this.articlesSections, this.period, {this.selectedSection});

  @override
  List<Object?> get props => [articlesList, articlesSections, period, selectedSection];

  ArticlesSuccess copyWith({
    List<Article>? articlesList,
    List<String>? articlesSections,
    String? period,
    String? selectedSection}){
    return ArticlesSuccess(
        articlesList ?? this.articlesList,
        articlesSections ?? this. articlesSections,
        period ?? this.period,
        selectedSection: selectedSection ?? this.selectedSection);
  }
}


class ArticlesError extends ArticlesState {
  final String? errorMessage;
  const ArticlesError(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}


