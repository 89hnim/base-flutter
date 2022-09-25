import 'package:flutter/material.dart';

// todo: impl follow particular DS
extension SnackBarExtensions on BuildContext {

  void showNormalSnackBar(String content) {
    _showSnackBar(content, Colors.grey, _dsSnackBarMargin, _dsSnackBarBorder);
  }

  void showPositiveSnackBar(String content) {
    _showSnackBar(content, Colors.green, _dsSnackBarMargin, _dsSnackBarBorder);
  }

  void showNegativeSnackBar(String content) {
    _showSnackBar(content, Colors.redAccent, _dsSnackBarMargin, _dsSnackBarBorder);
  }

  void _showSnackBar(
    String content,
    Color backgroundColor,
    double margin,
    double radius,
  ) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(content),
        backgroundColor: backgroundColor,
        margin: EdgeInsets.all(margin),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(radius)),
        ),
        behavior: SnackBarBehavior.floating,
        duration: const Duration(milliseconds: 3000),
      ),
    );
  }

  static const double _dsSnackBarMargin = 16;
  static const double _dsSnackBarBorder = 8;
}
