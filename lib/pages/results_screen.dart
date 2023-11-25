import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/widgets/question_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
    this.setScreen, {
    super.key,
    required this.choosedAnswers,
  });

  final List<String> choosedAnswers;
  final void Function(String screen) setScreen;

  /// Returns a list of maps containing the question
  ///   - index,
  ///   - question text,
  ///   - user answer,
  ///   - correct answer.
  List<Map<String, Object>> getSummary() {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < choosedAnswers.length; i++) {
      summary.add(
        {
          'question_index': i,
          'question_text': questions[i].question,
          'user_answer': choosedAnswers[i],
          'correct_answer': questions[i].answers[0],
        },
      );
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummary();
    final int numTotalAnswers = questions.length;
    final int numCorrectAnswers = summaryData.where((answer) {
      return answer['user_answer'] == answer['correct_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'You answered $numCorrectAnswers out of $numTotalAnswers questions correctly.',
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                color: const Color.fromARGB(201, 255, 255, 255),
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 50),
            QuestionSummary(getSummary()),
            const SizedBox(height: 50),
            TextButton.icon(
              onPressed: () {
                setScreen("QuestionsScreen");
              },
              icon: const Icon(
                Icons.restart_alt,
                color: Color.fromARGB(201, 255, 255, 255),
              ),
              label: Text(
                'Restart',
                style: GoogleFonts.lato(
                  color: const Color.fromARGB(201, 255, 255, 255),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
