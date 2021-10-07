import 'package:flutter/material.dart';

const Color _accentColor = Color(0xFF0971FE);

const Color _darkHighlightColor = Color(0xFF202020);

// Classic Light Theme colors
Color classicLightAccentColor = _accentColor;
const Color classicLightPrimaryColor = Color(0xFFFAFAFA);
const Color classicLightHighlightColor = Colors.white;

// Pale Blue Theme colors
Color paleBlueAccentColor = _accentColor;
const Color paleBluePrimaryColor = Color(0xFFE7EEFB);
const Color paleBlueHighlightColor = Color(0xFFF5F8FF);

// Classic Dark Theme colors
Color classicDarkAccentColor = _accentColor;
const Color classicDarkPrimaryColor = Color(0xFF121212);
Color classicDarkHighlightColor = _darkHighlightColor;

// Pure Black Theme colors
Color pureBlackAccentColor = _accentColor;
const Color pureBlackPrimaryColor = Colors.black;
Color pureBlackHighlightColor = _darkHighlightColor;

// Common colors
Color overlayColor = Colors.black.withOpacity(
  0.25,
);
Color shadowColor = Colors.black.withOpacity(
  0.25,
);

// Utilities
Color getTextColorBasedOnColor({
  required Color color,
}) {
  return color.computeLuminance() > 0.5 ? Colors.black : Colors.white;
}
