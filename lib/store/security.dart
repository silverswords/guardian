import 'package:guardian/model/quiz.dart';

class SecurityQuiz {
  static List<Quiz> _contents = [
    Quiz(
      '过马路时应该怎么做？', 
      ['买个冰棍儿', '看红绿灯，并确认安全', '我也不知道'],
      1,
    ),
    Quiz(
      '在餐厅就餐时，应该做什么？', 
      ['买个冰棍儿', '好好吃饭', '我也不知道'],
      1,
    ),
  ];

  static List<Quiz> get content => _contents;
}
