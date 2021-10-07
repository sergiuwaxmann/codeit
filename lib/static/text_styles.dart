import 'package:flutter/material.dart';

import 'package:codeit/static/variables.dart' as variables;

// Light

TextStyle headlineLight = TextStyle(
  fontFamily: variables.mainFont,
  fontWeight: FontWeight.w800,
  color: Colors.black,
  decoration: TextDecoration.none,
);

TextStyle bodyLight1 = TextStyle(
  fontFamily: variables.mainFont,
  color: Colors.black,
  decoration: TextDecoration.none,
);

TextStyle bodyLight2 = bodyLight1.copyWith(
  color: Colors.black.withOpacity(.8),
);

// Dark

TextStyle headlineDark = headlineLight.copyWith(
  color: Colors.white,
);

TextStyle bodyDark1 = bodyLight1.copyWith(
  color: Colors.white,
);

TextStyle bodyDark2 = bodyDark1.copyWith(
  color: Colors.white.withOpacity(.8),
);
