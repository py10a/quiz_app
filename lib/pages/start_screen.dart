import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.setScreen, {super.key});

  final void Function(String screen) setScreen;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/quiz-logo.png',
            width: 300.0,
            color: const Color.fromARGB(200, 255, 255, 255),
          ),
          const SizedBox(height: 30),
          Text(
            'Start Flutter quiz now!',
            style: GoogleFonts.lato(
              color: Color.fromARGB(200, 255, 255, 255),
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 60,
          ),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(120, 45),
            ),
            onPressed: () {
              setScreen("QuestionsScreen");
            },
            icon: const Icon(Icons.arrow_right),
            label: const Text('Start'),
          )
        ],
      ),
    );
  }
}
