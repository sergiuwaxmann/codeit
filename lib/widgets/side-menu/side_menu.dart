import 'package:flutter/material.dart';

import 'package:codeit/static/colors.dart' as colors;
import 'package:codeit/static/variables.dart' as variables;

import 'package:codeit/widgets/custom_safe_area.dart';

import 'package:codeit/widgets/side-menu/side_menu_content.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  SideMenuState createState() => SideMenuState();
}

class SideMenuState extends State<SideMenu> with TickerProviderStateMixin {
  late AnimationController _sideMenuAnimationController;

  late Animation<Offset> _sideMenuAnimation;

  late Animation<double> _fadeAnimation;

  late bool isSideMenuHidden;

  @override
  void initState() {
    _sideMenuAnimationController = AnimationController(
      vsync: this,
      duration: variables.defaultDuration,
    );

    _sideMenuAnimation = Tween<Offset>(
      begin: const Offset(
        -1,
        0,
      ),
      end: const Offset(
        0,
        0,
      ),
    ).animate(
      CurvedAnimation(
        parent: _sideMenuAnimationController,
        curve: variables.defaultCurve,
      ),
    );

    _fadeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _sideMenuAnimationController,
        curve: variables.defaultCurve,
      ),
    );

    isSideMenuHidden = true;

    super.initState();
  }

  Future<void> toggleSideMenu() async {
    if (isSideMenuHidden) {
      await _sideMenuAnimationController.forward();
    } else {
      await _sideMenuAnimationController.reverse();
    }

    setState(
      () {
        isSideMenuHidden = !isSideMenuHidden;
      },
    );
  }

  @override
  void dispose() {
    _sideMenuAnimationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: isSideMenuHidden,
      child: Stack(
        children: [
          FadeTransition(
            opacity: _fadeAnimation,
            child: GestureDetector(
              onTap: () => toggleSideMenu(),
              child: Container(
                color: colors.overlayColor,
              ),
            ),
          ),
          SlideTransition(
            position: _sideMenuAnimation,
            child: CustomSafeArea(
              bottom: false,
              left: false,
              right: false,
              padding: 0,
              child: SideMenuContent(
                toggleSideMenu: () => toggleSideMenu(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
