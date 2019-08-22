import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'dart:async';

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
          child: Stack(
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
                  builder: (_) {
                    return QuestionWidget(
                      onChanged: _onChooseAnswer(store),
                    );
                  }
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  ValueChanged<int> _onChooseAnswer(QuizStore store) {
    return (int value) {
      if (!store.isChoosed()) {
        store.checkAnswer(value);

        Future.delayed(const Duration(milliseconds: 2500), () {
          store.next();
        });
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
