import 'package:flutter/material.dart';

import 'package:flutter_application_test/gradient_container.dart';

void main() {
  runApp(const MyApp());
}

// With Flutter, you create user interfaces by combining "widgets"
// You'll learn all about them (and much more) throughout this course!
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter First App',
      theme: ThemeData(useMaterial3: true),
      home: Scaffold(
        // body: GradientContainer(colorList: [Color.fromARGB(255, 0, 0, 200), Color.fromARGB(100, 150, 0, 150)],),
        body: GradientContainer.purple(),
      ),
    );
  }
}