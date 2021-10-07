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
          backgroundColor: Theme.of(context).brightness == Brightness.light
              ? const Color(0xFFF1F4FB)
              : null,
          body: Stack(
            children: [
              !_isKeyboardShown
                  ?
                  // ignore: prefer_const_constructors
                  BackgroundSvg(
                      svg: 'assets/backgrounds/background-login.svg',
                    )
                  : const SizedBox.shrink(),
              SizeConfig.isPortrait && !_isKeyboardShown
                  ? const LoginHeadline()
                  : const SizedBox.shrink(),
              SizeConfig.isPortrait
                  ? const LoginActions()
                  : const Center(
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
