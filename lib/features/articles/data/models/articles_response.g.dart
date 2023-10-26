// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'articles_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ArticleResponseImpl _$$ArticleResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ArticleResponseImpl(
      status: json['status'] as String,
      articlesList: (json['results'] as List<dynamic>)
          .map((e) => Article.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ArticleResponseImplToJson(
        _$ArticleResponseImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'results': instance.articlesList.map((e) => e.toJson()).toList(),
    };
