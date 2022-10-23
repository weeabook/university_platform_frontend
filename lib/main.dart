import 'package:flutter/material.dart';

import 'presentation/pages/main_page.dart';

void main() {
  runApp(const PlatfoemApp());
}

class PlatfoemApp extends StatelessWidget {
  const PlatfoemApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(),
    );
  }
}
