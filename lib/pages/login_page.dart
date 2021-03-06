// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:codeit/utilities/size_config.dart';

import 'package:codeit/widgets/login/background_svg.dart';
import 'package:codeit/widgets/login/login_actions.dart';
import 'package:codeit/widgets/login/login_headline.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ! Probably not the best practice
    bool _isKeyboardShown = MediaQuery.of(context).viewInsets.bottom != 0;

    return WillPopScope(
      onWillPop: () async => false,
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          body: Stack(
            children: [
              !_isKeyboardShown
                  ? BackgroundSvg(
                      svg: 'assets/backgrounds/background-login.svg',
                    )
                  : const SizedBox.shrink(),
              SizeConfig.isPortrait && !_isKeyboardShown
                  ? LoginHeadline()
                  : const SizedBox.shrink(),
              SizeConfig.isPortrait
                  ? LoginActions()
                  : Center(
                      child: SingleChildScrollView(
                        child: LoginActions(),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
