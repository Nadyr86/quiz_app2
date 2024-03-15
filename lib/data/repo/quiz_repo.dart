import 'package:quiz_app2/data/services/quiz_service.dart';

class QuizRepo {
  String? getQuestion() {
    return quizServices.getQuestion();
  }

  void getNext() {
    quizServices.getNext();
  }

  bool? getAnswer() {
    return quizServices.getAnswer();
  }

  void reset() {
    quizServices.reset();
  }
}

final QuizRepo quizRepo = QuizRepo();
