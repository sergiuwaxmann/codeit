import 'package:flutter/material.dart';

class SizeConfig {
  static late double screenWidth, screenHeight, textMultiplier;
  static late bool isPortrait, isTablet;

  void init({
    required BoxConstraints constraints,
    required Orientation orientation,
  }) {
    screenWidth = constraints.maxWidth;
    screenHeight = constraints.maxHeight;
    isPortrait = orientation == Orientation.portrait;
    isTablet = screenWidth >= 1024 || screenHeight >= 1024;
    textMultiplier = screenHeight /
        100 *
        (isPortrait
            ? 1
            : isTablet
                ? 1.5
                : 2);
  }
}
