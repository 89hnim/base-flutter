import 'package:base_flutter/data/repositories/sample_repository.dart';
import 'package:base_flutter/presentation/sample/logic/sample_event.dart';
import 'package:base_flutter/presentation/sample/logic/sample_state.dart';
import 'package:base_flutter/utils/list_ext.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SampleBloc extends Bloc<SampleEvent, SampleState> {
  SampleBloc(this._sampleRepository) : super(SampleState()) {
    on<SampleRequestDataEvent>(_onSampleRequestData);
    on<SampleClearRequestedDataEvent>(_onSampleClearRequestedDataEvent);
    on<SampleForceRequestDataFailEvent>(_onSampleForceRequestDataFailEvent);
  }

  final SampleRepository _sampleRepository;

  void _onSampleRequestData(
    SampleRequestDataEvent event,
    Emitter<SampleState> emit,
  ) async {
    emit(SampleState(status: SampleStatus.loading));

    var result = await _sampleRepository.fetch();
    if (result.isSuccess) {
      emit(
        SampleState(
            status: SampleStatus.success, samples: result.data.orEmpty()),
      );
    } else {
      emit(
        SampleState(
          status: SampleStatus.failure,
          errorMessage: result.error?.toString() ?? "Unknown exception",
        ),
      );
    }
  }

  void _onSampleClearRequestedDataEvent(
    SampleClearRequestedDataEvent event,
    Emitter<SampleState> emit,
  ) {
    /// delete all records by emitting success state with empty data
    emit(SampleState(status: SampleStatus.success));
  }

  void _onSampleForceRequestDataFailEvent(
      SampleForceRequestDataFailEvent event,
      Emitter<SampleState> emit,
      ) {
    emit(SampleState(status: SampleStatus.failure, errorMessage: "Force to fail"));
  }
}
