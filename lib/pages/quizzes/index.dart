import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import 'package:guardian/global.dart';
import './quiz.dart';

class Quizzes extends StatelessWidget {
  static const List<String> quizTitles = ['安全教育', '防毒教育'];
  static const routeName = '/quiz';

  const Quizzes();

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<QuizStore>(context);

    return Scaffold(
      appBar: AppBar(
        title: Observer(
          builder: (_) => Text(quizTitles[store.type])
        ),
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
                child: QuizWidget(),
              ),
            ),
          ),
        ],
      )
    );
  }
}
