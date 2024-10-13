import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton(
    this.text, {
    required this.onPressed,
    super.key,
  });

  final String text;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: Size.fromWidth(100000),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        backgroundColor: const Color.fromARGB(255, 142, 33, 243),
        shape: StadiumBorder(),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: GoogleFonts.lato(
          color: const Color.fromARGB(230, 255, 255, 255),
          fontSize: 16,
        ),
      ),
    );
  }
}
