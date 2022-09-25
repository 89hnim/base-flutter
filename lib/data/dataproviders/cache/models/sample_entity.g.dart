// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sample_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SampleEntity _$SampleEntityFromJson(Map<String, dynamic> json) => SampleEntity(
      id: json['id'] as int?,
      albumId: json['albumId'] as int?,
      title: json['title'] as String?,
      url: json['url'] as String?,
      thumbnailUrl: json['thumbnailUrl'] as String?,
    );

Map<String, dynamic> _$SampleEntityToJson(SampleEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'albumId': instance.albumId,
      'title': instance.title,
      'url': instance.url,
      'thumbnailUrl': instance.thumbnailUrl,
    };
