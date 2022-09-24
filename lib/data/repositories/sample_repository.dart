import 'package:base_flutter/data/dataproviders/network/clients/sample_api_client.dart';
import 'package:base_flutter/data/dataproviders/network/exceptions/default_exception_handler.dart';
import 'package:base_flutter/data/dataproviders/network/exceptions/exception_handler.dart';
import 'package:base_flutter/data/dataproviders/network/models/sample_dto.dart';
import 'package:base_flutter/data/models/sample_model.dart';
import 'package:base_flutter/utils/result.dart';

class SampleRepository {
  SampleRepository({
    SampleApiClient? sampleApiClient,
    ExceptionHandler? exceptionHandler,
  })  : _sampleApiClient = sampleApiClient ?? SampleApiClient(),
        _exceptionHandler = exceptionHandler ?? DefaultExceptionHandler();

  final SampleApiClient _sampleApiClient;
  final ExceptionHandler _exceptionHandler;

  Future<Result<List<SampleModel>>> fetch() async {
    return Result.guardFuture(
      () async => (await _sampleApiClient.fetch()).mapToModel(),
      _exceptionHandler,
    );
  }
}
