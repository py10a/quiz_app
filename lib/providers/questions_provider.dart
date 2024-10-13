import 'package:flutter/material.dart';
import 'package:quiz_app/models/quiz_question.dart';

class QuestionsProvider with ChangeNotifier {
  int _currentQuestionIndex = 0;
  final List<String> _chosenAnswers = [];
  final List<QuizQuestion> _questions = [
    QuizQuestion(
      'What are the main building blocks of Flutter UIs?',
      [
        'Widgets',
        'Components',
        'Blocks',
        'Functions',
      ],
    ),
    QuizQuestion('How are Flutter UIs built?', [
      'By combining widgets in code',
      'By combining widgets in a visual editor',
      'By defining widgets in config files',
      'By using XCode for iOS and Android Studio for Android',
    ]),
    QuizQuestion(
      'What\'s the purpose of a StatefulWidget?',
      [
        'Update UI as data changes',
        'Update data as UI changes',
        'Ignore data changes',
        'Render UI that does not depend on data',
      ],
    ),
    QuizQuestion(
      'Which widget should you try to use more often: StatelessWidget or StatefulWidget?',
      [
        'StatelessWidget',
        'StatefulWidget',
        'Both are equally good',
        'None of the above',
      ],
    ),
    QuizQuestion(
      'What happens if you change data in a StatelessWidget?',
      [
        'The UI is not updated',
        'The UI is updated',
        'The closest StatefulWidget is updated',
        'Any nested StatefulWidgets are updated',
      ],
    ),
    QuizQuestion(
      'How should you update data inside of StatefulWidgets?',
      [
        'By calling setState()',
        'By calling updateData()',
        'By calling updateUI()',
        'By calling updateState()',
      ],
    ),
  ];

  List<QuizQuestion> get questions => _questions;
  QuizQuestion get currentQuestion => _questions[_currentQuestionIndex];
  List<String> get chosenAnswers => _chosenAnswers;

  bool chooseAnswer(String answer) {
    if (_currentQuestionIndex < _questions.length - 1) {
      _chosenAnswers.add(answer);
      _currentQuestionIndex++;
      notifyListeners();
      return true;
    } else if (_currentQuestionIndex == _questions.length - 1) {
      _chosenAnswers.add(answer);
      notifyListeners();
      return false;
    }
    return false;
  }

  void reset() {
    _currentQuestionIndex = 0;
    _chosenAnswers.clear();
    notifyListeners();
  }
}
