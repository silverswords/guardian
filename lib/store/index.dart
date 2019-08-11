import 'package:guardian/model/quiz.dart';
import './security.dart';

class QuizStore {
  static List<Quiz> get security => SecurityQuiz.content;

  static bool securityCheckAnswer(int seq, int answer) {
    return security[seq].answer == answer;
  }
}
