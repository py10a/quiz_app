import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.setScreen, {super.key});

  final void Function() setScreen;

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
          const SizedBox(
            height: 30,
          ),
          const Text(
            'Start Flutter quiz now!',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 60,
          ),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(120, 45),
            ),
            onPressed: setScreen,
            icon: const Icon(Icons.arrow_right),
            label: const Text('Start'),
          )
        ],
      ),
    );
  }
}
