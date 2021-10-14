import 'package:flutter/material.dart';

import 'package:codeit/static/variables.dart' as variables;

class CourseTextContent extends StatelessWidget {
  const CourseTextContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Section 01',
          style: Theme.of(context).textTheme.bodyText2!.copyWith(
                fontSize: variables.headline2FontSize(),
              ),
        ),
        Text(
          'Introduction to Flutter & Dart',
          style: Theme.of(context).textTheme.headline1!.copyWith(
                fontSize: variables.headline1FontSize(),
              ),
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          'Flutter is a relatively new toolkit that makes it easy to build cross-platform apps that look gorgeous. Flutter offers hot reload for fast development and access to beautiful, native components. By utilizing a platform\'s native components we\'ll build an app that can run on both iOS and Android that will look and feel like it was developed natively. Furthermore we\'ll see how with one single codebase, Flutter provides us with native performance.',
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                fontSize: variables.headline3FontSize(),
              ),
        ),
      ],
    );
  }
}
