import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'package:codeit/utilities/size_config.dart';

class BackgroundSvg extends StatelessWidget {
  final String svg;

  const BackgroundSvg({
    Key? key,
    required this.svg,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizeConfig.isPortrait
        ? SvgPicture.asset(
            svg,
            width: double.infinity,
            fit: BoxFit.cover,
          )
        : const SizedBox.shrink();
  }
}
