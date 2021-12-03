import 'package:flutter/material.dart';
import 'package:history_of_adventures/src/core/colors.dart';
import 'package:history_of_adventures/src/core/utils/styles.dart';
import 'package:history_of_adventures/src/features/quiz/data/quiz_model.dart';
import 'package:history_of_adventures/src/features/quiz/presentation/question_widgets/custom_widgets/select_image.dart';

class QuizSelectImage extends StatefulWidget {
  final int questionIndex;
  final String question;
  final List<CheckBoxWidget<int>> answers;
  int userAnswers;

  QuizSelectImage(
      {Key? key,
      required this.questionIndex,
      required this.question,
      required this.answers,
      required this.userAnswers})
      : super(key: key);

  @override
  _QuizSelectImageState createState() => _QuizSelectImageState();
}

class _QuizSelectImageState extends State<QuizSelectImage> {
  int score = 0;
  @override
  void initState() {
    if (QuizData.valueQ10 == 2) {
      setState(() {
        score = 1;
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(
                  left: HW.getWidth(24, context),
                  right: HW.getWidth(24, context),
                  top: HW.getHeight(24, context),
                  bottom: HW.getHeight(36, context)),
              child: Text(
                widget.question,
                style: Theme.of(context)
                    .textTheme
                    .subtitle1
                    ?.copyWith(fontSize: TextFontSize.getHeight(24, context)),
              ),
            ),
            AbsorbPointer(
              absorbing: QuizData.showRightAnswers,
              child: Container(
                margin:
                    EdgeInsets.symmetric(horizontal: HW.getWidth(48, context)),
                child: Wrap(
                  children: [
                    ...widget.answers
                        .map((answers) => Container(
                            decoration: QuizData.showRightAnswers &&
                                    answers.answers.correctAnswers ==
                                        CorrectAnswers.answer2
                                ? BoxDecoration(
                                    color: AppColors.white,
                                    boxShadow: Shadows.allBordersGreen,
                                    border: Border.all(
                                        color:
                                            AppColors.linearGradientGreenBox))
                                : null,
                            margin: const EdgeInsets.all(15),
                            child: SelectImage(
                              answers: answers,
                              image: answers.answers.text,
                              groupValue: QuizData.valueQ10,
                              value: answers.answers.value,
                              onTap: (val) {
                                setState(() {
                                  QuizData.valueQ10 = val;
                                });
                              },
                            )))
                        .toList()
                  ],
                ),
              ),
            )
          ],
        ),
      );
    });
  }
}
