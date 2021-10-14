import 'dart:io';

import 'package:flutter/material.dart';

import 'package:codeit/static/variables.dart' as variables;

class LoginTextField extends StatelessWidget {
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final IconData icon, cupertinoIcon;
  final String hint;
  final bool obscureText;
  final String? Function(String?) validator;
  final Function(String?) onSaved;
  final Function(String)? onFieldSubmitted;

  const LoginTextField({
    Key? key,
    required this.textInputType,
    required this.textInputAction,
    required this.icon,
    required this.cupertinoIcon,
    required this.hint,
    this.obscureText = false,
    required this.validator,
    required this.onSaved,
    this.onFieldSubmitted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: TextFormField(
        autocorrect: false,
        enableSuggestions: false,
        obscureText: obscureText,
        keyboardType: textInputType,
        textInputAction: textInputAction,
        cursorColor: Theme.of(context).colorScheme.secondary,
        style: Theme.of(context).textTheme.bodyText1!.copyWith(
              fontSize: variables.headline3FontSize(),
            ),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(
            20,
          ),
          prefixIcon: Icon(
            Platform.isIOS ? cupertinoIcon : icon,
            color: const Color(0xFF5488F1),
          ),
          hintText: hint,
          border: InputBorder.none,
          errorStyle: Theme.of(context).textTheme.bodyText2!.copyWith(
                fontSize: variables.bodyText1FontSize(),
                color: Colors.red.withOpacity(
                  0.8,
                ),
              ),
        ),
        validator: validator,
        onSaved: onSaved,
        onFieldSubmitted: onFieldSubmitted,
      ),
    );
  }
}
