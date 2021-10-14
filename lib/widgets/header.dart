import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:codeit/routes/route_names.dart' as routes;

import 'package:codeit/utilities/size_config.dart';

import 'package:codeit/widgets/header_menu_button.dart';
import 'package:codeit/widgets/search_field.dart';

class Header extends StatelessWidget {
  final Function toggleSideMenu;

  const Header({
    Key? key,
    required this.toggleSideMenu,
  }) : super(key: key);

  double _calculateMargin() {
    double sizeMultiplier = !SizeConfig.isTablet ? 0.05 : 0.025;
    return sizeMultiplier *
        (SizeConfig.isPortrait
            ? SizeConfig.screenWidth
            : SizeConfig.screenHeight);
  }

  @override
  Widget build(BuildContext context) {
    double _margin = _calculateMargin();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween, // ? Is it necessary?
      children: [
        HeaderMenuButton(
          onTap: toggleSideMenu,
        ),
        // ignore: prefer_const_constructors
        SearchField(),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: _margin,
          ),
          child: Icon(
            Platform.isIOS ? CupertinoIcons.bell_fill : Icons.notifications,
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(
              context,
              routes.profilePageRouteName,
            );
          },
          child: CircleAvatar(
            backgroundImage: const AssetImage(
              'assets/images/profile.jpg',
            ),
            radius: !SizeConfig.isTablet ? 18 : 22,
          ),
        ),
      ],
    );
  }
}
