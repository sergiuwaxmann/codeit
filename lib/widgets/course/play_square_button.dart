import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'package:codeit/static/variables.dart' as variables;

import 'package:codeit/utilities/size_config.dart';

class PlaySquareButton extends StatelessWidget {
  const PlaySquareButton({
    Key? key,
  }) : super(key: key);

  double _calculateSize() {
    double sizeMultiplier = !SizeConfig.isTablet
        ? (SizeConfig.isPortrait ? 0.15 : 0.12)
        : (SizeConfig.isPortrait ? 0.1 : 0.085);
    return sizeMultiplier *
        (SizeConfig.isPortrait
            ? SizeConfig.screenWidth
            : SizeConfig.screenHeight);
  }

  @override
  Widget build(BuildContext context) {
    double _size = _calculateSize();

    return GestureDetector(
      onTap: () {
        // TODO: Player Page
      },
      child: Container(
        width: _size,
        height: _size,
        margin: EdgeInsets.only(
          right: _size * 1.2,
        ),
        padding: const EdgeInsets.all(
          12,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(
            variables.defaultBorderRadius,
          ),
          boxShadow: [
            variables.bottomSmallBoxShadow,
          ],
        ),
        child: SvgPicture.asset(
          'assets/icons/play.svg',
        ),
      ),
    );
  }
}
