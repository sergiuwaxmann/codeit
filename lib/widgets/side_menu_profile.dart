import 'package:flutter/material.dart';

import 'package:codeit/static/variables.dart' as variables;

import 'package:codeit/utilities/size_config.dart';

class SideMenuProfile extends StatelessWidget {
  final Function onTap;

  const SideMenuProfile({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: !SizeConfig.isTablet ? 24 : 30,
            backgroundImage: const AssetImage(
              'assets/images/profile.jpg',
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  // TODO: Use the user's name
                  'Sergiu Waxmann',
                  style: Theme.of(context).textTheme.headline1!.copyWith(
                        fontSize: variables.headline2FontSize(),
                      ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                SizeConfig.isPortrait
                    ? const SizedBox(
                        height: 5,
                      )
                    : const SizedBox.shrink(),
                SizeConfig.isPortrait
                    ? Text(
                        // TODO: Use the user's subscription expiration time
                        'License ends on 01 Jan, 2022',
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              fontSize: variables.bodyText2FontSize(),
                            ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      )
                    : const SizedBox.shrink(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
