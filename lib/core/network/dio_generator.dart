import 'package:dio/dio.dart';
import 'package:dio_http2_adapter/dio_http2_adapter.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioGenerator {
  static const _baseUrlSample = "https://jsonplaceholder.typicode.com";
  static const _baseUrl = "https://jsonplaceholder.typicode.com";

  static Dio defaultDio = Dio()
    ..options.baseUrl = _baseUrl
    ..options.connectTimeout = 30000
    ..options.receiveTimeout = 30000
    ..httpClientAdapter = _http2adapter
    ..interceptors.add(_prettyInterceptor);

  static Dio sampleDio = Dio()
    ..options.baseUrl = _baseUrlSample
    ..options.connectTimeout = 30000
    ..options.receiveTimeout = 30000
    ..httpClientAdapter = _http2adapter;
    // ..interceptors.add(_prettyInterceptor);

  static final Interceptor _prettyInterceptor = PrettyDioLogger(
    requestHeader: true,
    requestBody: true,
    responseBody: true,
    responseHeader: false,
    error: true,
    compact: true,
    maxWidth: 90,
  );

  static final Http2Adapter _http2adapter = Http2Adapter(
    ConnectionManager(
      idleTimeout: 15000,
      onClientCreate: (_, config) => config.onBadCertificate = (_) => true,
    ),
  );
}
