class QuizArguments {
  static const int QuizTypeSecurity = 0;
  static const int QuizTypeDrug = 1;

  static const List<String> quizTitles = ['安全教育', '防毒教育'];

  QuizArguments(this.type);
  int type;
}
