import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:guardian/global.dart';

class QuestionWidget extends StatelessWidget {
  const QuestionWidget({this.store, this.onChanged});

  final QuizStore store;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    return _buildInitialState(context);
  }

  Widget _buildInitialState(BuildContext context) {
    return Container(
      child: Column(
        children: _buildQuiz(),
      ),
    );
  }

  List<Widget> _buildQuiz() {
    List<Widget> widgets = <Widget>[
      Container(
        child: Observer(
          builder: (_) => Text(
            store.quiz.question,
            textAlign: TextAlign.left,
            style: TextStyle(
              color: Colors.brown,
              fontSize: 28,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
            ),
          ),
        ),
      ),
    ];

    for (var i = 0; i < store.quiz.choices.length; i++) {
      widgets.add(
        Container(
          margin: EdgeInsets.only(
            top: 10,
            left: 20,
            right: 20,
          ),
          child: Row(
            children: <Widget>[
              Observer(
                builder: (_) => Radio(
                  value: i,
                  groupValue: store.answer,
                  onChanged: onChanged,
                ),
              ),
              Observer(
                builder: (_) => Text(
                  store.quiz.choices[i],
                  style: TextStyle(
                    color: ((store.isWrong()) && ( i == store.answer)) ? Colors.red : Colors.black,
                    fontSize: 20,
                  )
                ),
              ),
            ],
          ),
        )
      );
    }

    return widgets;
  }
}
