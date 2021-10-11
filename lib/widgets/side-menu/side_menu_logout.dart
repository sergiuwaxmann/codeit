import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'package:codeit/static/variables.dart' as variables;

import 'package:codeit/utilities/size_config.dart';

class SideMenuLogout extends StatelessWidget {
  final Function onTap;

  const SideMenuLogout({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Row(
        children: [
          SvgPicture.asset(
            Theme.of(context).brightness == Brightness.light
                ? 'assets/icons/logout.svg'
                : 'assets/icons/logout-dark.svg',
            width: 15,
            // fit: BoxFit.scaleDown,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            variables.translate(
              context,
              'logout',
            )!,
            style: Theme.of(context).textTheme.bodyText2!.copyWith(
                  fontSize: (!SizeConfig.isTablet ? 2 : 1.5) *
                      SizeConfig.textMultiplier,
                ),
          )
        ],
      ),
    );
  }
}
