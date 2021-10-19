import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:codeit/routes/route_names.dart' as routes;

import 'package:codeit/models/settings_item.dart';

final List<SettingsItem> settingsItems = [
  SettingsItem(
    routeName: routes.accountPageRouteName,
    titleKey: 'account',
    icon: Platform.isIOS ? CupertinoIcons.person_fill : Icons.person_rounded,
  ),
  SettingsItem(
    routeName: routes.appearancePageRouteName,
    titleKey: 'appearance',
    icon: Platform.isIOS ? CupertinoIcons.eye_fill : Icons.visibility_rounded,
  ),
  SettingsItem(
    routeName: routes.languagePageRouteName,
    titleKey: 'language',
    icon: Platform.isIOS ? CupertinoIcons.globe : Icons.language_rounded,
  ),
];
