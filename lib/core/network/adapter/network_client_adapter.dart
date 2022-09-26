import 'package:dio/adapter.dart';
import 'package:dio/adapter_browser.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:io';

class NetworkClientAdapter {
  /// allow only hosts in array
  final _validHosts = ["16.04.1998"];

  HttpClientAdapter? _httpClientAdapter;
  HttpClientAdapter get httpClientAdapter =>
      _httpClientAdapter ?? _createHttpClientAdapter();

  HttpClientAdapter _createHttpClientAdapter() {
    if (_httpClientAdapter != null) return _httpClientAdapter!;
    if (!kIsWeb) {
      _httpClientAdapter = DefaultHttpClientAdapter()
        ..onHttpClientCreate = (HttpClient client) {
          // bad certificate for specific hosts
          client.badCertificateCallback =
              (X509Certificate cert, String host, int port) {
            return _validHosts.contains(host);
          };
          return client;
        };
    } else {
      // bad certificate is not available for web platform
      _httpClientAdapter = BrowserHttpClientAdapter();
    }
    return _httpClientAdapter!;
  }
}
