import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quiz_app2/custom_button.dart';
import 'package:quiz_app2/quiz.brain.dart';

class QuizApp extends StatefulWidget {
  const QuizApp({Key? key}) : super(key: key);

  @override
  _QuizAppState createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  List<Widget> icons = <Widget>[];

  Widget correctIcon = Padding(
    padding: const EdgeInsets.only(right: 12.0),
    child: FaIcon(
      FontAwesomeIcons.check,
      color: Color(0xff4CAF4f),
    ),
  );
  Widget wrongIcon = Padding(
    padding: const EdgeInsets.only(right: 12.0),
    child: FaIcon(
      FontAwesomeIcons.xmark,
      color: Color(0xffF44336),
    ),
  );

  String? suroo = 'Suroo';
  bool isFinished = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    algachkySuroonuAlypKel();
  }

  algachkySuroonuAlypKel() {
    suroo = quizBrain.getQuestion();
  }

  userAnswered(bool userAnswer) {
    bool? realAnswer = quizBrain.getAnswer();
    if (userAnswer == realAnswer) {
      icons.add(correctIcon);
    } else {
      icons.add(wrongIcon);
    }
    quizBrain.getNext();
    suroo = quizBrain.getQuestion();
    if (suroo == 'ayagyna chykty') {
      isFinished = true;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xff000000),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Center(
          child: Stack(
            children: [
              const SizedBox(),
              Positioned(
                top: _height / 3,
                right: 2,
                left: 2,
                child: Text(
                  suroo!,
                  style: TextStyle(color: Color(0xffFFFFFF), fontSize: 26.0),
                  textAlign: TextAlign.center,
                ),
              ),
              if (isFinished)
                Positioned(
                  bottom: _height * 0.09,
                  child: CustomButton(
                      buttonText: 'kairadan bashta',
                      onPressed: () {
                        quizBrain.reset();
                        suroo = quizBrain.getQuestion();
                        isFinished = false;
                        icons = <Widget>[];
                        setState(() {});
                      }),
                )
              else
                Positioned(
                  bottom: _height * 0.09,
                  child: Column(
                    children: [
                      CustomButton(
                        buttonText: 'Tuura',
                        bgColor: Color(0xff4CAF4F),
                        onPressed: () {
                          userAnswered(true);
                        },
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      CustomButton(
                        buttonText: 'Tuura emes',
                        bgColor: Color(0xffF44336),
                        onPressed: () {
                          userAnswered(false);
                        },
                      ),
                    ],
                  ),
                ),
              const SizedBox(
                height: 20.0,
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 18.0),
                  child: Row(
                    children: icons,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
