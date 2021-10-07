import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'package:codeit/static/variables.dart' as variables;

import 'package:codeit/utilities/size_config.dart';

import 'package:codeit/widgets/custom_safe_area.dart';

class LoginHeadline extends StatelessWidget {
  const LoginHeadline({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double _defaultMarginPadding = variables.defaultMarginPadding();

    String _translate({
      required String key,
    }) =>
        variables.translate(
          context,
          key,
        )!;

    return CustomSafeArea(
      padding: _defaultMarginPadding,
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.only(
          top: !SizeConfig.isTablet
              ? _defaultMarginPadding
              : 0.15 * SizeConfig.screenWidth,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              _translate(
                key: 'login_title',
              ),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline1!.copyWith(
                    fontSize: 3 * SizeConfig.textMultiplier,
                    color: Colors.white,
                  ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              _translate(
                key: 'login_subtitle',
              ),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontSize: variables.headline2FontSize(),
                    color: Colors.white.withOpacity(
                      0.8,
                    ),
                  ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              width: 0.6 * SizeConfig.screenWidth,
              margin: EdgeInsets.only(
                left: 0.2 * SizeConfig.screenWidth,
              ),
              child: SvgPicture.asset(
                "assets/illustrations/login.svg",
                fit: BoxFit.scaleDown,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
