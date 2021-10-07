import 'package:flutter/material.dart';

class AppTheme {
  final String _titleKey;
  final ThemeData _themeData;

  AppTheme({
    required String titleKey,
    required ThemeData themeData,
  })  : _titleKey = titleKey,
        _themeData = themeData;

  String get titleKey {
    return _titleKey;
  }

  ThemeData get themeData {
    return _themeData;
  }
}
