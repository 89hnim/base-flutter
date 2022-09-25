import 'package:base_flutter/data/dataproviders/cache/models/sample_entity.dart';
import 'package:base_flutter/data/dataproviders/cache/storage/sample_cache.dart';
import 'package:base_flutter/data/dataproviders/network/apis/sample_api_client.dart';
import 'package:base_flutter/data/dataproviders/network/exceptions/default_exception_handler.dart';
import 'package:base_flutter/data/dataproviders/network/exceptions/exception_handler.dart';
import 'package:base_flutter/data/dataproviders/network/models/sample_dto.dart';
import 'package:base_flutter/data/models/sample_model.dart';
import 'package:base_flutter/utils/result.dart';

class SampleRepository {
  SampleRepository({
    SampleApiClient? sampleApiClient,
    SampleCache? sampleCache,
    ExceptionHandler? exceptionHandler,
  })  : _sampleApiClient = sampleApiClient ?? SampleApiClient(),
        _sampleCache = sampleCache ?? SampleCache(),
        _exceptionHandler = exceptionHandler ?? DefaultExceptionHandler();

  final SampleApiClient _sampleApiClient;
  final SampleCache _sampleCache;
  final ExceptionHandler _exceptionHandler;

  Future<Result<List<SampleModel>>> fetch() async {
    return Result.guardFuture(
      () async => (await _sampleApiClient.fetchCompute()).mapToModel(),
      _exceptionHandler,
    );
  }

  Future<Result<List<SampleModel>>> fetchWithCache() async {
    return Result.guardFuture(
          () async {
            var cached = await _sampleCache.getSamples();
            // return cached
            if (cached.isNotEmpty) {
              return cached.mapToModel();
            }
            // if not cached yet, fetch new data
            var response = await _sampleApiClient.fetchCompute();
            var models = response.mapToModel();
            // save cache
            await _sampleCache.saveSamples(models.mapToEntity());
            // return result
            return models;
          },
      _exceptionHandler,
    );
  }

}
