import 'package:flutter/material.dart';

import 'package:codeit/data/courses.dart' as data_courses;

import 'package:codeit/utilities/size_config.dart';

import 'package:codeit/widgets/home/explore_course_card.dart';

class ExploreCourses extends StatelessWidget {
  const ExploreCourses({
    Key? key,
  }) : super(key: key);

  double _calculateHeight() {
    double sizeMultiplier =
        !SizeConfig.isTablet && SizeConfig.isPortrait ? 0.3 : 0.2;
    return sizeMultiplier *
        (SizeConfig.isPortrait
            ? SizeConfig.screenWidth
            : SizeConfig.screenHeight);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _calculateHeight(),
      child: ListView.builder(
        // shrinkWrap: true,
        clipBehavior: Clip.none,
        scrollDirection: Axis.horizontal,
        itemCount: data_courses.exploreCourses.length,
        itemBuilder: (
          context,
          index,
        ) {
          return Container(
            margin: EdgeInsets.only(
              right: index != data_courses.exploreCourses.length - 1 ? 20 : 0,
            ),
            child: GestureDetector(
              onTap: () {
                // TODO: Course Page
              },
              child: ExploreCourseCard(
                course: data_courses.exploreCourses[index],
              ),
            ),
          );
        },
      ),
    );
  }
}
