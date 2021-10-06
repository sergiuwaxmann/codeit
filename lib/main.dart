import 'package:flutter/material.dart';

void main() {
  runApp(
    const CodeITApp(),
  );
}

class CodeITApp extends StatelessWidget {
  const CodeITApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Code IT',
      home: Scaffold(),
    );
  }
}
