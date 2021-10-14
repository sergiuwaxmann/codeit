import 'package:flutter/material.dart';

import 'package:codeit/utilities/size_config.dart';

class HomeContentContainer extends StatelessWidget {
  final Widget child;

  const HomeContentContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: 0.05 * SizeConfig.screenHeight,
      ),
      child: child,
    );
  }
}
