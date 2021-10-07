import 'package:flutter/material.dart';

class LocaleProvider with ChangeNotifier {
  Locale? _locale;

  LocaleProvider({
    required Locale? locale,
  }) : _locale = locale;

  Locale? get locale {
    return _locale;
  }

  void initLocale({
    required Locale locale,
  }) {
    _locale = locale;
  }

  void setLocale({
    required Locale locale,
  }) {
    _locale = locale;

    notifyListeners();
  }
}
