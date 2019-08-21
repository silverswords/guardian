// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars

mixin _$QuizStore on _QuizStore, Store {
  final _$typeAtom = Atom(name: '_QuizStore.type');

  @override
  int get type {
    _$typeAtom.context.enforceReadPolicy(_$typeAtom);
    _$typeAtom.reportObserved();
    return super.type;
  }

  @override
  set type(int value) {
    _$typeAtom.context.conditionallyRunInAction(() {
      super.type = value;
      _$typeAtom.reportChanged();
    }, _$typeAtom, name: '${_$typeAtom.name}_set');
  }

  final _$quizAtom = Atom(name: '_QuizStore.quiz');

  @override
  QuizItem get quiz {
    _$quizAtom.context.enforceReadPolicy(_$quizAtom);
    _$quizAtom.reportObserved();
    return super.quiz;
  }

  @override
  set quiz(QuizItem value) {
    _$quizAtom.context.conditionallyRunInAction(() {
      super.quiz = value;
      _$quizAtom.reportChanged();
    }, _$quizAtom, name: '${_$quizAtom.name}_set');
  }

  final _$currentAtom = Atom(name: '_QuizStore.current');

  @override
  int get current {
    _$currentAtom.context.enforceReadPolicy(_$currentAtom);
    _$currentAtom.reportObserved();
    return super.current;
  }

  @override
  set current(int value) {
    _$currentAtom.context.conditionallyRunInAction(() {
      super.current = value;
      _$currentAtom.reportChanged();
    }, _$currentAtom, name: '${_$currentAtom.name}_set');
  }

  final _$answerAtom = Atom(name: '_QuizStore.answer');

  @override
  int get answer {
    _$answerAtom.context.enforceReadPolicy(_$answerAtom);
    _$answerAtom.reportObserved();
    return super.answer;
  }

  @override
  set answer(int value) {
    _$answerAtom.context.conditionallyRunInAction(() {
      super.answer = value;
      _$answerAtom.reportChanged();
    }, _$answerAtom, name: '${_$answerAtom.name}_set');
  }

  final _$totalAtom = Atom(name: '_QuizStore.total');

  @override
  int get total {
    _$totalAtom.context.enforceReadPolicy(_$totalAtom);
    _$totalAtom.reportObserved();
    return super.total;
  }

  @override
  set total(int value) {
    _$totalAtom.context.conditionallyRunInAction(() {
      super.total = value;
      _$totalAtom.reportChanged();
    }, _$totalAtom, name: '${_$totalAtom.name}_set');
  }

  final _$errorsAtom = Atom(name: '_QuizStore.errors');

  @override
  int get errors {
    _$errorsAtom.context.enforceReadPolicy(_$errorsAtom);
    _$errorsAtom.reportObserved();
    return super.errors;
  }

  @override
  set errors(int value) {
    _$errorsAtom.context.conditionallyRunInAction(() {
      super.errors = value;
      _$errorsAtom.reportChanged();
    }, _$errorsAtom, name: '${_$errorsAtom.name}_set');
  }

  final _$stateAtom = Atom(name: '_QuizStore.state');

  @override
  QuizState get state {
    _$stateAtom.context.enforceReadPolicy(_$stateAtom);
    _$stateAtom.reportObserved();
    return super.state;
  }

  @override
  set state(QuizState value) {
    _$stateAtom.context.conditionallyRunInAction(() {
      super.state = value;
      _$stateAtom.reportChanged();
    }, _$stateAtom, name: '${_$stateAtom.name}_set');
  }

  final _$_QuizStoreActionController = ActionController(name: '_QuizStore');

  @override
  void load(int quizType) {
    final _$actionInfo = _$_QuizStoreActionController.startAction();
    try {
      return super.load(quizType);
    } finally {
      _$_QuizStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void checkAnswer(int choice) {
    final _$actionInfo = _$_QuizStoreActionController.startAction();
    try {
      return super.checkAnswer(choice);
    } finally {
      _$_QuizStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void next() {
    final _$actionInfo = _$_QuizStoreActionController.startAction();
    try {
      return super.next();
    } finally {
      _$_QuizStoreActionController.endAction(_$actionInfo);
    }
  }
}
