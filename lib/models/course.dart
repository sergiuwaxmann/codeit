import 'package:flutter/material.dart';

class Course {
  String titleKey;
  String? subtitleKey;
  String? currentSectionKey;
  int sectionsCount;
  String illustration;
  String? logo;
  Color bgColor1;
  Color bgColor2;

  Course({
    required this.titleKey,
    this.subtitleKey,
    this.currentSectionKey,
    required this.sectionsCount,
    required this.illustration,
    this.logo,
    required this.bgColor1,
    required this.bgColor2,
  });
}
