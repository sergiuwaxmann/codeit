import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:codeit/static/variables.dart' as variables;

import 'package:codeit/widgets/profile/settings_square_button.dart';

class ProfileHeader extends StatelessWidget {
  final bool settingsButton;

  const ProfileHeader({
    Key? key,
    this.settingsButton = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Container(
            width: variables.defaultButtonSize(),
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
            'profile',
          )!,
          style: Theme.of(context).textTheme.headline1!.copyWith(
                fontSize: variables.headline2FontSize(),
              ),
        ),
        Opacity(
          opacity: settingsButton ? 1 : 0,
          child: AbsorbPointer(
            absorbing: !settingsButton,
            child:
                // ignore: prefer_const_constructors
                SettingsSquareButton(),
          ),
        ),
      ],
    );
  }
}
