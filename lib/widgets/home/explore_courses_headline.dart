import 'package:flutter/material.dart';

import 'package:codeit/static/variables.dart' as variables;

import 'package:codeit/utilities/size_config.dart';

class ExploreCoursesHeadline extends StatelessWidget {
  const ExploreCoursesHeadline({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 15,
      ),
      alignment: Alignment.centerLeft,
      child: Text(
        variables.translate(
          context,
          'explore_courses',
        )!,
        style: Theme.of(context).textTheme.headline1!.copyWith(
              fontSize: 2.8 * SizeConfig.textMultiplier,
            ),
      ),
    );
  }
}
