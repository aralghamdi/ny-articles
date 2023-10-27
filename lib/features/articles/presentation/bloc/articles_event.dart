part of 'articles_bloc.dart';

abstract class ArticlesEvent extends Equatable {
  const ArticlesEvent();

  @override
  List<Object?> get props => [];
}

class GetArticlesEvent extends ArticlesEvent {
  final String? period;
  const GetArticlesEvent({this.period});

  @override
  List<Object?> get props => [period];
}


class FilterArticlesEvent extends ArticlesEvent {
  final String section;
  const FilterArticlesEvent(this.section);

  @override
  List<Object?> get props => [section];
}