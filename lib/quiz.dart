import 'package:flutter/material.dart';
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

  @override
  void initState() {
    super.initState();
    _screen = StartScreen(setScreen);
  }

  void setScreen() {
    setState(() {
      _screen = const QuestionsScreen();
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
