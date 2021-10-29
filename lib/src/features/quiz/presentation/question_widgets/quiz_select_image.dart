import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/material.dart';
import 'package:history_of_adventures/src/core/colors.dart';
import 'package:history_of_adventures/src/core/utils/styles.dart';
import 'package:history_of_adventures/src/features/quiz/data/quiz_model.dart';
import 'package:history_of_adventures/src/features/quiz/presentation/question_widgets/answer_model.dart';
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
        height: constraints.maxHeight,
        margin: const EdgeInsets.all(100),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 5,
                      child: Text(
                        widget.question,
                        style: Theme.of(context).textTheme.subtitle1?.copyWith(
                            fontSize: TextFontSize.getHeight(24, context)),
                      ),
                    ),
                  ],
                ),
              ),
              Wrap(
                children: [
                  ...widget.answers
                      .map((answers) => Container(
                          padding: const EdgeInsets.all(15),
                          margin: const EdgeInsets.all(5),
                          decoration: QuizData.showRightAnswers &&
                                  answers.answers.correctAnswers ==
                                      CorrectAnswers.answer2
                              ? DottedDecoration(
                                  shape: Shape.box,
                                  strokeWidth: 1,
                                  color: AppColors.greyDeep)
                              : null,
                          child: SelectImage(
                            decoration: QuizData.showRightAnswers
                                ? BoxDecoration(
                                    border: Border.all(
                                        color: answers.answers.value ==
                                                widget.userAnswers
                                            ? widget.userAnswers == 2
                                                ? AppColors.green
                                                : AppColors.red
                                            : AppColors.transpatent))
                                : null,
                            image: answers.answers.text,
                            groupValue: answers.answers.value,
                            value: QuizData.valueQ10,
                            onTap: (val) {
                              setState(() {
                                QuizData.valueQ10 = answers.answers.value;

                                widget.userAnswers = QuizData.valueQ10;
                              });
                            },
                          )))
                      .toList()
                ],
              )
            ],
          ),
        ),
      );
    });
  }
}
