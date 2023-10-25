// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ArticleImpl _$$ArticleImplFromJson(Map<String, dynamic> json) =>
    _$ArticleImpl(
      id: json['id'] as int,
      url: json['url'] as String,
      source: json['source'] as String,
      publishedDate: DateTime.parse(json['published_date'] as String),
      section: json['section'] as String,
      subsection: json['subsection'] as String,
      title: json['title'] as String,
      abstract: json['abstract'] as String,
      image: _mapImage(json['media'] as List<Map<String, dynamic>>),
    );

Map<String, dynamic> _$$ArticleImplToJson(_$ArticleImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'source': instance.source,
      'published_date': instance.publishedDate.toIso8601String(),
      'section': instance.section,
      'subsection': instance.subsection,
      'title': instance.title,
      'abstract': instance.abstract,
      'media': instance.image,
    };
