import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultsTitle extends StatelessWidget {
  const ResultsTitle({
    super.key,
    required this.numCorrectAnswers,
    required this.numTotalQuestions,
  });

  final int numCorrectAnswers;
  final int numTotalQuestions;

  @override
  Widget build(BuildContext context) {
    return Text(
      'You answered $numCorrectAnswers out of $numTotalQuestions questions correctly.',
      textAlign: TextAlign.center,
      style: GoogleFonts.lato(
        color: const Color.fromARGB(201, 255, 255, 255),
        fontSize: 22,
        fontWeight: FontWeight.bold,
        decoration: TextDecoration.none,
      ),
    );
  }
}
