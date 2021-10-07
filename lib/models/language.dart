import 'package:flutter/material.dart';

class Language {
  final String _titleKey;
  final String _languageCode;
  final String _countryCode;
  final String? _flag;

  Language({
    required String titleKey,
    required String languageCode,
    required String countryCode,
    String? flag,
  })  : _titleKey = titleKey,
        _languageCode = languageCode,
        _countryCode = countryCode,
        _flag = flag;

  String get titleKey {
    return _titleKey;
  }

  String get languageCode {
    return _languageCode;
  }

  String get countryCode {
    return _countryCode;
  }

  Locale get locale {
    return Locale(
      _languageCode,
      _countryCode,
    );
  }

  String get localeName {
    return '${_languageCode}_$_countryCode';
  }

  String? get flag {
    return _flag;
  }
}
