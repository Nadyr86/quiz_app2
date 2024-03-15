import 'package:quiz_app2/data/local_data/quiz/question_data.dart';

class QuizServices {
  int index = 0;
  String? getQuestion() {
    if (index < QuestionData.questionsAndAnswers.length) {
      return QuestionData.questionsAndAnswers[index].question;
    } else {
      return 'ayagyna chykty';
    }
  }

  void getNext() {
    index++;
  }

  bool? getAnswer() {
    if (index <= QuestionData.questionsAndAnswers.length) {
      return QuestionData.questionsAndAnswers[index].answer;
    }
  }

  void reset() {
    index = 0;
  }
}

final QuizServices quizServices = QuizServices();
