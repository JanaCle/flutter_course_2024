import 'package:flutter/material.dart';
import 'package:flutter_application_test/dice_roller.dart';
// import 'package:flutter_application_test/text.dart';

class GradientContainer extends StatelessWidget {
  const GradientContainer({super.key, required this.colorList});

  GradientContainer.purple({super.key})
      : colorList = [Colors.purple, Colors.deepPurple];
  final List<Color> colorList;

  @override
  Widget build(context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colorList,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: const Center(
        child: DiceRoller(),
      ),
    );
  }
}
