import 'package:flutter/material.dart';

class CourseSection {
  String titleKey;
  int sectionNumber;
  String illustration;
  Color bgColor1;
  Color bgColor2;

  CourseSection({
    required this.titleKey,
    required this.sectionNumber,
    required this.illustration,
    required this.bgColor1,
    required this.bgColor2,
  });
}
