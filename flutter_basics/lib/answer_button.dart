import 'package:flutter/material.dart';

final buttonStyle = ElevatedButton.styleFrom(
    foregroundColor: const Color.fromARGB(255, 174, 128, 188));

class AnswerButton extends StatelessWidget {
  const AnswerButton({super.key, required this.answer, required this.onTap});

  final String answer;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
        foregroundColor: const Color.fromARGB(255, 174, 128, 188),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
      ),
      child: Text(
        answer,
        textAlign: TextAlign.center,
      ),
    );
  }
}
