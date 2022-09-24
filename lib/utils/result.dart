import 'dart:developer';

import 'package:base_flutter/data/dataproviders/network/exceptions/exception_handler.dart';

/// wrap data from api with success and error state
abstract class Result<T> {
  Result._();

  T? get data;
  Exception? get error;

  bool get isSuccess => this is Success<T>;

  factory Result.success(T data) {
    return Success(data);
  }

  factory Result.error(Exception e) {
    return Error(e);
  }

  static Result<T> guard<T>(
    T Function() body,
    ExceptionHandler exceptionHandler,
  ) {
    try {
      return Result.success(body());
    } on Exception catch (e) {
      return Result.error(exceptionHandler.from(e));
    }
  }

  static Future<Result<T>> guardFuture<T>(
    Future<T> Function() body,
    ExceptionHandler exceptionHandler,
  ) async {
    try {
      return Result.success(await body());
    } on Exception catch (e) {
      log(e.toString());
      return Result.error(exceptionHandler.from(e));
    }
  }
}

class Success<T> extends Result<T> {
  Success(this.data) : super._();

  @override
  T data;

  @override
  Exception? get error => null;
}

class Error<T> extends Result<T> {
  Error(this.error) : super._();

  @override
  Exception error;

  @override
  T? get data => null;
}
