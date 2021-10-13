import 'package:flutter/material.dart';

import 'package:codeit/models/course.dart';

import 'package:codeit/static/variables.dart' as variables;

import 'package:codeit/utilities/size_config.dart';

class ExploreCourseCard extends StatelessWidget {
  final Course course;

  const ExploreCourseCard({
    Key? key,
    required this.course,
  }) : super(key: key);

  double _calculateWidth() {
    double sizeMultiplier =
        !SizeConfig.isTablet && SizeConfig.isPortrait ? 0.7 : 0.6;
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

    return ClipRRect(
      borderRadius: BorderRadius.circular(SizeConfig.isPortrait ? 40 : 30),
      child: Container(
        width: _calculateWidth(),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              course.bgColor1,
              course.bgColor2,
            ],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(
            left: SizeConfig.isPortrait ? 32 : 22,
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizeConfig.isTablet || SizeConfig.isPortrait
                        ? Text(
                            course.sectionsCount.toString() +
                                ' ' +
                                _translate(
                                  key: 'sections',
                                ),
                            style:
                                Theme.of(context).textTheme.bodyText2!.copyWith(
                                      fontSize: 1.5 * SizeConfig.textMultiplier,
                                      color: Colors.white.withOpacity(
                                        0.8,
                                      ),
                                    ),
                          )
                        : const SizedBox.shrink(),
                    SizeConfig.isPortrait
                        ? const SizedBox(
                            height: 5,
                          )
                        : const SizedBox.shrink(),
                    Text(
                      _translate(
                        key: course.titleKey,
                      ),
                      style: Theme.of(context).textTheme.headline1!.copyWith(
                            fontSize: SizeConfig.isPortrait
                                ? variables.headline2FontSize()
                                : variables.headline3FontSize(),
                            color: Colors.white,
                          ),
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.bottomRight,
                child: Image.asset(
                  'assets/illustrations/${course.illustration}',
                  fit: BoxFit.cover,
                  height: !SizeConfig.isTablet ? 100 : 150,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
