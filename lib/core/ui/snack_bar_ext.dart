import 'package:flutter/material.dart';

// todo: impl follow particular DS
extension SnackBarExtensions on BuildContext {
  void showSnackBar(String content) {
    ScaffoldMessenger.of(this).showSnackBar(SnackBar(content: Text(content)));
  }
}