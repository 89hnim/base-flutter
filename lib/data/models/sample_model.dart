import 'package:base_flutter/data/dataproviders/cache/models/sample_entity.dart';
import 'package:equatable/equatable.dart';

class SampleModel extends Equatable {
  final int id;
  final int albumId;
  final String title;
  final String url;
  final String thumbnailUrl;

  const SampleModel({
    required this.id,
    required this.albumId,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  @override
  List<Object?> get props => [id, albumId, title, url, thumbnailUrl];
}

extension _Mapper on SampleModel {
  SampleEntity? mapToEntity() {
    return SampleEntity(
      id: id,
      albumId: albumId,
      title: title,
      url: url,
      thumbnailUrl: thumbnailUrl,
    );
  }
}

extension ListMapper on List<SampleModel> {
  List<SampleEntity> mapToEntity() {
    return map((e) => e.mapToEntity()).whereType<SampleEntity>().toList();
  }
}
