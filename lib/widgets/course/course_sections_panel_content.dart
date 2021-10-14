import 'package:flutter/material.dart';

import 'package:codeit/data/courses.dart' as data_courses;

import 'package:codeit/static/variables.dart' as variables;

import 'package:codeit/widgets/custom_safe_area.dart';
import 'package:codeit/widgets/custom_size_container.dart';

import 'package:codeit/widgets/course/course_section_card.dart';
import 'package:codeit/widgets/course/course_sections_headline.dart';

class CourseSectionsPanelContent extends StatefulWidget {
  const CourseSectionsPanelContent({
    Key? key,
  }) : super(key: key);

  @override
  State<CourseSectionsPanelContent> createState() =>
      _CourseSectionsPanelContentState();
}

class _CourseSectionsPanelContentState
    extends State<CourseSectionsPanelContent> {
  late Size _headerSize;

  @override
  void initState() {
    _headerSize = Size.zero;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double _headline3FontSize = variables.headline3FontSize();

    double _defaultMarginPadding = variables.defaultMarginPadding();

    String _translate({
      required String key,
    }) =>
        variables.translate(
          context,
          key,
        )!;

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(
            variables.bigBorderRadius,
          ),
        ),
      ),
      child: Stack(
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.only(
              top: _headerSize.height,
            ),
            child: CustomSafeArea(
              top: false,
              padding: variables.defaultMarginPadding(),
              child: Column(
                children: [
                  for (var courseSection in data_courses.courseSections)
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            bottom: data_courses.courseSections
                                        .indexOf(courseSection) !=
                                    data_courses.courseSections.length - 1
                                ? _defaultMarginPadding
                                : 0,
                          ),
                          child: CourseSectionCard(
                            courseSection: courseSection,
                          ),
                        ),
                      ],
                    ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: _defaultMarginPadding,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          _translate(
                            key: 'end_sections_1',
                          ),
                          style:
                              Theme.of(context).textTheme.bodyText2!.copyWith(
                                    fontSize: _headline3FontSize,
                                  ),
                        ),
                        Text(
                          _translate(
                            key: 'end_sections_2',
                          ),
                          style:
                              Theme.of(context).textTheme.bodyText2!.copyWith(
                                    fontSize: _headline3FontSize,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        Text(
                          _translate(
                            key: 'end_sections_3',
                          ),
                          style:
                              Theme.of(context).textTheme.bodyText2!.copyWith(
                                    fontSize: _headline3FontSize,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Column(
            children: [
              CustomSizeContainer(
                onChange: (
                  Size size,
                ) {
                  setState(
                    () {
                      _headerSize = size;
                    },
                  );
                },
                child:
                    // ignore: prefer_const_constructors
                    CourseSectionsHeadline(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
