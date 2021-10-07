import 'package:flutter/material.dart';

class CustomThemeMode {
  final String _titleKey;
  final ThemeMode _themeMode;

  CustomThemeMode({
    required String titleKey,
    required ThemeMode themeMode,
  })  : _titleKey = titleKey,
        _themeMode = themeMode;

  String get titleKey {
    return _titleKey;
  }

  ThemeMode get themeMode {
    return _themeMode;
  }
}
