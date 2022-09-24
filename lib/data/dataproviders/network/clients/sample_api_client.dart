import 'dart:convert';
import 'package:base_flutter/utils/string_ext.dart';
import 'package:base_flutter/utils/json_ext.dart';
import 'package:dio/dio.dart';
import 'package:base_flutter/core/network/dio_generator.dart';
import 'package:base_flutter/data/dataproviders/network/models/sample_dto.dart';
import 'package:flutter/foundation.dart';

// https://docs.flutter.dev/cookbook/networking/background-parsing
// still lagging
List<SampleDto> parsePhotos(String responseBody) {
  print("parsing $responseBody");
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  print("parsed ${jsonDecode(responseBody)}");
  return parsed.map<SampleDto>((json) => SampleDto.fromJson(json)).toList();
}

class SampleApiClient {
  SampleApiClient({Dio? dio}) : _dio = dio ?? DioGenerator.sampleDio;

  final Dio _dio;

  Future<List<SampleDto>> fetch() async {
    final Response<String> response = await _dio.request("/photos");
    // return JsonExtensions.parseObjectsCompute<SampleDto>(
    //   JsonParser(
    //     responseBody: response.data.toString(),
    //     fromJson: (json) => SampleDto.fromJson(json),
    //   ),
    // );
    return compute(parsePhotos, response.data.toString());
  }
}
