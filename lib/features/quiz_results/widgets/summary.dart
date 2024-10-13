import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Summary extends StatelessWidget {
  const Summary({
    super.key,
    required this.summary,
  });

  final List<Map<String, Object>> summary;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summary.map((data) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Question number
                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(right: 16),
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: data['user_answer'] == data['correct_answer']
                        ? Color.fromARGB(197, 28, 190, 239)
                        : Color.fromARGB(197, 239, 18, 239),
                  ),
                  child: Text(
                    (((data['question_index'] as int) + 1).toString()),
                    style: GoogleFonts.lato(
                      color: Color.fromARGB(200, 36, 36, 36),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ),
                Expanded(
                  // Question text and answers
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Question text
                      Text(
                        data['question_text'] as String,
                        style: GoogleFonts.lato(
                          color: const Color.fromARGB(201, 255, 255, 255),
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.none,
                        ),
                      ),
                      // User answer
                      Text(
                        data['user_answer'] as String,
                        style: GoogleFonts.lato(
                          color: Color.fromARGB(197, 239, 18, 239),
                          fontSize: 14,
                          decoration: TextDecoration.none,
                        ),
                      ),
                      // Correct answer
                      Text(
                        data['correct_answer'] as String,
                        style: GoogleFonts.lato(
                          color: Color.fromARGB(197, 28, 190, 239),
                          fontSize: 14,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
