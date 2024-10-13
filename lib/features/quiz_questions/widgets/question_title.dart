import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionTitle extends StatelessWidget {
  const QuestionTitle(this.title, {super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: TextAlign.center,
      style: GoogleFonts.lato(
        color: Color.fromARGB(201, 255, 255, 255),
        fontSize: 24,
        fontWeight: FontWeight.bold,
        decoration: TextDecoration.none,
      ),
    );
  }
}
