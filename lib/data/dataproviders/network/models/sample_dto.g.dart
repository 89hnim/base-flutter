// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sample_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SampleDto _$SampleDtoFromJson(Map<String, dynamic> json) => SampleDto(
      id: json['id'] as int?,
      albumId: json['albumId'] as int?,
      title: json['title'] as String?,
      url: json['url'] as String?,
      thumbnailUrl: json['thumbnailUrl'] as String?,
    );

Map<String, dynamic> _$SampleDtoToJson(SampleDto instance) => <String, dynamic>{
      'id': instance.id,
      'albumId': instance.albumId,
      'title': instance.title,
      'url': instance.url,
      'thumbnailUrl': instance.thumbnailUrl,
    };
