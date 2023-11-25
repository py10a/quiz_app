import 'package:flutter/material.dart';

import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/start_screen.dart';
import 'package:quiz_app/questions_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  Widget? _screen;
  final List<String> choosedAnswers = [];

  @override
  void initState() {
    super.initState();
    _screen = StartScreen(setScreen);
  }

  void chooseAnswer(String answer) {
    choosedAnswers.add(answer);
    if (choosedAnswers.length == questions.length) {
      setState(() {
        _screen = StartScreen(setScreen);
        choosedAnswers.clear();
      });
    }
  }

  void setScreen() {
    setState(() {
      _screen = QuestionsScreen(
        onSelectedAnswer: chooseAnswer,
      );
    });
  }

  @override
  Widget build(context) {
    return MaterialApp(
      title: 'Quiz App',
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromARGB(255, 106, 27, 154),
                Color.fromARGB(255, 142, 38, 186),
              ],
            ),
          ),
          child: _screen,
        ),
      ),
    );
  }
}
