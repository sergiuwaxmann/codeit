// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:codeit/pages/appearance_page.dart';
import 'package:codeit/pages/course_page.dart';
import 'package:codeit/pages/home_page.dart';
import 'package:codeit/pages/language_page.dart';
import 'package:codeit/pages/loading_page.dart';
import 'package:codeit/pages/login_page.dart';
import 'package:codeit/pages/not_found_page.dart';
import 'package:codeit/pages/player_page.dart';
import 'package:codeit/pages/profile_page.dart';
import 'package:codeit/pages/settings_page.dart';

import 'package:codeit/routes/route_names.dart';

class CustomRouter {
  static Route<dynamic> allRoutes(RouteSettings settings) {
    switch (settings.name) {
      case appearancePageRouteName:
        return MaterialPageRoute(
          settings: settings,
          builder: (
            _,
          ) =>
              AppearancePage(),
        );

      case coursePageRouteName:
        final arguments = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          settings: RouteSettings(
            name: '$coursePageRouteName/${arguments['course'].titleKey}',
            arguments: settings.arguments,
          ),
          builder: (
            _,
          ) =>
              CoursePage(
            course: arguments['course'],
          ),
          fullscreenDialog: true,
        );

      case homePageRouteName:
        return MaterialPageRoute(
          settings: settings,
          builder: (
            _,
          ) =>
              HomePage(),
        );

      case languagePageRouteName:
        return MaterialPageRoute(
          settings: settings,
          builder: (
            _,
          ) =>
              LanguagePage(),
        );

      case loadingPageRouteName:
        return MaterialPageRoute(
          settings: settings,
          builder: (
            _,
          ) =>
              LoadingPage(),
          fullscreenDialog: true,
        );

      case loginPageRouteName:
        return MaterialPageRoute(
          settings: settings,
          builder: (
            _,
          ) =>
              LoginPage(),
          fullscreenDialog: true,
        );

      case playerPageRouteName:
        final arguments = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          settings: RouteSettings(
            arguments: settings.arguments,
          ),
          builder: (
            _,
          ) =>
              PlayerPage(
            videoPlayerController: arguments['videoPlayerController'],
          ),
          fullscreenDialog: true,
        );

      case profilePageRouteName:
        return MaterialPageRoute(
          settings: settings,
          builder: (
            _,
          ) =>
              ProfilePage(),
        );

      case settingsPageRouteName:
        return MaterialPageRoute(
          settings: settings,
          builder: (
            _,
          ) =>
              SettingsPage(),
        );

      default:
        return MaterialPageRoute(
          settings: RouteSettings(
            name: '/404',
            arguments: settings.arguments,
          ),
          builder: (
            _,
          ) =>
              NotFoundPage(),
          fullscreenDialog: true,
        );
    }
  }
}
