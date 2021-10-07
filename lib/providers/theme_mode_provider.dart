import 'package:flutter/material.dart';

class ThemeModeProvider with ChangeNotifier {
  ThemeMode _themeMode;

  ThemeModeProvider({
    required ThemeMode themeMode,
  }) : _themeMode = themeMode;

  ThemeMode get themeMode {
    return _themeMode;
  }

  void setThemeMode({
    required ThemeMode themeMode,
  }) {
    _themeMode = themeMode;

    notifyListeners();
  }
}
