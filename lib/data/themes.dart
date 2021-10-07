import 'package:flutter/material.dart';

import 'package:codeit/models/app_theme.dart';
import 'package:codeit/models/custom_theme_mode.dart';

import 'package:codeit/static/colors.dart' as colors;
import 'package:codeit/static/text_themes.dart' as text_themes;

final List<CustomThemeMode> themeModes = [
  CustomThemeMode(
    titleKey: 'system',
    themeMode: ThemeMode.system,
  ),
  CustomThemeMode(
    titleKey: 'light',
    themeMode: ThemeMode.light,
  ),
  CustomThemeMode(
    titleKey: 'dark',
    themeMode: ThemeMode.dark,
  ),
];

final List<AppTheme> lightThemes = [
  AppTheme(
    titleKey: 'classic_light',
    themeData: ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: colors.classicLightPrimaryColor,
      accentColor: colors.classicLightAccentColor,
      primaryColor: colors.classicLightPrimaryColor,
      highlightColor: colors.classicLightHighlightColor,
      textTheme: text_themes.lightTextTheme,
    ),
  ),
  AppTheme(
    titleKey: 'pale_blue',
    themeData: ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: colors.paleBluePrimaryColor,
      accentColor: colors.paleBlueAccentColor,
      primaryColor: colors.paleBluePrimaryColor,
      highlightColor: colors.paleBlueHighlightColor,
      textTheme: text_themes.lightTextTheme,
    ),
  ),
];

final List<AppTheme> darkThemes = [
  AppTheme(
    titleKey: 'classic_dark',
    themeData: ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: colors.classicDarkPrimaryColor,
      accentColor: colors.classicDarkAccentColor,
      primaryColor: colors.classicDarkPrimaryColor,
      highlightColor: colors.classicDarkHighlightColor,
      textTheme: text_themes.darkTextTheme,
    ),
  ),
  AppTheme(
    titleKey: 'pure_black',
    themeData: ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: colors.pureBlackPrimaryColor,
      accentColor: colors.pureBlackAccentColor,
      primaryColor: colors.pureBlackPrimaryColor,
      highlightColor: colors.pureBlackHighlightColor,
      textTheme: text_themes.darkTextTheme,
    ),
  ),
];
