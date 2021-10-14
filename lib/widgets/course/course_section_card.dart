import 'package:flutter/material.dart';

import 'package:codeit/models/course_section.dart';

import 'package:codeit/static/variables.dart' as variables;

import 'package:codeit/utilities/size_config.dart';

class CourseSectionCard extends StatelessWidget {
  final CourseSection courseSection;

  const CourseSectionCard({
    Key? key,
    required this.courseSection,
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

    return SafeArea(
      top: false,
      bottom: false,
      child: Container(
        height: (SizeConfig.isPortrait
                ? 0.15
                : (!SizeConfig.isTablet ? 0.25 : 0.2)) *
            SizeConfig.screenHeight,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              courseSection.bgColor1,
              courseSection.bgColor2,
            ],
          ),
          borderRadius: BorderRadius.circular(SizeConfig.isPortrait ? 40 : 30),
          boxShadow: [
            BoxShadow(
              color: courseSection.bgColor1.withOpacity(
                0.25,
              ),
              offset: const Offset(
                0,
                20,
              ),
              blurRadius: 30,
            ),
            BoxShadow(
              color: courseSection.bgColor2.withOpacity(
                0.25,
              ),
              offset: const Offset(
                0,
                20,
              ),
              blurRadius: 30,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(SizeConfig.isPortrait ? 40 : 30),
          child: Padding(
            padding: EdgeInsets.only(
              left: SizeConfig.isPortrait ? 32 : 22,
            ),
            child: Stack(
              children: [
                Container(
                  alignment: Alignment.centerRight,
                  child: Image.asset(
                    'assets/illustrations/${courseSection.illustration}',
                    fit: BoxFit.cover,
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _translate(
                                  key: 'section',
                                ) +
                                ' ' +
                                courseSection.sectionNumber.toString(),
                            style:
                                Theme.of(context).textTheme.bodyText2!.copyWith(
                                      fontSize: variables.headline3FontSize(),
                                      color: Colors.white.withOpacity(
                                        0.8,
                                      ),
                                    ),
                          ),
                          Text(
                            _translate(
                              key: courseSection.titleKey,
                            ),
                            style: Theme.of(context)
                                .textTheme
                                .headline1!
                                .copyWith(
                                  fontSize: (SizeConfig.isPortrait ? 2 : 2.2) *
                                      SizeConfig.textMultiplier,
                                  color: Colors.white,
                                ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
