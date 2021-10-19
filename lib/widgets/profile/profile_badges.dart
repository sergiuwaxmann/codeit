import 'package:flutter/material.dart';

import 'package:codeit/utilities/size_config.dart';

import 'package:codeit/widgets/profile/profile_section.dart';

class ProfileBadges extends StatelessWidget {
  const ProfileBadges({
    Key? key,
  }) : super(key: key);

  static const List<String> _badges = [
    'badge-1.png',
    'badge-2.png',
    'badge-3.png',
    'badge-4.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // ignore: prefer_const_constructors
        ProfileSection(
          titleKey: 'badges',
        ),
        SizedBox(
          height: (SizeConfig.isPortrait ? 0.1 : 0.2) * SizeConfig.screenHeight,
          child: ListView.builder(
            clipBehavior: Clip.none,
            scrollDirection: Axis.horizontal,
            itemCount: _badges.length,
            itemBuilder: (
              _,
              index,
            ) {
              return Container(
                margin: EdgeInsets.only(
                  right: index != _badges.length - 1
                      ? 0.025 *
                          (SizeConfig.isPortrait
                              ? SizeConfig.screenWidth
                              : SizeConfig.screenHeight)
                      : 0,
                ),
                child: Image.asset('assets/badges/${_badges[index]}'),
              );
            },
          ),
        ),
      ],
    );
  }
}
