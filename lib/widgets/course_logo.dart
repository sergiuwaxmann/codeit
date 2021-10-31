import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:video_player/video_player.dart';

import 'package:codeit/models/course.dart';

import 'package:codeit/routes/route_names.dart' as routes;

import 'package:codeit/static/variables.dart' as variables;

import 'package:codeit/utilities/size_config.dart';

class CourseLogo extends StatelessWidget {
  final Course? course;
  final bool hasMargin;

  const CourseLogo({
    Key? key,
    required this.course,
    this.hasMargin = true,
  }) : super(key: key);

  double _calculateSize() {
    double sizeMultiplier =
        !SizeConfig.isTablet ? (SizeConfig.isPortrait ? 0.13 : 0.1) : 0.08;
    return sizeMultiplier *
        (SizeConfig.isPortrait
            ? SizeConfig.screenWidth
            : SizeConfig.screenHeight);
  }

  @override
  Widget build(BuildContext context) {
    double _size = _calculateSize();

    return Padding(
      padding: EdgeInsets.only(
        right: course != null && hasMargin
            ? _size / (SizeConfig.isPortrait ? 1 : 1.5)
            : 0,
      ),
      child: GestureDetector(
        onTap: course != null
            ? () {}
            : () async {
                VideoPlayerController videoPlayerController =
                    VideoPlayerController.network(
                  'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
                );
                await videoPlayerController.initialize();
                Navigator.pushNamed(
                  context,
                  routes.playerPageRouteName,
                  arguments: {
                    'videoPlayerController': videoPlayerController,
                  },
                );
              },
        child: Container(
          width: _size,
          height: _size,
          padding: const EdgeInsets.all(
            8,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(
              variables.defaultBorderRadius,
            ),
            boxShadow: [
              variables.bottomSmallBoxShadow,
            ],
          ),
          child: SvgPicture.asset(
            course != null
                ? 'assets/logos/${course!.logo}'
                : 'assets/icons/play.svg',
          ),
        ),
      ),
    );
  }
}
