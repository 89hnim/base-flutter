import 'package:base_flutter/utils/json_ext.dart';
import 'package:dio/dio.dart';
import 'package:base_flutter/core/network/dio_factory.dart';
import 'package:base_flutter/data/dataproviders/network/models/sample_dto.dart';

class SampleApiClient {
  SampleApiClient({Dio? dio}) : _dio = dio ?? DioFactory.sampleDio;

  final Dio _dio;

  /// fetch & parse json in background
  /// should use only if large json, because compute() cost too
  Future<List<SampleDto>> fetchCompute() async {
    final Response response = await _dio.request("/photos");
    return JsonExtensions.toObjectsCompute<SampleDto>(
      response.data.toString(),
      (json) => SampleDto.fromJson(json),
    );
  }

  Future<List<SampleDto>> fetch() async {
    final Response response = await _dio.request("/photos");
    return JsonExtensions.toObjects<SampleDto>(
      response.data.toString(),
      (json) => SampleDto.fromJson(json),
    );
  }
}
