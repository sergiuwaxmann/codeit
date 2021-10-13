import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:codeit/models/side_menu_item.dart';

final List<SideMenuItem> sideMenuItems = [
  SideMenuItem(
    titleKey: 'home',
    icon: Platform.isIOS ? CupertinoIcons.house_fill : Icons.home_rounded,
    bgColor1: const Color(0xFF00AAFF),
    bgColor2: const Color(0xFF0076FF),
  ),
  SideMenuItem(
    titleKey: 'courses',
    icon: Platform.isIOS
        ? CupertinoIcons.book_solid
        : Icons.library_books_rounded,
    bgColor1: const Color(0xFFFA7d75),
    bgColor2: const Color(0xFFC23D61),
  ),
  SideMenuItem(
    titleKey: 'billing',
    icon: Platform.isIOS
        ? CupertinoIcons.creditcard_fill
        : Icons.credit_card_rounded,
    bgColor1: const Color(0xFFFAD64A),
    bgColor2: const Color(0xFFEA880F),
  ),
  SideMenuItem(
    titleKey: 'settings',
    icon:
        Platform.isIOS ? CupertinoIcons.settings_solid : Icons.settings_rounded,
    bgColor1: const Color(0xFF4E62CC),
    bgColor2: const Color(0xFF202A78),
  ),
];
