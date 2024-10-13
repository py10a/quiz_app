import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/common/widgets/gradient_background.dart';
import 'package:quiz_app/features/quiz_results/widgets/results_title.dart';
import 'package:quiz_app/features/quiz_results/widgets/summary.dart';
import 'package:quiz_app/providers/summary_provider.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final SummaryProvider summaryProvider = context.read<SummaryProvider>();
    final int numCorrectAnswers = summaryProvider.correctAnswers;
    final int numTotalQuestions = summaryProvider.totalQuestions;
    final List<Map<String, Object>> summary = summaryProvider.summary;

    return GradientBackground(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ResultsTitle(
            numCorrectAnswers: numCorrectAnswers,
            numTotalQuestions: numTotalQuestions,
          ),
          const SizedBox(height: 50),
          Summary(summary: summary),
          const SizedBox(height: 50),
          TextButton.icon(
            onPressed: () {
              // TODO 1: Reset the summaryProvider and navigate to the QuestionsScreen
              summaryProvider.reset();
              Navigator.of(context).pushReplacementNamed('/questions');
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
    );
  }
}
