import 'package:flutter/material.dart';

import 'package:codeit/static/variables.dart' as variables;

class SelectionItem extends StatelessWidget {
  final String title;
  final bool isActive;
  final Function onTap;

  const SelectionItem({
    Key? key,
    required this.title,
    required this.isActive,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        width: double.infinity,
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontSize: variables.bodyText1FontSize(),
                  ),
            ),
            AnimatedOpacity(
              duration: variables.defaultDuration,
              opacity: isActive ? 1 : 0,
              child: const Icon(
                Icons.check_rounded,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
