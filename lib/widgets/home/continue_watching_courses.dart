import 'package:flutter/material.dart';

import 'package:codeit/data/courses.dart' as data_courses;

import 'package:codeit/routes/route_names.dart' as routes;

import 'package:codeit/static/variables.dart' as variables;

import 'package:codeit/utilities/custom_scroll_physics.dart';
import 'package:codeit/utilities/size_config.dart';

import 'package:codeit/widgets/home/continue_watching_course_card.dart';

class ContinueWatchingCourses extends StatefulWidget {
  const ContinueWatchingCourses({
    Key? key,
  }) : super(key: key);

  @override
  _ContinueWatchingCoursesState createState() =>
      _ContinueWatchingCoursesState();
}

class _ContinueWatchingCoursesState extends State<ContinueWatchingCourses> {
  late int _currentPage;

  @override
  void initState() {
    _currentPage = 0;

    super.initState();
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: variables.defaultDuration,
      curve: variables.defaultCurve,
      width: isActive ? 24 : 8,
      height: 8,
      margin: const EdgeInsets.symmetric(
        horizontal: 4,
      ),
      decoration: BoxDecoration(
        color: isActive
            ? Theme.of(context).colorScheme.secondary
            : Theme.of(context).brightness == Brightness.light
                ? Colors.black.withOpacity(
                    0.25,
                  )
                : Colors.white.withOpacity(
                    0.25,
                  ),
        borderRadius: const BorderRadius.all(
          Radius.circular(
            12,
          ),
        ),
      ),
    );
  }

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (var i = 0; i < data_courses.continueWatchingCourses.length; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  PageView _buildPageView() {
    return PageView.builder(
      clipBehavior: Clip.none,
      itemCount: data_courses.continueWatchingCourses.length,
      itemBuilder: (context, index) {
        return Center(
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                routes.coursePageRouteName,
                arguments: {
                  'course': data_courses.continueWatchingCourses[index],
                },
              );
            },
            child: Opacity(
              opacity: _currentPage == index ? 1 : 0.8,
              child: ContinueWatchingCourseCard(
                course: data_courses.continueWatchingCourses[index],
                isActive: _currentPage == index,
                isFirst: _currentPage == 0,
                isLast: _currentPage ==
                    data_courses.continueWatchingCourses.length - 1,
              ),
            ),
          ),
        );
      },
      controller: PageController(
        initialPage: 0,
        viewportFraction: 0.85,
      ),
      onPageChanged: (
        index,
      ) =>
          setState(
        () {
          _currentPage = index;
        },
      ),
    );
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
      itemCount: data_courses.continueWatchingCourses.length,
      itemBuilder: (
        context,
        index,
      ) {
        return Padding(
          padding: EdgeInsets.only(
            right: index != data_courses.continueWatchingCourses.length - 1
                ? 40
                : 0,
          ),
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                routes.coursePageRouteName,
                arguments: {
                  'course': data_courses.continueWatchingCourses[index],
                },
              );
            },
            child: ContinueWatchingCourseCard(
              course: data_courses.continueWatchingCourses[index],
            ),
          ),
        );
      },
    );
  }

  double _calculateHeight() {
    double sizeMultiplier =
        !SizeConfig.isTablet && SizeConfig.isPortrait ? 0.35 : 0.3;
    return sizeMultiplier *
            (SizeConfig.isPortrait
                ? SizeConfig.screenWidth
                : SizeConfig.screenHeight) +
        40;
  }

  @override
  Widget build(BuildContext context) {
    double _height = _calculateHeight();

    return Column(
      children: [
        SizedBox(
          height: _height,
          child: !SizeConfig.isTablet && SizeConfig.isPortrait
              ? _buildPageView()
              : Padding(
                  padding: const EdgeInsets.only(
                    top: 15,
                  ),
                  child: _buildListView(
                    itemDimension: _height,
                  ),
                ),
        ),
        !SizeConfig.isTablet && SizeConfig.isPortrait
            ? Padding(
                padding: const EdgeInsets.only(
                  top: 15,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _buildPageIndicator(),
                ),
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}
