import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:guardian/global.dart';
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
      body: Stack(
        children: <Widget>[
          Container(
            //color: Color(0xCCFFF1E9),
            color: Color(0xCCDFF0EA),
          ),
          Container(
            child: SvgPicture.asset(
              Resources.svgDinosaur,
              color: Colors.black12,
              fit: BoxFit.fitHeight,
            ),
          ),
          SafeArea(
            child: Container(
              child: Center(
                child: QuizWidget(args.type),
              ),
            ),
          ),
        ],
      )
    );
  }
}
