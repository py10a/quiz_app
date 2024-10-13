import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/common/widgets/answer_button.dart';
import 'package:quiz_app/common/widgets/gradient_background.dart';
import 'package:quiz_app/features/quiz_questions/widgets/widgets.dart';
import 'package:quiz_app/providers/questions_provider.dart';

class QuestionsScreen extends StatelessWidget {
  const QuestionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientBackground(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Consumer<QuestionsProvider>(
            builder: (context, questionsProvider, child) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              QuestionTitle(questionsProvider.currentQuestion.question),
              const SizedBox(height: 32),
              Column(
                children: questionsProvider.currentQuestion
                    .getShuffledAnswers()
                    .map((answer) {
                  return AnswerButton(answer, onPressed: () {
                    bool isAnswered = questionsProvider.chooseAnswer(answer);
                    if (!isAnswered) {
                      Navigator.of(context).pushReplacementNamed('/results');
                    }
                  });
                }).toList(),
              ),
            ],
          );
        }),
      ),
    );
  }
}
