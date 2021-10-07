import 'package:flutter/material.dart';

class DarkThemeProvider with ChangeNotifier {
  ThemeData _themeData;

  DarkThemeProvider({
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
