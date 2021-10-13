// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';

import 'package:codeit/static/variables.dart' as variables;

import 'package:codeit/utilities/size_config.dart';

import 'package:codeit/widgets/custom_safe_area.dart';
import 'package:codeit/widgets/header.dart';

import 'package:codeit/widgets/home/continue_watching_panel.dart';
import 'package:codeit/widgets/home/explore_courses.dart';
import 'package:codeit/widgets/home/explore_courses_headline.dart';
import 'package:codeit/widgets/home/home_content_container.dart';
import 'package:codeit/widgets/home/recent_courses.dart';
import 'package:codeit/widgets/home/recent_courses_headline.dart';

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
                child: Column(
                  children: [
                    Header(
                      toggleSideMenu: () =>
                          _sideMenuStateKey.currentState!.toggleSideMenu(),
                    ),
                    const Spacer(),
                    RecentCoursesHeadline(),
                    RecentCourses(),
                    const Spacer(),
                    SizeConfig.isPortrait
                        ? ExploreCoursesHeadline()
                        : const SizedBox.shrink(),
                    SizeConfig.isPortrait
                        ? ExploreCourses()
                        : const SizedBox.shrink(),
                    SizeConfig.isPortrait
                        ? const Spacer()
                        : const SizedBox.shrink(),
                  ],
                ),
              ),
            ),
            ContinueWatchingPanel(),
            SideMenu(
              key: _sideMenuStateKey,
            ),
          ],
        ),
      ),
    );
  }
}
