import 'package:flutter/material.dart';

import 'package:codeit/data/courses.dart' as data_courses;

import 'package:codeit/static/variables.dart' as variables;

import 'package:codeit/utilities/custom_scroll_physics.dart';
import 'package:codeit/utilities/size_config.dart';

import 'package:codeit/widgets/home/recent_course_card.dart';

class RecentCourses extends StatefulWidget {
  const RecentCourses({
    Key? key,
  }) : super(key: key);

  @override
  _RecentCoursesState createState() => _RecentCoursesState();
}

class _RecentCoursesState extends State<RecentCourses> {
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
    for (var i = 0; i < data_courses.recentCourses.length; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  PageView _buildPageView() {
    return PageView.builder(
      clipBehavior: Clip.none,
      itemCount: data_courses.recentCourses.length,
      itemBuilder: (context, index) {
        return Center(
          child: GestureDetector(
            onTap: () {
              // TODO: Course Page
            },
            child: Opacity(
              opacity: _currentPage == index ? 1 : 0.8,
              child: RecentCourseCard(
                course: data_courses.recentCourses[index],
                isActive: _currentPage == index,
                isFirst: _currentPage == 0,
                isLast: _currentPage == data_courses.recentCourses.length - 1,
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

  ListView _buildListView({itemDimension}) {
    return ListView.builder(
      clipBehavior: Clip.none,
      scrollDirection: Axis.horizontal,
      physics: CustomScrollPhysics(
        itemDimension: itemDimension,
      ),
      itemCount: data_courses.recentCourses.length,
      itemBuilder: (
        context,
        index,
      ) {
        return Container(
          margin: EdgeInsets.only(
            right: index != data_courses.recentCourses.length - 1 ? 40 : 0,
          ),
          child: GestureDetector(
            onTap: () {
              // TODO: Course Page
            },
            child: RecentCourseCard(
              course: data_courses.recentCourses[index],
            ),
          ),
        );
      },
    );
  }

  double _calculateHeight() {
    double sizeMultiplier =
        !SizeConfig.isTablet && SizeConfig.isPortrait ? 0.6 : 0.4;
    return sizeMultiplier *
            (SizeConfig.isPortrait
                ? SizeConfig.screenWidth
                : SizeConfig.screenHeight) +
        40;
  }

  @override
  Widget build(BuildContext context) {
    double _height = _calculateHeight();

    if (!SizeConfig.isPortrait && _currentPage != 0) {
      _currentPage = 0;
    }

    return Column(
      children: [
        SizedBox(
          height: _height,
          child: !SizeConfig.isTablet && SizeConfig.isPortrait
              ? _buildPageView()
              : Container(
                  margin: const EdgeInsets.only(
                    top: 15,
                  ),
                  child: _buildListView(
                    itemDimension: _height,
                  ),
                ),
        ),
        !SizeConfig.isTablet && SizeConfig.isPortrait
            ? Container(
                margin: const EdgeInsets.only(
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
