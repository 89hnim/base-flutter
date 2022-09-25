import 'package:base_flutter/utils/json_ext.dart';
import 'package:dio/dio.dart';
import 'package:base_flutter/core/network/dio_generator.dart';
import 'package:base_flutter/data/dataproviders/network/models/sample_dto.dart';

class SampleApiClient {
  SampleApiClient({Dio? dio}) : _dio = dio ?? DioGenerator.sampleDio;

  final Dio _dio;

  /// fetch & parse json in background
  /// should use only if large json, because compute() cost too
  Future<List<SampleDto>> fetchCompute() async {
    final Response<String> response = await _dio.request("/photos");
    return JsonExtensions.parseObjectsCompute<SampleDto>(
      JsonParser(
        responseBody: response.data.toString(),
        fromJson: (json) => SampleDto.fromJson(json),
      ),
    );
  }

  Future<List<SampleDto>> fetch() async {
    final Response<String> response = await _dio.request("/photos");
    return JsonExtensions.parseObjects<SampleDto>(
      JsonParser(
        responseBody: response.data.toString(),
        fromJson: (json) => SampleDto.fromJson(json),
      ),
    );
  }

}
