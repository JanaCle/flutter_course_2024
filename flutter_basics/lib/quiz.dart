import 'package:flutter/material.dart';
import 'package:flutter_basics/question_screen.dart';
import 'package:flutter_basics/start_screen.dart';
import 'package:flutter_basics/data/questions.dart';
import 'package:flutter_basics/answer_screen.dart';

const Color textColor = Color(0xFFFCE4EC);
var activeScreen = "start-screen";

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  int currentQuestionIndex = 0;
  List<String> selectedAnswers = [];

  void switchScreen() {
    setState(() {
      currentQuestionIndex = 0;
      activeScreen = "questions-screen";
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
      });
    } else {
      setState(() {
        activeScreen = "answer-screen";
      });
    }
  }

  void resetQuiz() {
    setState(() {
      activeScreen = "start-screen";
      selectedAnswers = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(switchScreen);
    if (activeScreen == "questions-screen") {
      screenWidget = QuestionScreen(
        onSelectAnswer: chooseAnswer,
        currentQuestionIndex: currentQuestionIndex,
      );
    }
    if (activeScreen == 'answer-screen') {
      screenWidget = AnswerScreen(
        chosenAnswers: selectedAnswers,
        resetQuiz: resetQuiz,
      );
    }
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color.fromRGBO(171, 116, 180, 1), Color(0xFFE6CDF7)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
