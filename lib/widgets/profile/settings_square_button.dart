import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:codeit/routes/route_names.dart' as routes;

import 'package:codeit/static/variables.dart' as variables;

class SettingsSquareButton extends StatelessWidget {
  const SettingsSquareButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _size = variables.defaultButtonSize();

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          routes.settingsPageRouteName,
        );
      },
      child: Container(
        width: _size,
        height: _size,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Theme.of(context).highlightColor,
          borderRadius: BorderRadius.circular(
            variables.defaultBorderRadius,
          ),
          boxShadow: [
            Theme.of(context).brightness == Brightness.light
                ? variables.bottomSmallBoxShadow
                : const BoxShadow(),
          ],
        ),
        child: Icon(
          Platform.isIOS
              ? CupertinoIcons.settings_solid
              : Icons.settings_rounded,
        ),
      ),
    );
  }
}
