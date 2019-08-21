import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:guardian/global.dart';

import './indicator.dart';
import './question.dart';

class QuizWidget extends StatelessWidget {
  const QuizWidget({this.store});

  final QuizStore store;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          child: _buildIndicator(),
        ),
        Container(
          margin: EdgeInsets.only(
            top: 320.0,
            bottom: 100.0,
            left: 20.0,
            right: 20.0,
          ),
          child: Observer(
            builder: (_) => QuestionWidget(
              store: store,
              onChanged: _onChooseAnswer,
            ),
          ),
        ),
      ],
    );
  }

  void _onChooseAnswer(int value) {
    if (!store.isChoosed()) {
      store.checkAnswer(value);
    }
  }

  Widget _buildIndicator() {
    return Observer(
      builder: (_) {
        if (store.isCorrect()) {
          return IndicatorWidget.correct();
        }

        if (store.isWrong()) {
          return IndicatorWidget.error();
        }

        return IndicatorWidget.idle();
      },
    );
  }
}
