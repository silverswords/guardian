import 'package:flutter/material.dart';
import 'package:guardian/global.dart';
import 'package:guardian/pages/landing/index.dart';
import 'package:guardian/pages/quizzes/index.dart';


final quizStore = QuizStore();

class Application extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: applicationTheme,
      initialRoute: Landing.routeName,
      routes: {
        Landing.routeName: (context) => Landing(quizStore),
        Quizzes.routeName: (context) => Quizzes(quizStore),
      },
    );
  }
}
