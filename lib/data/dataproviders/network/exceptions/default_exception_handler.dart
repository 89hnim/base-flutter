import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:base_flutter/data/dataproviders/network/exceptions/exception_handler.dart';
import 'package:base_flutter/utils/string_ext.dart';

part 'default_exception_handler.g.dart';

class DefaultExceptionHandler extends ExceptionHandler {

  @override
  Exception from(Exception e) {
    if (e is DioError && e.type == DioErrorType.response) {
      return _errorFromServer(e);
    } else {
      return e;
    }
  }

  /// When server response with a incorrect status, such as 404, 503...
  Exception _errorFromServer(DioError e) {
    try {
      var errorJson = jsonDecode(e.response?.data);
      var error = _CommonErrorResponse.fromJson(errorJson);
      switch (error.code) {
        default:
          return error.message.isNullOrEmpty() ? e : Exception(error.message);
      }
    } on Exception catch (_) {
      // error while parsing json
      return Exception(e);
    }
  }
}

@JsonSerializable()
class _CommonErrorResponse {
  @JsonKey(name: 'code')
  final int? code;
  @JsonKey(name: 'message')
  final String? message;

  _CommonErrorResponse(this.code, this.message);

  factory _CommonErrorResponse.fromJson(Map<String, dynamic> json) =>
      _$CommonErrorResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CommonErrorResponseToJson(this);
}
