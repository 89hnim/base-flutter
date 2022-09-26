import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';

class JsonExtensions {
  JsonExtensions._();

  /// parse json object
  /// not tested yet.
  static T? toObject<T>(
    String raw,
    T Function(Map<String, dynamic> json) fromJson,
  ) {
    return _toObject(_JsonParser(raw: raw, fromJson: fromJson));
  }

  static T? _toObject<T>(_JsonParser parser) {
    try {
      final parsed = jsonDecode(parser.raw);
      return parser.fromJson(parsed);
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  /// parse json array
  static List<T> toObjects<T>(
    String raw,
    T Function(Map<String, dynamic> json) fromJson,
  ) {
    return _toObjects(_JsonParser(raw: raw, fromJson: fromJson));
  }

  /// parse json array in background
  /// https://docs.flutter.dev/cookbook/networking/background-parsing
  static Future<List<T>> toObjectsCompute<T>(
    String raw,
    T Function(Map<String, dynamic> json) fromJson,
  ) {
    return compute(
      JsonExtensions._toObjects<T>,
      _JsonParser(raw: raw, fromJson: fromJson),
    );
  }

  static List<T> _toObjects<T>(_JsonParser<T> parser) {
    try {
      final parsed = jsonDecode(parser.raw).cast<Map<String, dynamic>>();
      return parsed.map<T>((json) => parser.fromJson(json)).toList();
    } on Exception catch (e) {
      log(e.toString());
      return List.empty();
    }
  }
}

class _JsonParser<T> {
  /// raw json
  String raw;

  /// function convert json -> T
  T Function(Map<String, dynamic> json) fromJson;

  _JsonParser({required this.raw, required this.fromJson});
}
