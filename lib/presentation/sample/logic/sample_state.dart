import 'package:base_flutter/presentation/sample/models/sample_ui_data.dart';
import 'package:equatable/equatable.dart';

enum SampleStatus { initial, loading, success, failure }

class SampleState extends Equatable {
  const SampleState({
    this.status = SampleStatus.initial,
    this.samples = const [],
    this.errorMessage = "Unknown error :(",
  });

  final SampleStatus status;
  final List<SampleUiData> samples;
  final String errorMessage;

  @override
  List<Object?> get props => [status, samples, errorMessage];
}
