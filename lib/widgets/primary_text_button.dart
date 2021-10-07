import 'package:flutter/material.dart';

import 'package:codeit/static/colors.dart' as colors;
import 'package:codeit/static/variables.dart' as variables;

class PrimaryTextButton extends StatefulWidget {
  final String text;
  final bool isActive;
  final bool useGradient;
  final bool useSmallVariables; // Small border radius and small shadow
  final Function onTap;

  const PrimaryTextButton({
    Key? key,
    required this.text,
    this.isActive = false,
    this.useGradient = false,
    this.useSmallVariables = false,
    required this.onTap,
  }) : super(key: key);

  @override
  State<PrimaryTextButton> createState() => _PrimaryTextButtonState();
}

class _PrimaryTextButtonState extends State<PrimaryTextButton> {
  late bool _isButtonTapped;

  @override
  void initState() {
    _isButtonTapped = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(
          () {
            _isButtonTapped = true;
          },
        );
        Future.delayed(
          variables.defaultDuration,
          () {
            if (mounted) {
              setState(
                () {
                  _isButtonTapped = false;
                },
              );
            }
          },
        );
        widget.onTap();
      },
      child: AnimatedContainer(
        duration: variables.defaultDuration,
        curve: variables.defaultCurve,
        height: variables.defaultButtonSize(),
        padding: EdgeInsets.symmetric(
          horizontal: variables.defaultMarginPadding(),
        ),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: !widget.isActive
              ? Theme.of(context).highlightColor
              : !widget.useGradient
                  ? Theme.of(context).colorScheme.secondary
                  : null,
          gradient: widget.isActive && widget.useGradient
              ? const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFF73A0F4),
                    Color(0xFF4A47F5),
                  ],
                )
              : null,
          borderRadius: BorderRadius.circular(
            !widget.useSmallVariables
                ? variables.defaultBorderRadius
                : variables.smallBorderRadius,
          ),
          boxShadow: [
            Theme.of(context).brightness == Brightness.light
                ? !widget.useSmallVariables
                    ? !_isButtonTapped
                        ? variables.defaultBoxShadow
                        : variables.topDefaultBoxShadow
                    : !_isButtonTapped
                        ? variables.smallBoxShadow
                        : variables.topSmallBoxShadow
                : const BoxShadow(),
          ],
        ),
        child: Text(
          widget.text,
          style: Theme.of(context).textTheme.button!.copyWith(
                fontSize: variables.buttonFontSize(),
                color: widget.isActive
                    ? colors.getTextColorBasedOnColor(
                        color: Theme.of(context).colorScheme.secondary,
                      )
                    : null,
              ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
