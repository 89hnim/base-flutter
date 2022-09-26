import 'package:base_flutter/core/network/interceptor/network_interceptor_data_provider.dart';
import 'package:dio/dio.dart';

class NetworkInterceptor extends InterceptorsWrapper {
  NetworkInterceptor({NetworkInterceptorDataProvider? provider})
      : _provider = provider ?? NetworkInterceptorDataProvider();

  final NetworkInterceptorDataProvider _provider;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers["Authorization"] = _provider.accessToken;
    return super.onRequest(options, handler);
  }
}
