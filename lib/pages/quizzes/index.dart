import 'package:flutter/material.dart';
import './arguments.dart';
import './quiz.dart';

class Quizzes extends StatelessWidget {
  static const routeName = '/quiz';

  @override
  Widget build(BuildContext context) {
    final QuizArguments args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(QuizArguments.quizTitles[args.type]),
      ),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Container(
              child: Center(
                child: QuizWidget(args.type),
              ),
            )
          ],
        ),
      ),
    );
  }
}
