import 'package:flutter/material.dart';

import 'package:codeit/static/variables.dart' as variables;

class ProfileSection extends StatelessWidget {
  final String titleKey;

  const ProfileSection({
    Key? key,
    required this.titleKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String _translate({
      required String key,
    }) =>
        variables.translate(
          context,
          key,
        )!;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          _translate(
            key: titleKey,
          ),
          style: Theme.of(context).textTheme.headline1!.copyWith(
                fontSize: variables.headline2FontSize(),
              ),
        ),
        Row(
          children: [
            Text(
              _translate(
                key: 'view_all',
              ),
              style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    fontSize: variables.headline3FontSize(),
                  ),
            ),
            Icon(
              Icons.chevron_right,
              color: Theme.of(context).brightness == Brightness.light
                  ? Colors.black.withOpacity(
                      0.6,
                    )
                  : Colors.white.withOpacity(
                      0.6,
                    ),
            ),
          ],
        ),
      ],
    );
  }
}
