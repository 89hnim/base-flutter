import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioGenerator {
  static const _baseUrlSample = "https://jsonplaceholder.typicode.com";
  static const _baseUrl = "https://jsonplaceholder.typicode.com";

  static Dio defaultDio = Dio()
    ..options.baseUrl = _baseUrl
    ..options.connectTimeout = 30000
    ..options.receiveTimeout = 30000
    ..interceptors.add(_prettyInterceptor);

  static Dio sampleDio = Dio()
    ..options.baseUrl = _baseUrlSample
    ..options.connectTimeout = 30000
    ..options.receiveTimeout = 30000;

  static final Interceptor _prettyInterceptor = PrettyDioLogger(
    requestHeader: true,
    requestBody: true,
    responseBody: true,
    responseHeader: false,
    error: true,
    compact: true,
    maxWidth: 90,
  );

}
