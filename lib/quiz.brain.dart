import 'package:quiz_app2/quiz.model.dart';

class QuizBrain {
  int index = 0;
  List<QuizModel> questionsAndAnswers = <QuizModel>[
    QuizModel(
      question: 'Kyrgyzstanda 6 oblast bar',
      answer: false,
    ),
    QuizModel(question: 'Gulcho chon shaar', answer: false),
    QuizModel(question: 'Kyrgyzstan kop uluttuu olko', answer: true),
    QuizModel(question: 'Kyrgyzstan tooluu', answer: true),
  ];
  String? getQuestion() {
    if (index < questionsAndAnswers.length) {
      return questionsAndAnswers[index].question;
    } else {
      return 'ayagyna chykty';
    }
  }

  void getNext() {
    index++;
  }

  bool? getAnswer() {
    if (index <= questionsAndAnswers.length) {
      return questionsAndAnswers[index].answer;
    }
  }

  void reset() {
    index = 0;
  }
}

QuizBrain quizBrain = QuizBrain();
