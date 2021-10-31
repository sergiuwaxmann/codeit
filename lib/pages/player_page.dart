import 'package:flutter/material.dart';

import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

import 'package:codeit/static/variables.dart' as variables;

import 'package:codeit/widgets/close_square_button.dart';
import 'package:codeit/widgets/custom_safe_area.dart';

class PlayerPage extends StatefulWidget {
  final VideoPlayerController videoPlayerController;

  const PlayerPage({
    Key? key,
    required this.videoPlayerController,
  }) : super(key: key);

  @override
  _PlayerPageState createState() => _PlayerPageState();
}

class _PlayerPageState extends State<PlayerPage> {
  late ChewieController _chewieController;

  @override
  void initState() {
    _chewieController = ChewieController(
      videoPlayerController: widget.videoPlayerController,
      aspectRatio: 16 / 9,
      autoInitialize: true,
    );
    super.initState();
  }

  @override
  void dispose() {
    widget.videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double _defaultMarginPadding = variables.defaultMarginPadding();

    return Scaffold(
      body: Stack(
        children: [
          CustomSafeArea(
            padding: _defaultMarginPadding,
            child: Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(
                  variables.defaultBorderRadius,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      Theme.of(context).brightness == Brightness.light
                          ? variables.bottomSmallBoxShadow
                          : const BoxShadow(),
                    ],
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Chewie(
                      controller: _chewieController,
                    ),
                  ),
                ),
              ),
            ),
          ),
          CustomSafeArea(
            padding: _defaultMarginPadding,
            child: Container(
              alignment: Alignment.topRight,
              child:
                  // ignore: prefer_const_constructors
                  CloseSquareButton(),
            ),
          ),
        ],
      ),
    );
  }
}
