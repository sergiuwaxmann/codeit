// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:sliding_up_panel/sliding_up_panel.dart';

import 'package:codeit/models/course.dart';

import 'package:codeit/static/variables.dart' as variables;
import 'package:codeit/static/colors.dart' as colors;

import 'package:codeit/utilities/size_config.dart';

import 'package:codeit/widgets/course/course_headline.dart';
import 'package:codeit/widgets/course/course_navigation.dart';
import 'package:codeit/widgets/course/course_sections_panel_content.dart';
import 'package:codeit/widgets/course/course_stats.dart';
import 'package:codeit/widgets/course/course_text_content.dart';
import 'package:codeit/widgets/course/view_all_button.dart';

class CoursePage extends StatefulWidget {
  final Course course;

  const CoursePage({
    Key? key,
    required this.course,
  }) : super(key: key);

  @override
  _CoursePageState createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  late PanelController _panelController;

  @override
  void initState() {
    _panelController = PanelController();

    super.initState();
  }

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

    return Scaffold(
      body: SlidingUpPanel(
        controller: _panelController,
        color: Theme.of(context).primaryColor,
        backdropEnabled: true,
        backdropColor: colors.overlayColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(
            variables.bigBorderRadius,
          ),
        ),
        boxShadow: [
          Theme.of(context).brightness == Brightness.light
              ? variables.topBigBoxShadow
              : const BoxShadow(),
        ],
        minHeight: 0,
        maxHeight: 0.9 * SizeConfig.screenHeight,
        panel: CourseSectionsPanelContent(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              CourseHeadline(
                course: widget.course,
              ),
              SafeArea(
                top: false,
                child: Padding(
                  padding: EdgeInsets.only(
                    left: _defaultMarginPadding,
                    right: _defaultMarginPadding,
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          top: SizeConfig.isPortrait ? 30 : 15,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CourseStats(
                              course: widget.course,
                              icon: Platform.isIOS
                                  ? CupertinoIcons.group_solid
                                  : Icons.people_rounded,
                              value: '28.7k',
                              description: _translate(
                                key: 'students',
                              ),
                            ),
                            CourseStats(
                              course: widget.course,
                              icon: Platform.isIOS
                                  ? CupertinoIcons.chat_bubble_2_fill
                                  : Icons.forum_rounded,
                              value: '12.4k',
                              description: _translate(
                                key: 'comments',
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: SizeConfig.isPortrait ? 30 : 15,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CourseNavigation(),
                            ViewAllButton(
                              onTap: () => _panelController.open(),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          bottom: _defaultMarginPadding,
                        ),
                        child: CourseTextContent(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
