import 'package:base_flutter/data/models/sample_model.dart';
import 'package:base_flutter/utils/string_ext.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sample_entity.g.dart';

@JsonSerializable()
class SampleEntity extends Equatable {
  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'albumId')
  final int? albumId;
  @JsonKey(name: 'title')
  final String? title;
  @JsonKey(name: 'url')
  final String? url;
  @JsonKey(name: 'thumbnailUrl')
  final String? thumbnailUrl;

  const SampleEntity(
      {this.id, this.albumId, this.title, this.url, this.thumbnailUrl});

  factory SampleEntity.fromJson(Map<String, dynamic> json) =>
      _$SampleEntityFromJson(json);

  Map<String, dynamic> toJson() => _$SampleEntityToJson(this);

  @override
  List<Object?> get props => [id, albumId, title, url, thumbnailUrl];
}

extension _Mapper on SampleEntity {
  SampleModel? mapToModel() {
    if (id == null || albumId == null) return null;
    return SampleModel(
      id: id!,
      albumId: albumId!,
      title: title.orEmpty(),
      url: url.orEmpty(),
      thumbnailUrl: thumbnailUrl.orEmpty(),
    );
  }
}

extension ListMapper on List<SampleEntity> {
  List<SampleModel> mapToModel() {
    return map((e) => e.mapToModel()).whereType<SampleModel>().toList();
  }
}
