import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import 'package:guardian/global.dart';

import './indicator.dart';
import './question.dart';

class QuizWidget extends StatelessWidget {
  const QuizWidget();

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<QuizStore>(context);

    return Stack(
      children: <Widget>[
        Container(
          child: _buildIndicator(store),
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
              onChanged: _onChooseAnswer(store),
            ),
          ),
        ),
      ],
    );
  }

  ValueChanged<int> _onChooseAnswer(QuizStore store) {
    return (int value) {
      if (!store.isChoosed()) {
        store.checkAnswer(value);
      }
    };
  }

  Widget _buildIndicator(QuizStore store) {
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
