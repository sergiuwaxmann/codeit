import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'package:codeit/static/variables.dart' as variables;

class HomeHeaderMenuButton extends StatelessWidget {
  final Function onTap;

  const HomeHeaderMenuButton({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _size = variables.defaultButtonSize();

    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        width: _size,
        height: _size,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            variables.defaultBorderRadius,
          ),
          color: Theme.of(context).highlightColor,
          boxShadow: [
            Theme.of(context).brightness == Brightness.light
                ? variables.bottomSmallBoxShadow
                : const BoxShadow(),
          ],
        ),
        child: SvgPicture.asset(
          Theme.of(context).brightness == Brightness.light
              ? 'assets/icons/menu.svg'
              : 'assets/icons/menu-dark.svg',
          fit: BoxFit.scaleDown,
        ),
      ),
    );
  }
}
