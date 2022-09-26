import 'package:base_flutter/core/network/adapter/network_client_adapter.dart';
import 'package:base_flutter/core/network/interceptor/network_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  DioFactory._();

  static const _baseUrlSample = "https://jsonplaceholder.typicode.com";
  static const _baseUrl = "https://jsonplaceholder.typicode.com";

  static final _networkClientAdapter = NetworkClientAdapter();
  static final _networkInterceptor = NetworkInterceptor();
  static final Interceptor _prettyInterceptor = PrettyDioLogger(
    requestHeader: true,
    requestBody: true,
    responseBody: true,
    responseHeader: false,
    error: true,
    compact: true,
    maxWidth: 90,
  );

  static Dio defaultDio = Dio()
    ..options.baseUrl = _baseUrl
    ..options.connectTimeout = 30000
    ..options.receiveTimeout = 30000
    ..options.responseType = ResponseType.plain
    ..httpClientAdapter = _networkClientAdapter.httpClientAdapter
    ..interceptors.add(_networkInterceptor)
    ..interceptors.add(_prettyInterceptor);

  static Dio sampleDio = Dio()
    ..options.baseUrl = _baseUrlSample
    ..options.connectTimeout = 30000
    ..options.receiveTimeout = 30000
    ..options.responseType = ResponseType.plain
    ..httpClientAdapter = _networkClientAdapter.httpClientAdapter
    ..interceptors.add(_networkInterceptor)
    ..interceptors.add(_prettyInterceptor);
}
