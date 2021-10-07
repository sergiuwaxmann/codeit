import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:flutter/services.dart';

import 'package:codeit/data/languages.dart' as data_languages;

/// https://www.youtube.com/watch?v=lDfbbTvq4qM&t=473s
class AppLocalizations {
  final Locale locale;
  late Map<String, String> _localizedValues;

  AppLocalizations(this.locale);

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(
      context,
      AppLocalizations,
    )!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  Future load() async {
    String jsonStringValues = await rootBundle
        .loadString('assets/locales/${locale.languageCode}.json');

    Map<String, dynamic> mappedJson = json.decode(jsonStringValues);

    _localizedValues = mappedJson.map(
      (
        key,
        value,
      ) =>
          MapEntry(
        key,
        value.toString(),
      ),
    );
  }

  String? getTranslatedValue(String key) {
    return _localizedValues[key];
  }
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return data_languages.languages
        .map(
          (language) => language.languageCode,
        )
        .contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    AppLocalizations localizations = AppLocalizations(locale);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}
