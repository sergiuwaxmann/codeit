import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:codeit/routes/route_names.dart' as routes;

import 'package:codeit/utilities/size_config.dart';

import 'package:codeit/widgets/search_field.dart';

import 'package:codeit/widgets/home/home_header_menu_button.dart';

class HomeHeader extends StatelessWidget {
  final Function toggleSideMenu;

  const HomeHeader({
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
        HomeHeaderMenuButton(
          onTap: toggleSideMenu,
        ),
        SearchField(),
        Container(
          margin: EdgeInsets.symmetric(
            horizontal: _margin,
          ),
          child: Icon(
            Platform.isIOS ? CupertinoIcons.bell_fill : Icons.notifications,
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushReplacementNamed(
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
