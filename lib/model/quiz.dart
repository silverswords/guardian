class QuizItem {
  QuizItem(this.question, this.choices, this.answer);

  final String question;
  final List<String> choices;
  final int answer;

  bool check(int choice) {
    return answer == choice;
  }
}
