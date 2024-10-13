import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/providers/questions_provider.dart';
import 'package:quiz_app/providers/summary_provider.dart';
import 'package:quiz_app/quiz_app.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => QuestionsProvider()),
        ChangeNotifierProxyProvider<QuestionsProvider, SummaryProvider>(
          update: (_, questions, summary) => SummaryProvider(questions),
          create: (_) => SummaryProvider(null),
        ),
      ],
      child: const QuizApp(),
    ),
  );
}
