import 'package:flutter/material.dart';

import 'package:codeit/static/variables.dart' as variables;

import 'package:codeit/utilities/size_config.dart';

class RecentCoursesHeadline extends StatelessWidget {
  const RecentCoursesHeadline({
    Key? key,
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

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          _translate(
            key: 'recent_courses',
          ),
          style: Theme.of(context).textTheme.headline1!.copyWith(
                fontSize: 2.8 * SizeConfig.textMultiplier,
              ),
        ),
        SizeConfig.isPortrait
            ? const SizedBox(
                height: 5,
              )
            : const SizedBox.shrink(),
        Text(
          _translate(
            key: 'recent_courses_description',
          ),
          style: Theme.of(context).textTheme.bodyText2!.copyWith(
                fontSize: variables.headline3FontSize(),
              ),
        ),
      ],
    );
  }
}
