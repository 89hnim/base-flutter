import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';

class JsonExtensions {
  JsonExtensions._();

  /// parse json object
  /// not tested yet.
  static T? toObject<T>(JsonParser parser) {
    try {
      final parsed = jsonDecode(parser.raw);
      return parser.fromJson(parsed);
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  /// parse json array
  static List<T> toObjects<T>(JsonParser<T> parser) {
    try {
      final parsed = jsonDecode(parser.raw).cast<Map<String, dynamic>>();
      return parsed.map<T>((json) => parser.fromJson(json)).toList();
    } on Exception catch (e) {
      log(e.toString());
      return List.empty();
    }
  }

  /// parse json array in background
  /// https://docs.flutter.dev/cookbook/networking/background-parsing
  static Future<List<T>> toObjectsCompute<T>(JsonParser<T> parser) {
    return compute(JsonExtensions.toObjects<T>, parser);
  }
}

class JsonParser<T> {
  /// raw json
  String raw;

  /// function convert json -> T
  T Function(Map<String, dynamic> json) fromJson;

  JsonParser({required this.raw, required this.fromJson});
}
