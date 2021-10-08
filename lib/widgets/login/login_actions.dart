import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:codeit/routes/route_names.dart' as routes;

import 'package:codeit/static/variables.dart' as variables;

import 'package:codeit/utilities/form_validator.dart';
import 'package:codeit/utilities/size_config.dart';

import 'package:codeit/widgets/custom_safe_area.dart';
import 'package:codeit/widgets/primary_text_button.dart';

import 'package:codeit/widgets/login/login_text_field.dart';

class LoginActions extends StatefulWidget {
  const LoginActions({
    Key? key,
  }) : super(key: key);

  @override
  _LoginActionsState createState() => _LoginActionsState();
}

class _LoginActionsState extends State<LoginActions> {
  late final GlobalKey<FormState> _formKey;

  late bool _isFormValid;

  late String _email, _password;

  @override
  void initState() {
    _formKey = GlobalKey<FormState>();

    _isFormValid = true;

    super.initState();
  }

  Future<void> _trySubmit() async {
    _isFormValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (_isFormValid) {
      _formKey.currentState!.save();
      await _login(
        email: _email,
        password: _password,
      );
      // TODO: Check if the user is logged in before redirect
      // if (Provider.of<AuthNotifier>(
      //   context,
      //   listen: false,
      // ).isLoggedIn) {
      Navigator.pushReplacementNamed(
        context,
        routes.homePageRouteName,
      );
      // }
    }
  }

  Future<void> _login({
    required String email,
    required String password,
  }) async {
    // TODO: Log in
  }

  @override
  Widget build(BuildContext context) {
    final double _titleFontSize = 3 * SizeConfig.textMultiplier;
    final double _headline3FontSize = variables.headline3FontSize();

    String _translate({
      required String key,
    }) =>
        variables.translate(
          context,
          key,
        )!;

    final Color _bottomTextColor =
        Theme.of(context).brightness == Brightness.light
            ? const Color(0xFF1B1E9C).withOpacity(
                0.5,
              )
            : Colors.white.withOpacity(
                0.8,
              );

    return CustomSafeArea(
      padding: variables.defaultMarginPadding(),
      child: Container(
        alignment: Alignment.bottomCenter,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              _translate(
                key: 'login_actions_title_1',
              ),
              style: Theme.of(context).textTheme.headline1!.copyWith(
                    fontSize: _titleFontSize,
                  ),
            ),
            Text(
              _translate(
                key: 'login_actions_title_2',
              ),
              style: Theme.of(context).textTheme.headline1!.copyWith(
                    fontSize: _titleFontSize,
                    color: const Color(0xFF5B4CF0),
                  ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              padding: EdgeInsets.symmetric(
                vertical: !_isFormValid ? (!SizeConfig.isTablet ? 10 : 15) : 0,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  variables.defaultBorderRadius,
                ),
                color: Theme.of(context).brightness == Brightness.light
                    ? const Color(0xFFFAFCFF)
                    : Theme.of(context).highlightColor,
                boxShadow: [
                  Theme.of(context).brightness == Brightness.light &&
                          SizeConfig.isPortrait
                      ? variables.bottomDefaultBoxShadow
                      : const BoxShadow(),
                ],
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    LoginTextField(
                      textInputType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      icon: Icons.mail_rounded,
                      cupertinoIcon: CupertinoIcons.mail_solid,
                      hint: _translate(
                        key: 'email',
                      ),
                      validator: (
                        value,
                      ) =>
                          FormValidator.validateEmail(
                        context: context,
                        value: value!,
                      ),
                      onSaved: (
                        value,
                      ) =>
                          _email = value!.trim(),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: Divider(
                        color: Theme.of(context).brightness == Brightness.light
                            ? Colors.black.withOpacity(
                                0.25,
                              )
                            : Colors.white.withOpacity(
                                0.25,
                              ),
                      ),
                    ),
                    LoginTextField(
                      textInputType: TextInputType.text,
                      textInputAction: TextInputAction.go,
                      icon: Icons.lock_rounded,
                      cupertinoIcon: CupertinoIcons.lock_fill,
                      hint: _translate(
                        key: 'password',
                      ),
                      obscureText: true,
                      validator: (
                        value,
                      ) =>
                          FormValidator.validatePassword(
                        context: context,
                        value: value!,
                      ),
                      onSaved: (
                        value,
                      ) =>
                          _password = value!.trim(),
                      onFieldSubmitted: (
                        _,
                      ) =>
                          _trySubmit(),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              width: (SizeConfig.isPortrait ? 0.325 : 0.25) *
                  SizeConfig.screenWidth,
              child: PrimaryTextButton(
                text: _translate(
                  key: 'login',
                ),
                isActive: true,
                useGradient: true,
                onTap: _trySubmit,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    FocusScope.of(context).unfocus();
                    // ignore: avoid_print
                    print(
                      "Email: waxmann.sergiu@me.com",
                    );
                    // ignore: avoid_print
                    print(
                      "Password: CodeIT22",
                    );
                  },
                  child: Text(
                    _translate(
                      key: 'forgot_password',
                    ),
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: _headline3FontSize,
                          color: _bottomTextColor,
                        ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    FocusScope.of(context).unfocus();

                    // TODO: Register Page
                  },
                  child: Text(
                    _translate(
                      key: 'register',
                    ),
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: _headline3FontSize,
                          color: _bottomTextColor,
                        ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
