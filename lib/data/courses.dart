import 'package:flutter/material.dart';

import 'package:codeit/models/course.dart';
import 'package:codeit/models/course_section.dart';

// Recent courses
final List<Course> recentCourses = [
  Course(
    titleKey: 'flutter_from_scratch',
    sectionsCount: 12,
    illustration: 'illustration-1.png',
    logo: 'flutter-logo.svg',
    bgColor1: const Color(0xFF00AEFF),
    bgColor2: const Color(0xFF0076FF),
  ),
  Course(
    titleKey: 'prototyping_with_figma',
    sectionsCount: 10,
    illustration: 'illustration-2.png',
    logo: 'figma-logo.svg',
    bgColor1: const Color(0xFFFD504F),
    bgColor2: const Color(0xFFFF8181),
  ),
  Course(
    titleKey: 'build_an_app_with_swiftui',
    sectionsCount: 22,
    illustration: 'illustration-3.png',
    logo: 'swift-logo.svg',
    bgColor1: const Color(0xFF00E1EE),
    bgColor2: const Color(0xFF001392),
  ),
];

// Explore courses
final List<Course> exploreCourses = [
  Course(
    titleKey: 'css_layout_and_animations',
    sectionsCount: 22,
    illustration: 'illustration-4.png',
    bgColor1: const Color(0xFF5BCEA6),
    bgColor2: const Color(0xFF1997AB),
  ),
  Course(
    titleKey: 'react_native_for_beginners',
    sectionsCount: 20,
    illustration: 'illustration-5.png',
    bgColor1: const Color(0xFFA931E5),
    bgColor2: const Color(0xFF4B02FE),
  ),
];

// Continue Watching courses
final List<Course> continueWatchingCourses = [
  Course(
    titleKey: 'unity_for_beginners',
    currentSectionKey: 'player_movement',
    sectionsCount: 24,
    illustration: 'illustration-6.png',
    bgColor1: const Color(0xFF4E62CC),
    bgColor2: const Color(0xFF202A78),
  ),
  Course(
    titleKey: 'animating_in_principle',
    currentSectionKey: 'multiple_scrolling',
    sectionsCount: 16,
    illustration: 'illustration-7.png',
    bgColor1: const Color(0xFFFA7D75),
    bgColor2: const Color(0xFFC23D61),
  ),
];

// Completed courses
final List<Course> completedCourses = [
  Course(
    titleKey: 'unity_for_beginners',
    currentSectionKey: 'player_movement',
    sectionsCount: 24,
    illustration: 'illustration-6.png',
    bgColor1: const Color(0xFF4E62CC),
    bgColor2: const Color(0xFF202A78),
  ),
  Course(
    titleKey: 'animating_in_principle',
    currentSectionKey: 'multiple_scrolling',
    sectionsCount: 16,
    illustration: 'illustration-7.png',
    bgColor1: const Color(0xFFFA7D75),
    bgColor2: const Color(0xFFC23D61),
  ),
  Course(
    titleKey: 'swift_advanced',
    subtitleKey: 'completed',
    sectionsCount: 20,
    illustration: 'illustration-12.png',
    bgColor1: const Color(0xFFDEC8FA),
    bgColor2: const Color(0xFF4A1B6D),
  ),
  Course(
    titleKey: 'build_an_arkit_2_app',
    subtitleKey: 'completed',
    sectionsCount: 18,
    illustration: 'illustration-13.png',
    bgColor1: const Color(0xFFFF6B94),
    bgColor2: const Color(0xFF6B2E98),
  ),
];

// Course sections
final List<CourseSection> courseSections = [
  CourseSection(
    titleKey: 'introduction_to_flutter_and_dart',
    sectionNumber: 1,
    illustration: 'illustration-1.png',
    bgColor1: const Color(0xFF00AEFF),
    bgColor2: const Color(0xFF0076FF),
  ),
  CourseSection(
    titleKey: 'the_first_widget',
    sectionNumber: 2,
    illustration: 'illustration-8.png',
    bgColor1: const Color(0xFFE477AE),
    bgColor2: const Color(0xFFC54284),
  ),
  CourseSection(
    titleKey: 'full_screen_widget',
    sectionNumber: 3,
    illustration: 'illustration-9.png',
    bgColor1: const Color(0xFFEA7E58),
    bgColor2: const Color(0xFFCE4E27),
  ),
  CourseSection(
    titleKey: 'card_widget_explained',
    sectionNumber: 4,
    illustration: 'illustration-10.png',
    bgColor1: const Color(0xFF72CFD4),
    bgColor2: const Color(0xFF42A0C2),
  ),
  CourseSection(
    titleKey: 'classes_in_dart',
    sectionNumber: 5,
    illustration: 'illustration-11.png',
    bgColor1: const Color(0xFFFF2E56),
    bgColor2: const Color(0xFFCB012B),
  ),
];
