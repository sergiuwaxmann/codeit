import 'package:flutter/material.dart';

import 'package:codeit/models/course.dart';

import 'package:codeit/static/variables.dart' as variables;

import 'package:codeit/utilities/size_config.dart';

import 'package:codeit/widgets/home/course_logo.dart';

class RecentCourseCard extends StatelessWidget {
  final Course course;
  final bool isActive, isFirst, isLast;

  const RecentCourseCard({
    Key? key,
    required this.course,
    this.isActive = true,
    this.isFirst = false,
    this.isLast = false,
  }) : super(key: key);

  double _calculateSize() {
    double sizeMultiplier =
        !SizeConfig.isTablet && SizeConfig.isPortrait ? 0.6 : 0.4;
    return sizeMultiplier *
        (SizeConfig.isPortrait
            ? SizeConfig.screenWidth
            : SizeConfig.screenHeight);
  }

  @override
  Widget build(BuildContext context) {
    String _translate({
      required String key,
    }) =>
        variables.translate(
          context,
          key,
        )!;

    double _size = _calculateSize();

    double _padding = SizeConfig.isPortrait ? 32 : 22;

    return AnimatedContainer(
      duration: variables.defaultDuration,
      curve: variables.defaultCurve,
      padding: EdgeInsets.only(
        top: isActive ? 0 : 20,
        left: isLast ? 60 : 0,
        right: isFirst ? 60 : 0,
      ),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 20,
            ),
            child: Container(
              width: _size,
              height: _size,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    course.bgColor1,
                    course.bgColor2,
                  ],
                ),
                borderRadius:
                    BorderRadius.circular(SizeConfig.isPortrait ? 40 : 30),
                boxShadow: [
                  isActive
                      ? BoxShadow(
                          color: course.bgColor1.withOpacity(
                            0.25,
                          ),
                          offset: const Offset(
                            0,
                            20,
                          ),
                          blurRadius: 30,
                        )
                      : const BoxShadow(),
                  isActive
                      ? BoxShadow(
                          color: course.bgColor2.withOpacity(
                            0.25,
                          ),
                          offset: const Offset(
                            0,
                            20,
                          ),
                          blurRadius: 30,
                        )
                      : const BoxShadow(),
                ],
              ),
              child: ClipRRect(
                borderRadius:
                    BorderRadius.circular(SizeConfig.isPortrait ? 40 : 30),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: _padding,
                        left: _padding,
                        right: _padding,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizeConfig.isTablet || SizeConfig.isPortrait
                              ? Hero(
                                  tag: _translate(
                                        key: course.titleKey,
                                      ) +
                                      course.illustration,
                                  child: Text(
                                    course.sectionsCount.toString() +
                                        ' ' +
                                        _translate(
                                          key: 'sections',
                                        ),
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2!
                                        .copyWith(
                                          fontSize:
                                              variables.headline3FontSize(),
                                          color: Colors.white.withOpacity(
                                            0.8,
                                          ),
                                        ),
                                  ),
                                )
                              : const SizedBox.shrink(),
                          SizeConfig.isPortrait
                              ? const SizedBox(
                                  height: 5,
                                )
                              : const SizedBox.shrink(),
                          Hero(
                            tag: _translate(
                              key: course.titleKey,
                            ),
                            child: Text(
                              _translate(
                                key: course.titleKey,
                              ),
                              style: Theme.of(context)
                                  .textTheme
                                  .headline1!
                                  .copyWith(
                                    fontSize:
                                        (SizeConfig.isPortrait ? 2.8 : 2.3) *
                                            SizeConfig.textMultiplier,
                                    color: Colors.white,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(
                          left: SizeConfig.isTablet && !SizeConfig.isPortrait
                              ? 30
                              : 0,
                        ),
                        alignment: Alignment.bottomRight,
                        child: Hero(
                          tag: course.illustration,
                          child: Image.asset(
                            'assets/illustrations/${course.illustration}',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Hero(
            tag: course.logo!,
            child: CourseLogo(
              course: course,
            ),
          ),
        ],
      ),
    );
  }
}
