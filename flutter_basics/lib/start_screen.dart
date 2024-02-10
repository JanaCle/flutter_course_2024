import 'package:flutter/material.dart';

const Color textColor = Color(0xFFFCE4EC);

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 200,
            color: const Color.fromARGB(79, 255, 255, 255),
          ),
          const Padding(
            padding: EdgeInsets.only(
                top: 20), // Ensure the padding is applied correctly
            child: Text(
              "Learn flutter the fun way!",
              style: TextStyle(fontSize: 20, color: textColor),
            ),
          ),
          const SizedBox(height: 30),
          OutlinedButton.icon(
              onPressed: () {
                startQuiz();
              },
              style: TextButton.styleFrom(
                  foregroundColor: textColor,
                  padding: const EdgeInsets.all(15)),
              icon: const Icon(Icons.play_arrow_rounded),
              label: const Text("Start Quiz")),
        ],
      ),
    );
  }
}
