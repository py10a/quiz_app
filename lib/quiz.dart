import 'package:flutter/material.dart';

import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/pages/start_screen.dart';
import 'package:quiz_app/pages/questions_screen.dart';
import 'package:quiz_app/pages/results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  final List<String> choosedAnswers = [];
  String _currentScreen = "StartScreen";

  @override
  void initState() {
    super.initState();
    setScreen("StartScreen");
  }

  void chooseAnswer(String answer) {
    choosedAnswers.add(answer);
    if (choosedAnswers.length == questions.length) {
      setScreen("ResultScreen");
    }
  }

  void setScreen(String screen) {
    setState(() {
      _currentScreen = screen;
    });
  }

  @override
  Widget build(context) {
    Widget? _screen;

    switch (_currentScreen) {
      case "QuestionsScreen":
        choosedAnswers.clear();
        _screen = QuestionsScreen(
          onSelectedAnswer: chooseAnswer,
        );
        break;
      case "ResultScreen":
        _screen = ResultScreen(
          setScreen,
          choosedAnswers: choosedAnswers,
        );
        break;
      default:
        _screen = StartScreen(setScreen);
    }

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
