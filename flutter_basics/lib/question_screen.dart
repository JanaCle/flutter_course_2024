import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter_basics/answer_button.dart';
import 'package:flutter_basics/data/questions.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({
    super.key,
    required this.onSelectAnswer,
    required this.currentQuestionIndex,
  });

  final void Function(String answer) onSelectAnswer;
  final int currentQuestionIndex;

  @override
  State<QuestionScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      if (currentQuestionIndex == questions.length - 1) {
        currentQuestionIndex = 0;
        return;
      }
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];
    return SizedBox(
      width: double.infinity,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.question,
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 90, 67, 104),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            ...currentQuestion.getShuffledAnswers().map((answer) {
              return AnswerButton(
                answer: answer,
                onTap: () {
                  answerQuestion(answer);
                },
              );
            }),
            // AnswerButton(answer: currentQuestion.answers[0], onTap: () {}),
            // AnswerButton(answer: currentQuestion.answers[1], onTap: () {}),
            // AnswerButton(answer: currentQuestion.answers[2], onTap: () {}),
            // AnswerButton(answer: currentQuestion.answers[3], onTap: () {}),
          ],
        ),
      ),
    );
  }
}
