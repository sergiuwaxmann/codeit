import 'package:flutter/material.dart';

import 'package:codeit/pages/loading_page.dart';
import 'package:codeit/pages/not_found_page.dart';

import 'package:codeit/routes/route_names.dart';

class CustomRouter {
  static Route<dynamic> allRoutes(RouteSettings settings) {
    switch (settings.name) {
      case loadingPageRouteName:
        return MaterialPageRoute(
          settings: settings,
          builder: (
            _,
          ) =>
              const LoadingPage(),
          fullscreenDialog: true,
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
              const NotFoundPage(),
          fullscreenDialog: true,
        );
    }
  }
}
