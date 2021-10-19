import 'package:flutter/material.dart';

import 'package:codeit/models/course.dart';

import 'package:codeit/static/variables.dart' as variables;

import 'package:codeit/utilities/size_config.dart';

import 'package:codeit/widgets/course_logo.dart';

class ProfileTimelineCourseCard extends StatelessWidget {
  final Course course;

  const ProfileTimelineCourseCard({
    Key? key,
    required this.course,
  }) : super(key: key);

  double _calculateWidth() {
    double sizeMultiplier =
        !SizeConfig.isTablet && SizeConfig.isPortrait ? 0.65 : 0.55;
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

    return Stack(
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
                BoxShadow(
                  color: course.bgColor1.withOpacity(
                    0.25,
                  ),
                  offset: const Offset(
                    0,
                    20,
                  ),
                  blurRadius: 30,
                ),
                BoxShadow(
                  color: course.bgColor2.withOpacity(
                    0.25,
                  ),
                  offset: const Offset(
                    0,
                    20,
                  ),
                  blurRadius: 30,
                )
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(
                SizeConfig.isPortrait ? 40 : 30,
              ),
              child: SizedBox(
                width: _calculateWidth(),
                child: Stack(
                  children: [
                    Container(
                      alignment: Alignment.bottomRight,
                      child: Image.asset(
                        'assets/illustrations/${course.illustration}',
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
                            course.subtitleKey == null
                                ? course.sectionsCount.toString() +
                                    ' ' +
                                    _translate(
                                      key: 'sections',
                                    )
                                : _translate(
                                    key: course.subtitleKey!,
                                  ),
                            style:
                                Theme.of(context).textTheme.bodyText2!.copyWith(
                                      fontSize: variables.bodyText1FontSize(),
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
                            style:
                                Theme.of(context).textTheme.headline1!.copyWith(
                                      fontSize: SizeConfig.isPortrait
                                          ? variables.headline2FontSize()
                                          : variables.headline3FontSize(),
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
        course.subtitleKey == null
            ?
            // ignore: prefer_const_constructors
            CourseLogo(
                course: null,
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}
