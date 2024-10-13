import 'package:quiz_app/features/quiz_questions/quiz_questions.dart';
import 'package:quiz_app/features/quiz_results/quiz_results.dart';
import 'package:quiz_app/features/quiz_start/quiz_start.dart';

final routes = {
  '/start': (context) => StartScreen(),
  '/questions': (context) => QuestionsScreen(),
  '/results': (context) => ResultScreen(),
};
