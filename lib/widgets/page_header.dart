import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:codeit/static/variables.dart' as variables;

import 'package:codeit/widgets/custom_safe_area.dart';

class PageHeader extends StatelessWidget {
  final String titleKey;
  final Function? onBackButton;

  const PageHeader({
    Key? key,
    required this.titleKey,
    this.onBackButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _defaultButtonSize = variables.defaultButtonSize();

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).highlightColor,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(
            variables.bigBorderRadius,
          ),
        ),
        boxShadow: [
          Theme.of(context).brightness == Brightness.light
              ? variables.bottomDefaultBoxShadow
              : const BoxShadow(),
        ],
      ),
      child: CustomSafeArea(
        bottom: false,
        padding: variables.defaultMarginPadding(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: onBackButton == null
                  ? () => Navigator.pop(context)
                  : () => onBackButton!(),
              child: Container(
                width: _defaultButtonSize,
                alignment: Alignment.centerLeft,
                color: Colors.transparent,
                child: Icon(
                  Platform.isIOS
                      ? CupertinoIcons.chevron_back
                      : Icons.arrow_back_rounded,
                ),
              ),
            ),
            Text(
              variables.translate(
                context,
                titleKey,
              )!,
              style: Theme.of(context).textTheme.headline1!.copyWith(
                    fontSize: variables.headline2FontSize(),
                  ),
            ),
            SizedBox(
              width: _defaultButtonSize,
            ),
          ],
        ),
      ),
    );
  }
}
