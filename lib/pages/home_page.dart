import 'dart:io';

import 'package:flutter/material.dart';

import 'package:codeit/static/variables.dart' as variables;

import 'package:codeit/widgets/custom_safe_area.dart';
import 'package:codeit/widgets/header.dart';

import 'package:codeit/widgets/home/home_content_container.dart';

import 'package:codeit/widgets/side-menu/side_menu.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey<SideMenuState> _sideMenuStateKey = GlobalKey();

    return WillPopScope(
      onWillPop: () {
        // If the Android back button is tapped
        if (Platform.isAndroid) {
          // If the side menu is visible
          if (!_sideMenuStateKey.currentState!.isSideMenuHidden) {
            // Close side menu
            _sideMenuStateKey.currentState!.toggleSideMenu();
          }
        }

        return Future.value(
          false,
        );
      },
      child: Scaffold(
        body: Stack(
          children: [
            CustomSafeArea(
              padding: variables.defaultMarginPadding(),
              child: HomeContentContainer(
                child: Header(
                  toggleSideMenu: () =>
                      _sideMenuStateKey.currentState!.toggleSideMenu(),
                ),
              ),
            ),
            SideMenu(
              key: _sideMenuStateKey,
            ),
          ],
        ),
      ),
    );
  }
}
