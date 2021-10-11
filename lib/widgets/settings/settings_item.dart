import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:codeit/models/settings_item.dart' as model_settings_item;

import 'package:codeit/static/variables.dart' as variables;

class SettingsItem extends StatelessWidget {
  final model_settings_item.SettingsItem settingsItem;

  const SettingsItem({
    Key? key,
    required this.settingsItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _smallMarginPadding = variables.smallMarginPadding();

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          settingsItem.routeName,
        );
      },
      child: Container(
        height: variables.defaultButtonSize(),
        padding: EdgeInsets.symmetric(
          horizontal: _smallMarginPadding,
        ),
        decoration: BoxDecoration(
          color: Theme.of(context).highlightColor,
          borderRadius: BorderRadius.circular(
            variables.defaultBorderRadius,
          ),
          boxShadow: [
            Theme.of(context).brightness == Brightness.light
                ? variables.defaultBoxShadow
                : const BoxShadow(),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                settingsItem.icon != null
                    ? Row(
                        children: [
                          Icon(
                            settingsItem.icon,
                          ),
                          SizedBox(
                            width: _smallMarginPadding,
                          ),
                        ],
                      )
                    : const SizedBox.shrink(),
                Text(
                  variables.translate(
                    context,
                    settingsItem.titleKey,
                  )!,
                  style: Theme.of(context).textTheme.button!.copyWith(
                        fontSize: variables.buttonFontSize(),
                      ),
                )
              ],
            ),
            Icon(
              Platform.isIOS
                  ? CupertinoIcons.chevron_forward
                  : Icons.arrow_forward_rounded,
            )
          ],
        ),
      ),
    );
  }
}
