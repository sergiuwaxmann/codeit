import 'package:flutter/material.dart';

import 'package:codeit/data/courses.dart' as data_courses;

import 'package:codeit/routes/route_names.dart' as routes;

import 'package:codeit/utilities/custom_scroll_physics.dart';
import 'package:codeit/utilities/size_config.dart';

import 'package:codeit/widgets/profile/profile_timeline_course_card.dart';

class ProfileTimelineCourses extends StatelessWidget {
  const ProfileTimelineCourses({
    Key? key,
  }) : super(key: key);

  double _calculateHeight() {
    double sizeMultiplier =
        !SizeConfig.isTablet && SizeConfig.isPortrait ? 0.35 : 0.275;
    return sizeMultiplier *
            (SizeConfig.isPortrait
                ? SizeConfig.screenWidth
                : SizeConfig.screenHeight) +
        20;
  }

  ListView _buildListView({
    required double itemDimension,
  }) {
    return ListView.builder(
      clipBehavior: Clip.none,
      scrollDirection: Axis.horizontal,
      physics: CustomScrollPhysics(
        itemDimension: itemDimension,
      ),
      itemCount: data_courses.completedCourses.length,
      itemBuilder: (
        context,
        index,
      ) {
        return Container(
          margin: EdgeInsets.only(
            right: index != data_courses.completedCourses.length - 1 ? 20 : 0,
          ),
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                routes.coursePageRouteName,
                arguments: {
                  'course': data_courses.completedCourses[index],
                },
              );
            },
            child: ProfileTimelineCourseCard(
              course: data_courses.completedCourses[index],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double _height = _calculateHeight();

    return Container(
      height: _height,
      margin: const EdgeInsets.only(
        top: 15,
      ),
      child: _buildListView(
        itemDimension: _height,
      ),
    );
  }
}
