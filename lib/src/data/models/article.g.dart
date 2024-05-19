// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ArticleImpl _$$ArticleImplFromJson(Map<String, dynamic> json) =>
    _$ArticleImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      content: json['content'] as String,
      flagPath: json['flagPath'] as String,
      country: json['country'] as String,
      link: json['link'] as String?,
      linkName: json['linkName'] as String?,
    );

Map<String, dynamic> _$$ArticleImplToJson(_$ArticleImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'flagPath': instance.flagPath,
      'country': instance.country,
      'link': instance.link,
      'linkName': instance.linkName,
    };
