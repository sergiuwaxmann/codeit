import 'package:flutter/material.dart';

import 'package:codeit/utilities/size_config.dart';

class SideMenuVerticalSizedBox extends StatelessWidget {
  const SideMenuVerticalSizedBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _sizeMultiplier = !SizeConfig.isTablet
        ? SizeConfig.isPortrait
            ? 0.08
            : 0.04
        : 0.05;

    return SizedBox(
      height: _sizeMultiplier *
          (SizeConfig.isPortrait
              ? SizeConfig.screenWidth
              : SizeConfig.screenHeight),
    );
  }
}
