import 'package:flutter/material.dart';

import 'package:sliding_up_panel/sliding_up_panel.dart';

import 'package:codeit/static/variables.dart' as variables;
import 'package:codeit/static/colors.dart' as colors;

import 'package:codeit/utilities/size_config.dart';

import 'package:codeit/widgets/home/certificates_viewer.dart';
import 'package:codeit/widgets/home/continue_watching_courses.dart';

class ContinueWatchingPanel extends StatefulWidget {
  const ContinueWatchingPanel({
    Key? key,
  }) : super(key: key);

  @override
  _ContinueWatchingPanelState createState() => _ContinueWatchingPanelState();
}

class _ContinueWatchingPanelState extends State<ContinueWatchingPanel> {
  late bool _isOpened;

  @override
  void initState() {
    _isOpened = false;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double _headline1FontSize = variables.headline1FontSize();

    String _translate({
      required String key,
    }) =>
        variables.translate(
          context,
          key,
        )!;

    return SlidingUpPanel(
      backdropEnabled: true,
      backdropColor: colors.overlayColor,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(
          variables.bigBorderRadius,
        ),
      ),
      color: Theme.of(context).highlightColor,
      boxShadow: [
        Theme.of(context).brightness == Brightness.light
            ? variables.topBigBoxShadow
            : const BoxShadow(),
      ],
      minHeight: 0.1 * SizeConfig.screenHeight,
      maxHeight: (!SizeConfig.isTablet
              ? (SizeConfig.isPortrait ? 0.7 : 0.6)
              : SizeConfig.isPortrait
                  ? 0.4
                  : 0.5) *
          SizeConfig.screenHeight,
      onPanelSlide: (
        position,
      ) =>
          setState(
        () {
          _isOpened = position > 0.1 ? true : false;
        },
      ),
      panel: SafeArea(
        top: false,
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: 0.05 *
                (SizeConfig.isPortrait
                    ? SizeConfig.screenWidth
                    : SizeConfig.screenHeight),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: !_isOpened ? 0.1 * SizeConfig.screenHeight : null,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        width: 42,
                        height: 4,
                        margin: EdgeInsets.symmetric(
                          vertical: (SizeConfig.isPortrait ? 0.015 : 0.01) *
                              SizeConfig.screenHeight,
                        ),
                        decoration: BoxDecoration(
                          color:
                              Theme.of(context).brightness == Brightness.light
                                  ? Colors.black.withOpacity(
                                      0.25,
                                    )
                                  : Colors.white.withOpacity(
                                      0.25,
                                    ),
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                    ),
                    Text(
                      _translate(
                        key: 'continue_watching',
                      ),
                      style: Theme.of(context).textTheme.headline1!.copyWith(
                            fontSize: _headline1FontSize,
                          ),
                    ),
                  ],
                ),
              ),
              !SizeConfig.isPortrait ? const Spacer() : const SizedBox.shrink(),
              const ContinueWatchingCourses(),
              !SizeConfig.isTablet && SizeConfig.isPortrait
                  ? Container(
                      margin: const EdgeInsets.only(
                        top: 30,
                      ),
                      child: Text(
                        _translate(
                          key: 'certificates',
                        ),
                        style: Theme.of(context).textTheme.headline1!.copyWith(
                              fontSize: _headline1FontSize,
                            ),
                      ),
                    )
                  : const SizedBox.shrink(),
              !SizeConfig.isTablet && SizeConfig.isPortrait
                  ? const Expanded(
                      child: CertificatesViewer(),
                    )
                  : const SizedBox.shrink(),
              SizeConfig.isTablet || !SizeConfig.isPortrait
                  ? const Spacer()
                  : const SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}
