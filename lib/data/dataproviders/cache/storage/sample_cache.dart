import 'dart:convert';

import 'package:base_flutter/data/dataproviders/cache/models/sample_entity.dart';
import 'package:base_flutter/utils/json_ext.dart';
import 'package:base_flutter/utils/string_ext.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SampleCache {
  Future<bool> saveSamples(List<SampleEntity> samples) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString(_samplesKey, jsonEncode(samples));
  }

  Future<List<SampleEntity>> getSamples() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return JsonExtensions.toObjects(
      JsonParser(
        raw: prefs.getString(_samplesKey).orEmpty(),
        fromJson: (json) => SampleEntity.fromJson(json),
      ),
    );
  }

  static const String _samplesKey = "samplesKey";
}
