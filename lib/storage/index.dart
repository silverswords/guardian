import 'package:guardian/global.dart';

import './security.dart';

class QuizStorage {
  static List<QuizItem> get security => SecurityQuiz.content;

  static bool securityCheckAnswer(int seq, int answer) {
    return security[seq].answer == answer;
  }
}
