import 'package:flutter/material.dart';

import 'package:codeit/static/variables.dart' as variables;

class FormValidator {
  static String? validateEmail({
    required BuildContext context,
    required String value,
  }) {
    if (value.isEmpty) {
      return variables.translate(
        context,
        'email_empty',
      )!;
    }

    String pattern =
        r'^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$';
    RegExp regex = RegExp(pattern);

    if (!regex.hasMatch(value)) {
      return variables.translate(
        context,
        'email_invalid',
      )!;
    }

    return null;
  }

  static String? validatePassword({
    required BuildContext context,
    required String value,
  }) {
    if (value.isEmpty) {
      return variables.translate(
        context,
        'password_empty',
      )!;
    }

    if (value.length < 8) {
      return variables.translate(
        context,
        'password_invalid',
      )!;
    }

    return null;
  }
}
