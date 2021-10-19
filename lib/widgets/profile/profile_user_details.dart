import 'package:flutter/material.dart';

import 'package:codeit/static/variables.dart' as variables;

import 'package:codeit/utilities/size_config.dart';

class ProfileUserDetails extends StatelessWidget {
  const ProfileUserDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(
            6,
          ),
          decoration: BoxDecoration(
            gradient: const RadialGradient(
              colors: [
                Color(0xFF00AEFF),
                Color(0xFF0075FF),
              ],
            ),
            borderRadius: BorderRadius.circular(
              42,
            ),
          ),
          child: Container(
            padding: const EdgeInsets.all(
              6,
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).highlightColor,
              borderRadius: BorderRadius.circular(42),
            ),
            child: CircleAvatar(
              backgroundImage: const AssetImage(
                'assets/images/profile.jpg',
              ),
              radius: SizeConfig.isPortrait || SizeConfig.isTablet ? 25 : 20,
            ),
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Sergiu Waxmann',
              style: Theme.of(context).textTheme.headline1!.copyWith(
                    fontSize: 2.2 * SizeConfig.textMultiplier,
                  ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              'License ends on 01 Jan, 2022',
              style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    fontSize: variables.headline3FontSize(),
                  ),
            ),
          ],
        ),
      ],
    );
  }
}
