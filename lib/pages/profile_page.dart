// ignore_for_file: prefer_const_constructors

import 'package:codeit/widgets/profile/profile_timeline_courses.dart';
import 'package:flutter/material.dart';

import 'package:codeit/static/variables.dart' as variables;

import 'package:codeit/utilities/size_config.dart';

import 'package:codeit/widgets/custom_size_container.dart';
import 'package:codeit/widgets/custom_safe_area.dart';

import 'package:codeit/widgets/certificates_viewer.dart';

import 'package:codeit/widgets/profile/profile_badges.dart';
import 'package:codeit/widgets/profile/profile_header.dart';
import 'package:codeit/widgets/profile/profile_section.dart';
import 'package:codeit/widgets/profile/profile_user_details.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({
    Key? key,
  }) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late Size _headerSize;

  @override
  void initState() {
    _headerSize = Size.zero;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double _defaultMarginPadding = variables.defaultMarginPadding();

    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(
                top: _headerSize.height,
              ),
              child: SafeArea(
                top: false,
                child: Padding(
                  padding: EdgeInsets.all(
                    _defaultMarginPadding,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizeConfig.isPortrait
                          ? ProfileSection(
                              titleKey: 'certificates',
                            )
                          : const SizedBox.shrink(),
                      SizeConfig.isPortrait
                          ? CertificatesViewer()
                          : const SizedBox.shrink(),
                      ProfileSection(
                        titleKey: 'your_timeline',
                      ),
                      ProfileTimelineCourses(),
                    ],
                  ),
                ),
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
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Theme.of(context).highlightColor,
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(
                        variables.bigBorderRadius,
                      ),
                    ),
                    boxShadow: [
                      Theme.of(context).brightness == Brightness.light
                          ? variables.bottomDefaultBoxShadow
                          : const BoxShadow(),
                    ],
                  ),
                  child: CustomSafeArea(
                    bottom: false,
                    padding: _defaultMarginPadding,
                    child: Column(
                      children:
                          // ignore: prefer_const_literals_to_create_immutables
                          [
                        ProfileHeader(
                          settingsButton: true,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: _defaultMarginPadding,
                            bottom: SizeConfig.isPortrait
                                ? _defaultMarginPadding
                                : 0,
                          ),
                          child: ProfileUserDetails(),
                        ),
                        SizeConfig.isPortrait
                            ? ProfileBadges()
                            : const SizedBox.shrink(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
