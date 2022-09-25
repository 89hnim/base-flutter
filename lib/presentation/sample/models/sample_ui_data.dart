import 'package:equatable/equatable.dart';

class SampleUiData extends Equatable{
  final String thumbnailUrl;

  const SampleUiData({
    required this.thumbnailUrl,
  });

  @override
  List<Object?> get props => [thumbnailUrl];
}
