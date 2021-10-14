import 'package:flutter/material.dart';

import 'package:codeit/static/variables.dart' as variables;

class ViewAllButton extends StatelessWidget {
  final Function onTap;

  const ViewAllButton({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        alignment: Alignment.center,
        height: variables.defaultButtonSize(),
        padding: EdgeInsets.symmetric(
          horizontal: variables.defaultMarginPadding(),
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(
            variables.defaultBorderRadius,
          ),
          boxShadow: [
            Theme.of(context).brightness == Brightness.light
                ? variables.bottomSmallBoxShadow
                : const BoxShadow(),
          ],
        ),
        child: Text(
          variables.translate(
            context,
            'view_sections',
          )!,
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                fontSize: variables.buttonFontSize(),
                color: Colors.black,
              ),
        ),
      ),
    );
  }
}
