// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ny_articles/features/articles/domain/entities/article.dart';
part 'articles_response.freezed.dart';
part 'articles_response.g.dart';

@freezed
class ArticleResponse with _$ArticleResponse{
  @JsonSerializable(explicitToJson: true)

  const factory ArticleResponse({
        required String status,
        @JsonKey(name: 'results')
        required List<Article> articlesList}) = _ArticleResponse;

  factory ArticleResponse.fromJson(Map<String, dynamic> json) => _$ArticleResponseFromJson(json);

}