import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';

import 'package:codeit/static/variables.dart' as variables;

import 'package:codeit/widgets/custom_safe_area.dart';
import 'package:codeit/utilities/size_config.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Stack(
          children: [
            Center(
              child: Lottie.asset(
                'assets/lotties/loading.json',
                width: SizeConfig.isPortrait
                    ? SizeConfig.screenWidth
                    : SizeConfig.screenHeight,
              ),
            ),
            CustomSafeArea(
              padding: variables.defaultMarginPadding(),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    variables.translate(
                      context,
                      'loading',
                    )!,
                    style: Theme.of(context).textTheme.headline1!.copyWith(
                          fontSize: variables.headline2FontSize(),
                        ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  LinearProgressIndicator(
                    color: Theme.of(context).accentColor,
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
