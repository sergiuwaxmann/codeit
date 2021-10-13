import 'package:flutter/material.dart';

import 'package:codeit/models/course.dart';

import 'package:codeit/static/variables.dart' as variables;

import 'package:codeit/utilities/size_config.dart';

import 'package:codeit/widgets/home/course_logo.dart';

class ContinueWatchingCourseCard extends StatelessWidget {
  final Course course;
  final bool isActive, isFirst, isLast;

  const ContinueWatchingCourseCard({
    Key? key,
    required this.course,
    this.isActive = true,
    this.isFirst = false,
    this.isLast = false,
  }) : super(key: key);

  double _calculateWidth() {
    double sizeMultiplier =
        !SizeConfig.isTablet && SizeConfig.isPortrait ? 0.65 : 0.55;
    return sizeMultiplier *
        (SizeConfig.isPortrait
            ? SizeConfig.screenWidth
            : SizeConfig.screenHeight);
  }

  double _calculateHeight() {
    double sizeMultiplier =
        !SizeConfig.isTablet && SizeConfig.isPortrait ? 0.35 : 0.3;
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

    return AnimatedContainer(
      duration: variables.defaultDuration,
      curve: variables.defaultCurve,
      padding: EdgeInsets.only(
        top: isActive ? 0 : 20,
        left: isLast ? 40 : 0,
        right: isFirst ? 40 : 0,
      ),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: SizeConfig.isPortrait ? 20 : 10,
              right: SizeConfig.isPortrait ? 20 : 10,
            ),
            child: Container(
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
                          blurRadius: 20,
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
                          blurRadius: 20,
                        )
                      : const BoxShadow(),
                ],
              ),
              child: ClipRRect(
                borderRadius:
                    BorderRadius.circular(SizeConfig.isPortrait ? 40 : 30),
                child: SizedBox(
                  width: _calculateWidth(),
                  height: _calculateHeight(),
                  child: Stack(
                    children: [
                      Container(
                        alignment: Alignment.bottomRight,
                        child: Image.asset(
                          'assets/illustrations/${course.illustration}',
                          height: !SizeConfig.isTablet ? 100 : 150,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(
                          22,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _translate(
                                key: course.currentSectionKey!,
                              ),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(
                                    fontSize: variables.headline3FontSize(),
                                    color: Colors.white.withOpacity(
                                      0.8,
                                    ),
                                  ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
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
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const CourseLogo(
            course: null,
          ),
        ],
      ),
    );
  }
}
