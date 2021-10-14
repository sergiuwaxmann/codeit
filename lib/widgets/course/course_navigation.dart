import 'package:flutter/material.dart';

class CourseNavigation extends StatelessWidget {
  const CourseNavigation({
    Key? key,
  }) : super(key: key);

  Row _buildIndicators(
    BuildContext context,
  ) {
    List<Widget> indicators = [];

    for (var i = 0; i < 9; i++) {
      indicators.add(
        Container(
          width: i == 0 ? 24 : 8,
          height: 8,
          margin: const EdgeInsets.symmetric(
            horizontal: 4,
          ),
          decoration: BoxDecoration(
            color: i == 0
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
        ),
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: indicators,
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildIndicators(context);
  }
}
