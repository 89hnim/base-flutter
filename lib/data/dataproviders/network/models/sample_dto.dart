import 'package:json_annotation/json_annotation.dart';
import 'package:base_flutter/data/models/sample_model.dart';
import 'package:base_flutter/utils/string_ext.dart';

part 'sample_dto.g.dart';

@JsonSerializable()
class SampleDto {
  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'albumId')
  final int? albumId;
  // @JsonKey(name: 'title')
  // final String? title;
  // @JsonKey(name: 'url')
  // final String? url;
  // @JsonKey(name: 'thumbnailUrl')
  // final String? thumbnailUrl;

  SampleDto({
    this.id,
    this.albumId,
  });

  factory SampleDto.fromJson(Map<String, dynamic> json) =>
      _$SampleDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SampleDtoToJson(this);
}

extension _Mapper on SampleDto {
  SampleModel? mapToModel() {
    if (id == null || albumId == null) return null;
    return SampleModel(
      id: id!,
      albumId: albumId!,
      title: "title.orEmpty()",
      url: "url.orEmpty()",
      thumbnailUrl: "thumbnailUrl.orEmpty()",
    );
  }
}

extension ListMapper on List<SampleDto> {
  List<SampleModel> mapToModel() {
    return map((e) => e.mapToModel()).whereType<SampleModel>().toList();
  }
}
