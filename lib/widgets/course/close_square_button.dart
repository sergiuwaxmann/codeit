import 'package:flutter/material.dart';

import 'package:codeit/static/variables.dart' as variables;

class CloseSquareButton extends StatelessWidget {
  const CloseSquareButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _size = variables.defaultButtonSize();

    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Container(
        width: _size,
        height: _size,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            14,
          ),
          color: const Color(0xFF242629).withOpacity(
            0.8,
          ),
        ),
        child: const Icon(
          Icons.close,
          color: Colors.white,
        ),
      ),
    );
  }
}
