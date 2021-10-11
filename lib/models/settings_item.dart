import 'package:flutter/material.dart';

class SettingsItem {
  final String _routeName;
  final String _titleKey;
  final IconData? _icon;

  SettingsItem({
    required String routeName,
    required String titleKey,
    IconData? icon,
  })  : _routeName = routeName,
        _titleKey = titleKey,
        _icon = icon;

  String get routeName {
    return _routeName;
  }

  String get titleKey {
    return _titleKey;
  }

  IconData? get icon {
    return _icon;
  }
}
