import 'package:flutter/material.dart';
import 'package:guardian/global.dart';
import './constants.dart';

class QuestionWidget extends StatelessWidget {
  QuestionWidget({@required this.quiz, @required this.state, @required this.answer, @required this.onChanged});

  final int answer;
  final QState state;
  final Quiz quiz;
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
        child: Text(
          quiz.question,
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
    ];

    for (var i = 0; i < this.quiz.choices.length; i++) {
      widgets.add(
        Container(
          margin: EdgeInsets.only(
            top: 10,
            left: 20,
            right: 20,
          ),
          child: Row(
            children: <Widget>[
              Radio(
                value: i,
                groupValue: answer,
                onChanged: onChanged,
              ),
              Text(
                this.quiz.choices[i],
                style: TextStyle(
                  color: ((state == QState.Failure) && ( i == answer)) ? Colors.red : Colors.black,
                  fontSize: 20,
                )
              ),
            ],
          ),
        )
      );
    }

    return widgets;
  }
}
