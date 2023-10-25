// ignore_for_file: invalid_annotation_target
import 'package:collection/collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'article.freezed.dart';
part 'article.g.dart';

@freezed
class Article with _$Article{

  const factory Article(
      {required int id,
        required String url,
        required String source,
        @JsonKey(name: "published_date")
        required DateTime publishedDate,
        required String section,
        required String subsection,
        required String title,
        required String abstract,
        @JsonKey(name: "media", fromJson: _mapImage)
        required String image}) = _Article;

  factory Article.fromJson(Map<String, dynamic> json) => _$ArticleFromJson(json);

}

String _mapImage(List<Map<String, dynamic>> media){
  if(media.isNotEmpty && (media.first['media-metadata']?.isNotEmpty ?? false)){
    List<Map<String, dynamic>> metaDate = media.first['media-metadata'];
    return metaDate.firstWhereOrNull((element) => element['format'] == 'mediumThreeByTwo440')?['url'] ?? "";
  }
  return "";
}