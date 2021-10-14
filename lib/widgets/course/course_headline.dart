// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:codeit/models/course.dart';

import 'package:codeit/static/variables.dart' as variables;

import 'package:codeit/utilities/size_config.dart';

import 'package:codeit/widgets/course_logo.dart';

import 'package:codeit/widgets/course/close_square_button.dart';
import 'package:codeit/widgets/course/play_square_button.dart';

class CourseHeadline extends StatelessWidget {
  final Course course;

  const CourseHeadline({
    Key? key,
    required this.course,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _defaultMarginPadding = variables.defaultMarginPadding();

    String _translate({
      required String key,
    }) =>
        variables.translate(
          context,
          key,
        )!;

    return Stack(
      children: [
        Container(
          height: (SizeConfig.isPortrait ? 0.5 : 0.4) * SizeConfig.screenHeight,
          padding: const EdgeInsets.only(
            bottom: 20,
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                course.bgColor1,
                course.bgColor2,
              ],
            ),
            boxShadow: [
              BoxShadow(
                color: course.bgColor1.withOpacity(
                  0.25,
                ),
                offset: const Offset(
                  0,
                  20,
                ),
                blurRadius: 20,
              ),
              BoxShadow(
                color: course.bgColor2.withOpacity(
                  0.25,
                ),
                offset: const Offset(
                  0,
                  20,
                ),
                blurRadius: 20,
              ),
            ],
          ),
        ),
        !SizeConfig.isPortrait
            ? Container(
                height: (SizeConfig.isPortrait ? 0.5 : 0.4) *
                    SizeConfig.screenHeight,
                alignment: Alignment.centerRight,
                child: Hero(
                  tag: course.illustration,
                  child: Image.asset(
                    'assets/illustrations/${course.illustration}',
                    fit: BoxFit.fitWidth,
                    width: 0.5 * SizeConfig.screenWidth,
                  ),
                ),
              )
            : const SizedBox.shrink(),
        SizedBox(
          height: (SizeConfig.isPortrait ? 0.5 : 0.4) * SizeConfig.screenHeight,
          child: SafeArea(
            bottom: false,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: _defaultMarginPadding,
                    left: _defaultMarginPadding,
                    right: _defaultMarginPadding,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      course.logo != null
                          ? Hero(
                              tag: course.logo!,
                              child: CourseLogo(
                                course: course,
                                hasMargin: false,
                              ),
                            )
                          : const SizedBox.shrink(),
                      course.logo != null
                          ? const SizedBox(
                              width: 15,
                            )
                          : const SizedBox.shrink(),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Hero(
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
                                      fontSize: variables.headline2FontSize(),
                                      color: Colors.white.withOpacity(
                                        0.8,
                                      ),
                                    ),
                              ),
                            ),
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
                                      fontSize: 3 * SizeConfig.textMultiplier,
                                      color: Colors.white,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      CloseSquareButton(),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                SizeConfig.isPortrait
                    ? Expanded(
                        child: Hero(
                          tag: course.illustration,
                          child: Image.asset(
                            'assets/illustrations/${course.illustration}',
                            fit: BoxFit.cover,
                            width: SizeConfig.screenWidth,
                            alignment: Alignment.topCenter,
                          ),
                        ),
                      )
                    : const SizedBox.shrink(),
              ],
            ),
          ),
        ),
        Container(
          height:
              (SizeConfig.isPortrait ? 0.52 : 0.45) * SizeConfig.screenHeight,
          alignment: Alignment.bottomRight,
          child: SafeArea(
            bottom: false,
            child: PlaySquareButton(),
          ),
        ),
      ],
    );
  }
}
