import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'package:codeit/routes/route_names.dart' as routes;

import 'package:codeit/static/variables.dart' as variables;

import 'package:codeit/utilities/size_config.dart';

import 'package:codeit/widgets/custom_safe_area.dart';
import 'package:codeit/widgets/primary_text_button.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({
    Key? key,
  }) : super(key: key);

  List<Widget> _getChildren({
    required BuildContext context,
  }) {
    double lottieSize = 0.25 *
        (SizeConfig.isPortrait
            ? SizeConfig.screenHeight
            : SizeConfig.screenWidth);

    return [
      SizedBox(
        width: lottieSize,
        height: lottieSize,
        child: SvgPicture.asset(
          'assets/illustrations/404.svg',
          fit: BoxFit.scaleDown,
        ),
      ),
      Column(
        crossAxisAlignment: SizeConfig.isPortrait
            ? CrossAxisAlignment.center
            : CrossAxisAlignment.start,
        children: [
          Text(
            '404',
            style: Theme.of(context).textTheme.headline1!.copyWith(
                  fontSize: variables.headline1FontSize(),
                ),
          ),
          Text(
            variables
                .translate(
                  context,
                  'page_not_found',
                )!
                .toUpperCase(),
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  fontSize: variables.bodyText1FontSize(),
                ),
          ),
        ],
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: CustomSafeArea(
          padding: variables.defaultMarginPadding(),
          child: Column(
            children: [
              const Spacer(),
              SizeConfig.isPortrait
                  ? Column(
                      mainAxisSize: MainAxisSize.min,
                      children: _getChildren(
                        context: context,
                      ),
                    )
                  : Row(
                      mainAxisSize: MainAxisSize.min,
                      children: _getChildren(
                        context: context,
                      ),
                    ),
              const Spacer(),
              PrimaryTextButton(
                text: variables.translate(
                  context,
                  'home',
                )!,
                isActive: true,
                useGradient: true,
                useDefaultHeight: true,
                onTap: () {
                  // TODO: Check if the user is logged in order to determine redirect
                  // if (Provider.of<AuthNotifier>(
                  //   context,
                  //   listen: false,
                  // ).isLoggedIn) {
                  Navigator.pushReplacementNamed(
                    context,
                    routes.homePageRouteName,
                  );
                  // } else {
                  //   Navigator.pushReplacementNamed(
                  //     context,
                  //     routes.loginPageRouteName,
                  //   );
                  // }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
