import 'package:flutter/material.dart';
import 'package:quiz_app/models/quiz_question.dart';
import 'package:quiz_app/providers/questions_provider.dart';

class SummaryProvider with ChangeNotifier {
  final QuestionsProvider? _questionsProvider;
  late final List<QuizQuestion> _questions;
  late final List<String> _answers;
  late List<Map<String, Object>> _summary;

  List<Map<String, Object>> get summary => _summary;
  int get totalQuestions => _questions.length;
  int get correctAnswers => _summary
      .where((answer) => answer['user_answer'] == answer['correct_answer'])
      .length;

  SummaryProvider(this._questionsProvider) : _summary = [] {
    if (_questionsProvider != null) {
      _questions = _questionsProvider.questions;
      _answers = _questionsProvider.chosenAnswers;
      _summary = generateSummary();
    } else {
      _questions = [];
      _answers = [];
    }
  }

  List<Map<String, Object>> generateSummary() {
    final List<Map<String, Object>> cp = [];
    for (var i = 0; i < _questions.length; i++) {
      cp.add(
        {
          'question_index': i,
          'question_text': _questions[i].question,
          'user_answer': _answers[i],
          'correct_answer': _questions[i]
              .answers[0], // Correct answer is always the first one
        },
      );
    }
    return cp;
  }

  void reset() {
    _questionsProvider?.reset();
    notifyListeners();
  }
}
