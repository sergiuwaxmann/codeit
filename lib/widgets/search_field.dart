import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:codeit/static/variables.dart' as variables;

import 'package:codeit/utilities/size_config.dart';

class SearchField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _size = variables.defaultButtonSize();

    return Expanded(
      child: Container(
        height: _size,
        margin: EdgeInsets.only(
          left: _size / 2,
        ),
        // padding: EdgeInsets.symmetric(
        //   horizontal: 16,
        // ),
        decoration: BoxDecoration(
          color: Theme.of(context).highlightColor,
          boxShadow: [
            Theme.of(context).brightness == Brightness.light
                ? variables.bottomSmallBoxShadow
                : const BoxShadow(),
          ],
          borderRadius: BorderRadius.circular(
            variables.defaultBorderRadius,
          ),
        ),
        child: TextField(
          enabled: false,
          autocorrect: false,
          enableSuggestions: false,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.search,
          cursorColor: Theme.of(context).colorScheme.secondary,
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                fontSize: variables.headline3FontSize(),
              ),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(
              // ! Probably not the best practice
              top: !SizeConfig.isTablet ? 7 : 5,
            ),
            prefixIcon: Icon(
              Platform.isIOS ? CupertinoIcons.search : Icons.search,
              size: 2 * SizeConfig.textMultiplier,
              color: Theme.of(context).brightness == Brightness.light
                  ? Colors.black
                  : Colors.white,
            ),
            hintText: !SizeConfig.isTablet && SizeConfig.isPortrait
                ? 'Search'
                : 'Search for courses',
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
