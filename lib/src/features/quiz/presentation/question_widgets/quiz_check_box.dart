import 'package:flutter/material.dart';
import 'package:history_of_adventures/src/core/colors.dart';
import 'package:history_of_adventures/src/core/utils/assets_path.dart';
import 'package:history_of_adventures/src/core/utils/audioplayer_utils.dart';
import 'package:history_of_adventures/src/core/utils/styles.dart';
import 'package:history_of_adventures/src/features/quiz/data/quiz_model.dart';
import 'package:history_of_adventures/src/features/quiz/presentation/question_widgets/custom_widgets/check_box.dart';

class QuizCheckBox extends StatefulWidget {
  final int questionIndex;
  final String question;
  final String image;

  final List<CheckBoxWidget<bool>> answers;
  final List<CheckBoxWidget<bool>> userAnswers;

  QuizCheckBox(
      {Key? key,
      required this.questionIndex,
      required this.question,
      required this.userAnswers,
      required this.image,
      required this.answers})
      : super(key: key);

  @override
  _QuizCheckBoxState createState() => _QuizCheckBoxState();
}

class _QuizCheckBoxState extends State<QuizCheckBox> {
  int score = 0;
  @override
  void initState() {
    if (QuizData.rightAnswersForQ8 == 3) {
      score = 1;
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
                  top: HW.getHeight(24, context),
                  left: HW.getWidth(24, context),
                  bottom: HW.getHeight(36, context)),
              child: Text(
                widget.question,
                style: Theme.of(context)
                    .textTheme
                    .subtitle1
                    ?.copyWith(fontSize: TextFontSize.getHeight(24, context)),
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: HW.getHeight(480, context),
                    width: HW.getWidth(600, context),
                    margin: EdgeInsets.symmetric(
                        horizontal: HW.getWidth(24, context)),
                    child: Image.asset(
                      widget.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                  AbsorbPointer(
                    absorbing: QuizData.showRightAnswers,
                    child: Container(
                      width: HW.getWidth(500, context),
                      height: HW.getHeight(500, context),
                      child: ListView(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        // mainAxisSize: MainAxisSize.max,
                        children: [
                          ...widget.answers
                              .map((answers) => Container(
                                  margin: EdgeInsets.only(
                                      bottom: HW.getHeight(13, context)),
                                  padding: EdgeInsets.symmetric(
                                    vertical: HW.getHeight(10, context),
                                    // horizontal: HW.getWidth(10, context),
                                  ),
                                  decoration: QuizData.showRightAnswers &&
                                          answers.answers.isCorrect == true
                                      // (answers.answers.correctAnswers ==
                                      //         CorrectAnswers.answer2 ||
                                      //     answers.answers.correctAnswers ==
                                      //         CorrectAnswers.answer4 ||
                                      //     answers.answers.correctAnswers ==
                                      //         CorrectAnswers.answer5)
                                      ? BoxDecoration(
                                          color: AppColors.white,
                                          border: Border.all(
                                              color: AppColors
                                                  .underlineInputBorderColor,
                                              width: 0.5),
                                          boxShadow: Shadows.quizShadows,
                                        )
                                      : null,
                                  child: CheckboxText(
                                    answers: answers,
                                    isCorrect: QuizData.showRightAnswers == true
                                        ? answers.answers.value == true
                                            ? answers.answers.isCorrect == true
                                                ? true
                                                : false
                                            : null
                                        : null,
                                    value: answers.answers.value,
                                    text: answers.answers.text!,
                                    onTap: (val) {
                                      if (val) {
                                        AudioPlayerUtil().playSound(
                                            AssetsPath.quizQlickErase);
                                        widget.userAnswers.remove(answers);
                                      } else {
                                        AudioPlayerUtil().playSound(
                                            AssetsPath.quizQlick);
                                        widget.userAnswers.add(answers);
                                      }
                                      setState(() {
                                        answers.answers.value =
                                            !answers.answers.value;
                                      });
                                    },
                                  )))
                              .toList()
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
