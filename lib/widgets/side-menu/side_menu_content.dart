// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:codeit/data/side_menu_items.dart';

import 'package:codeit/routes/route_names.dart' as routes;

import 'package:codeit/static/variables.dart' as variables;

import 'package:codeit/utilities/size_config.dart';

import 'package:codeit/widgets/custom_safe_area.dart';

import 'package:codeit/widgets/side-menu/side_menu_logout.dart';
import 'package:codeit/widgets/side-menu/side_menu_profile.dart';
import 'package:codeit/widgets/side-menu/side_menu_row.dart';
import 'package:codeit/widgets/side-menu/side_menu_vertical_sized_box.dart';

class SideMenuContent extends StatelessWidget {
  final Function toggleSideMenu;

  const SideMenuContent({
    Key? key,
    required this.toggleSideMenu,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (SizeConfig.isPortrait ? 0.75 : 0.35) * SizeConfig.screenWidth,
      height: SizeConfig.screenHeight,
      decoration: BoxDecoration(
        color: Theme.of(context).highlightColor,
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(
            40,
          ),
        ),
      ),
      child: CustomSafeArea(
        padding: variables.defaultMarginPadding(),
        child: Column(
          mainAxisSize: MainAxisSize.min, // ? Is it necessary?
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SideMenuProfile(
              onTap: () {
                toggleSideMenu();

                Navigator.pushNamed(
                  context,
                  routes.profilePageRouteName,
                );
              },
            ),
            SizeConfig.isPortrait
                ? SizedBox(
                    height: 0.1 * SizeConfig.screenHeight,
                  )
                : const Spacer(),
            SideMenuRow(
              sideMenuItem: sideMenuItems[0],
              onTap: () {
                toggleSideMenu();

                if (ModalRoute.of(context)?.settings.name !=
                    routes.homePageRouteName) {
                  Navigator.pushReplacementNamed(
                    context,
                    routes.homePageRouteName,
                  );
                }
              },
            ),
            SideMenuVerticalSizedBox(),
            SideMenuRow(
              sideMenuItem: sideMenuItems[1],
              onTap: () {
                toggleSideMenu();

                if (ModalRoute.of(context)?.settings.name !=
                    routes.coursesPageRouteName) {
                  Navigator.pushReplacementNamed(
                    context,
                    routes.coursesPageRouteName,
                  );
                }
              },
            ),
            SideMenuVerticalSizedBox(),
            SideMenuRow(
              sideMenuItem: sideMenuItems[2],
              onTap: () {
                toggleSideMenu();

                // TODO: Billing Page

                Navigator.pushReplacementNamed(
                  context,
                  routes.billingPageRouteName,
                );
              },
            ),
            SideMenuVerticalSizedBox(),
            SideMenuRow(
              sideMenuItem: sideMenuItems[3],
              onTap: () {
                toggleSideMenu();

                Navigator.pushNamed(
                  context,
                  routes.settingsPageRouteName,
                );
              },
            ),
            const Spacer(),
            SideMenuLogout(
              onTap: () {
                toggleSideMenu();

                // TODO: Log out

                Navigator.pushReplacementNamed(
                  context,
                  routes.loginPageRouteName,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
