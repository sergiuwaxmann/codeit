import 'package:flutter/material.dart';

class LightThemeProvider with ChangeNotifier {
  ThemeData _themeData;

  LightThemeProvider({
    required ThemeData themeData,
  }) : _themeData = themeData;

  ThemeData get themeData {
    return _themeData;
  }

  void setThemeData({
    required ThemeData themeData,
  }) {
    _themeData = themeData;

    notifyListeners();
  }
}
