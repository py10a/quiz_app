import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/common/widgets/gradient_background.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(context) {
    return GradientBackground(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
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
              decoration: TextDecoration.none,
            ),
          ),
          const SizedBox(height: 60),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(minimumSize: const Size(120, 45)),
            onPressed: () =>
                Navigator.of(context).pushReplacementNamed('/questions'),
            icon: const Icon(Icons.arrow_right),
            label: const Text('Start'),
          )
        ],
      ),
    );
  }
}
