import 'package:quiz_app2/models/quiz.model.dart';

class QuestionData {
  static final List<QuizModel> questionsAndAnswers = <QuizModel>[
    QuizModel(
      question: 'Kyrgyzstanda 6 oblast bar',
      answer: false,
    ),
    QuizModel(question: 'Gulcho chon shaar', answer: false),
    QuizModel(question: 'Kyrgyzstan kop uluttuu olko', answer: true),
    QuizModel(question: 'Kyrgyzstan tooluu', answer: true),
  ];
}
