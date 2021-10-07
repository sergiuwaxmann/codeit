import 'package:flutter/material.dart';

class CustomSafeArea extends StatelessWidget {
  final bool top, bottom, left, right;
  final double padding;
  final Widget child;

  const CustomSafeArea({
    Key? key,
    this.top = true,
    this.bottom = true,
    this.left = true,
    this.right = true,
    required this.padding,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      left: left,
      right: right,
      top: top,
      bottom: bottom,
      child: Padding(
        padding: EdgeInsets.all(
          padding,
        ),
        child: child,
      ),
    );
  }
}
