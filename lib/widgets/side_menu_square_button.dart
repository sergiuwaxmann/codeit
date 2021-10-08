import 'package:flutter/material.dart';

import 'package:codeit/static/variables.dart' as variables;

class SideMenuSquareButton extends StatelessWidget {
  final IconData icon;
  final Color color1, color2;

  const SideMenuSquareButton({
    Key? key,
    required this.icon,
    required this.color1,
    required this.color2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _size = variables.defaultButtonSize();

    return Container(
      width: _size,
      height: _size,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            color1,
            color2,
          ],
        ),
        borderRadius: BorderRadius.circular(
          variables.defaultBorderRadius,
        ),
      ),
      child: Icon(
        icon,
        color: Colors.white,
      ),
    );
  }
}
