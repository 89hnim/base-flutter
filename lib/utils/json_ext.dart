import 'dart:convert';

import 'package:flutter/foundation.dart';

class JsonExtensions {
  /// parse json object
  /// not tested yet.
  static T parseObject<T>(JsonParser parser) {
    final parsed = jsonDecode(parser.responseBody);
    return parser.fromJson(parsed);
  }

  /// parse json array
  static List<T> parseObjects<T>(JsonParser<T> parser) {
    final parsed = jsonDecode(parser.responseBody).cast<Map<String, dynamic>>();
    return parsed.map<T>((json) => parser.fromJson(json)).toList();
  }

  /// parse json array in background
  static Future<List<T>> parseObjectsCompute<T>(JsonParser<T> parser) {
    return compute(JsonExtensions.parseObjects<T>, parser);
  }
}

class JsonParser<T> {
  /// raw json
  String responseBody;

  /// function convert json -> T
  T Function(Map<String, dynamic> json) fromJson;

  JsonParser({required this.responseBody, required this.fromJson});
}
