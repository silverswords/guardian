import 'package:flutter/material.dart';
import 'package:guardian/global.dart';
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
    return _buildInitialState(context);
  }

  Widget _buildInitialState(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 200.0,
        bottom: 100.0,
        left: 20.0,
        right: 20.0,
      ),
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
                groupValue: _answer,
                onChanged: _onChooseAnswer,
              ),
              Text(
                this.quiz.choices[i],
                style: TextStyle(
                  color: ((_state == QState.Failure) && ( i == _answer)) ? Colors.red : Colors.black,
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
