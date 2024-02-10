import 'package:flutter/material.dart';
import 'package:flutter_basics/data/questions.dart';
import 'package:flutter_basics/question_summary.dart';

class AnswerScreen extends StatefulWidget {
  const AnswerScreen({super.key, required this.chosenAnswers, required this.resetQuiz});

  final List<String> chosenAnswers;
  final void Function() resetQuiz;
  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        "question_index": i,
        "question": questions[i].question,
        "correct_answer": questions[i].answers[0],
        "user_answer": chosenAnswers[i],
      });
    }
    return summary;
  }

  @override
  State<AnswerScreen> createState() {
    return _AnswerScreenState();
  }
}

class _AnswerScreenState extends State<AnswerScreen> {
  @override
  Widget build(BuildContext context) {
    final numTotalQuestions = questions.length;
    final numRightQuestions = widget.getSummaryData().where((data) {
      return data['correct_answer'] == data['user_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
                "Your answered $numRightQuestions out of $numTotalQuestions questions correctly!", // Heading for the summary
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18,
                  color: Color.fromARGB(255, 255, 255, 255),
                )),
            const SizedBox(height: 10),
            QuestionSummary(
              widget.getSummaryData()),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                setState(() {
                  widget.resetQuiz();
                });
              },
              icon: const Icon(
                Icons.refresh_rounded,
                size: 15.0,
              ),
              label: const Text('Restart quiz'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                foregroundColor: Colors.white,
              )
            ),
          ],
        ),
      ),
    );
  }
}
