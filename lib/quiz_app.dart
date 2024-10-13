import 'package:flutter/material.dart';
import 'package:quiz_app/router/router.dart';

class QuizApp extends StatelessWidget {
  const QuizApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      routes: routes,
      initialRoute: routes.keys.first,
      debugShowCheckedModeBanner: false,
    );
  }
}
