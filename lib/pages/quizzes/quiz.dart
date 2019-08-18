import 'package:flutter/material.dart';
import 'package:guardian/global.dart';
import 'package:guardian/global.dart' as prefix0;
import 'package:guardian/pages/quizzes/question.dart';
import './arguments.dart';
import './constants.dart';

class QuizWidget extends StatefulWidget {
  QuizWidget(this._type);

  final int _type;

  int get type => _type;

  @override
  State<QuizWidget> createState() => QuizWidgetState();
}

class QuizWidgetState extends State<QuizWidget> {
  List<Quiz> _quizzes = [];

  QState _state = QState.Initial;
  int _current = 0, _total = 0, _answer = -1;

  Quiz get quiz => _quizzes[_current];

  @override
  void initState() {
    super.initState();

    this._load(widget.type);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(
            top: 200.0,
            bottom: 100.0,
            left: 20.0,
            right: 20.0,
          ),
          child: QuestionWidget(
            quiz: quiz,
            state: _state,
            answer: _answer,
            onChanged: _onChooseAnswer,
          ),
        ),
      ],
    );
  }

  void _onChooseAnswer(int value) {
    if (_state != QState.Initial) {
      return;
    }

    bool result = false;

    switch(widget.type) {
      case QuizArguments.QuizTypeSecurity:
        result = QuizStore.securityCheckAnswer(_current, value);
        break;
    }

    setState(() {
      _answer = value;
      _state = result ? QState.Correct : QState.Failure;
    });
  }

  void _load(int type) {
    switch(type) {
      case QuizArguments.QuizTypeSecurity:
        this._quizzes = QuizStore.security;
        break;
    }

    this._total = this._quizzes.length;
  }
}
