import 'dart:io';

import 'package:flutter/material.dart';

import 'package:codeit/static/colors.dart' as colors;

import 'package:codeit/utilities/app_localizations.dart';
import 'package:codeit/utilities/size_config.dart';

// Fonts

String? mainFont = Platform.isIOS ? 'SF Pro Text' : null;

// Font sizes

double headline1FontSize() {
  return 2.5 * SizeConfig.textMultiplier;
}

double headline2FontSize() {
  return 2 * SizeConfig.textMultiplier;
}

double headline3FontSize() {
  return 1.8 * SizeConfig.textMultiplier;
}

double bodyText1FontSize() {
  return 1.6 * SizeConfig.textMultiplier;
}

double bodyText2FontSize() {
  return 1.4 * SizeConfig.textMultiplier;
}

double buttonFontSize() {
  return 1.65 * SizeConfig.textMultiplier;
}

// Sizes

double defaultButtonSize() {
  return (!SizeConfig.isTablet ? .1 : .05) *
      (SizeConfig.isPortrait
          ? SizeConfig.screenWidth
          : SizeConfig.screenHeight);
}

// Margins and paddings

double defaultMarginPadding() {
  return (!SizeConfig.isTablet ? .05 : .025) *
      (SizeConfig.isPortrait
          ? SizeConfig.screenWidth
          : SizeConfig.screenHeight);
}

double bigMarginPadding() {
  return (!SizeConfig.isTablet ? .1 : .05) *
      (SizeConfig.isPortrait
          ? SizeConfig.screenWidth
          : SizeConfig.screenHeight);
}

double smallMarginPadding() {
  return .025 *
      (SizeConfig.isPortrait
          ? SizeConfig.screenWidth
          : SizeConfig.screenHeight);
}

// Border radius

double defaultBorderRadius = 16.0;

double bigBorderRadius = 28.0;

double smallBorderRadius = 8.0;

// Box shadows

// * Default

BoxShadow defaultBoxShadow = BoxShadow(
  blurRadius: 16,
  color: colors.shadowColor,
);

BoxShadow topDefaultBoxShadow = BoxShadow(
  offset: const Offset(
    0,
    -8,
  ),
  blurRadius: 16,
  color: colors.shadowColor,
);

// * Big

BoxShadow bigBoxShadow = BoxShadow(
  blurRadius: 32,
  color: colors.shadowColor,
);

// * Small

BoxShadow smallBoxShadow = BoxShadow(
  blurRadius: 8,
  color: colors.shadowColor,
);

BoxShadow topSmallBoxShadow = BoxShadow(
  offset: const Offset(
    0,
    -4,
  ),
  blurRadius: 8,
  color: colors.shadowColor,
);

// Durations

Duration defaultDuration = const Duration(
  milliseconds: 250,
);

Duration longDuration = const Duration(
  milliseconds: 500,
);

Duration shortDuration = const Duration(
  milliseconds: 125,
);

// Curves

Curve defaultCurve = Curves.easeInOut;

// Localizations

String? translate(
  BuildContext context,
  String key,
) {
  return AppLocalizations.of(context).getTranslatedValue(
    key,
  );
}
