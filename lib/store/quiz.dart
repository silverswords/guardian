import 'package:mobx/mobx.dart';
import 'package:guardian/global.dart';

import './constants.dart';

part 'quiz.g.dart';

class QuizStore = _QuizStore with _$QuizStore;

abstract class _QuizStore with Store {
  List<QuizItem> quizs;

  @observable
  int type;

  @observable
  QuizItem quiz;

  @observable
  int current;

  @observable
  int answer;

  @observable
  int total;

  @observable
  int errors;

  @observable
  QuizState state;

  @action
  void load(int quizType) {
    switch(quizType) {
      case QuizTypeSecurity:
        quizs = QuizStorage.security;
        break;
    }

    type = quizType;
    current = 0;
    answer = -1;
    errors = 0;
    total = quizs.length;
    state = QuizState.Initial;
    quiz = quizs[current];
  }

  @action
  void checkAnswer(int choice) {
    answer = choice;

    if (quiz.check(choice)) {
      state = QuizState.Correct;
    } else {
      errors += 1;
      state = QuizState.Failure;
    }
  }

  @action
  void next() {
    if (state == QuizState.Last) {
      return;
    }

    current += 1;
    answer = -1;

    if (current == total) {
      state = QuizState.Last;
    } else {
      state = QuizState.Initial;
      quiz = quizs[current];
    }
  }

  bool isCorrect() {
    return state == QuizState.Correct;
  }

  bool isWrong() {
    return state == QuizState.Failure;
  }

  bool isChoosed() {
    return state == QuizState.Correct || state == QuizState.Failure;
  }

  bool isFinished() {
    return state == QuizState.Last;
  }
}
