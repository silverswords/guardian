import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import 'package:guardian/global.dart';

class QuestionWidget extends StatelessWidget {
  const QuestionWidget({this.onChanged});

  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    return _buildInitialState(context);
  }

  Widget _buildInitialState(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: _buildQuiz(context),
        ),
      ),
    );
  }

  List<Widget> _buildQuiz(BuildContext context) {
    final store = Provider.of<QuizStore>(context);

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
                builder: (_) => GestureDetector(
                  onTap: () => onChanged(i),
                  child: Text(
                    store.quiz.choices[i],
                    style: TextStyle(
                      color: _questionColor(store, i),
                      fontSize: 20,
                    )
                  ),
                ),
              ),
            ],
          ),
        )
      );
    }

    return widgets;
  }

  Color _questionColor(QuizStore store, int index) {
    if (index == store.answer) {
      if (store.isWrong()) {
        return Colors.red;
      }

      if (store.isCorrect()) {
        return Colors.green;
      }
    }

    return Colors.black;
  }
}
