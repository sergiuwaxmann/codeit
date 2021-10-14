import 'package:flutter/material.dart';

import 'package:codeit/static/variables.dart' as variables;

import 'package:codeit/utilities/size_config.dart';

class CourseSectionsHeadline extends StatelessWidget {
  const CourseSectionsHeadline({
    Key? key,
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

    return Container(
      height: 0.1 * SizeConfig.screenHeight,
      decoration: BoxDecoration(
        color: Theme.of(context).highlightColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(
            variables.bigBorderRadius,
          ),
          bottomLeft: Radius.circular(
            variables.bigBorderRadius,
          ),
        ),
        boxShadow: [
          Theme.of(context).brightness == Brightness.light
              ? variables.topBigBoxShadow
              : const BoxShadow(),
        ],
      ),
      child: Stack(
        children: [
          Container(
            alignment: Alignment.topCenter,
            child: Container(
              width: 42,
              height: 4,
              margin: EdgeInsets.only(
                top: (SizeConfig.isPortrait ? 0.015 : 0.01) *
                    SizeConfig.screenHeight,
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).brightness == Brightness.light
                    ? Colors.black.withOpacity(
                        0.25,
                      )
                    : Colors.white.withOpacity(
                        0.25,
                      ),
                borderRadius: BorderRadius.circular(
                  2,
                ),
              ),
            ),
          ),
          SafeArea(
            top: false,
            bottom: false,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: variables.defaultMarginPadding(),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(),
                  Text(
                    _translate(
                      key: 'course_sections',
                    ),
                    style: Theme.of(context).textTheme.headline1!.copyWith(
                          fontSize: variables.headline1FontSize(),
                        ),
                  ),
                  SizeConfig.isPortrait
                      ? Text(
                          '12 ' +
                              _translate(
                                key: 'sections',
                              ),
                          style:
                              Theme.of(context).textTheme.bodyText2!.copyWith(
                                    fontSize: variables.headline2FontSize(),
                                  ),
                        )
                      : const SizedBox.shrink(),
                  const Spacer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
