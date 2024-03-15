import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quiz_app2/app_constants/colors/app_colors.dart';
import 'package:quiz_app2/app_constants/text_styles/app_text_styles.dart';
import 'package:quiz_app2/data/repo/quiz_repo.dart';
import 'package:quiz_app2/widgets/custom_button.dart';
import 'package:quiz_app2/widgets/icon_widget.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  List<Widget> icons = <Widget>[];

  Widget correctIcon = const IconWidget(
    icon: FontAwesomeIcons.check,
    iconColor: AppColors.mainColor,
  );
  Widget wrongIcon = const IconWidget(
      icon: FontAwesomeIcons.xmark, iconColor: AppColors.secondaryColor);

  String? suroo = 'Suroo';
  bool isFinished = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    algachkySuroonuAlypKel();
  }

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.black,
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
                  style: AppTextStyles.content,
                  textAlign: TextAlign.center,
                ),
              ),
              if (isFinished)
                Positioned(
                  bottom: _height * 0.09,
                  child: CustomButton(
                    buttonText: 'kairadan bashta',
                    onPressed: reset,
                  ),
                )
              else
                Positioned(
                  bottom: _height * 0.09,
                  child: Column(
                    children: [
                      CustomButton(
                        buttonText: 'Tuura',
                        bgColor: AppColors.mainColor,
                        onPressed: () {
                          userAnswered(true);
                        },
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      CustomButton(
                        buttonText: 'Tuura emes',
                        bgColor: AppColors.secondaryColor,
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

  algachkySuroonuAlypKel() {
    suroo = quizRepo.getQuestion();
  }

  userAnswered(bool userAnswer) {
    bool? realAnswer = quizRepo.getAnswer();
    if (userAnswer == realAnswer) {
      icons.add(correctIcon);
    } else {
      icons.add(wrongIcon);
    }
    quizRepo.getNext();
    suroo = quizRepo.getQuestion();
    if (suroo == 'ayagyna chykty') {
      isFinished = true;
    }
    setState(() {});
  }

  void reset() {
    quizRepo.reset();
    suroo = quizRepo.getQuestion();
    isFinished = false;
    icons = <Widget>[];
    setState(() {});
  }
}
