import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/material.dart';
import 'package:history_of_adventures/src/core/colors.dart';
import 'package:history_of_adventures/src/core/utils/styles.dart';
import 'package:history_of_adventures/src/features/quiz/data/quiz_model.dart';
import 'package:history_of_adventures/src/features/quiz/presentation/question_widgets/answer_model.dart';
import 'package:history_of_adventures/src/features/quiz/presentation/question_widgets/custom_widgets/check_box.dart';

class QuizCheckBox extends StatefulWidget {
  final int questionIndex;
  final String question;
  final List<CheckBoxWidget<bool>> answers;
  QuizCheckBox(
      {Key? key,
      required this.questionIndex,
      required this.question,
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
        margin: const EdgeInsets.all(80),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: constraints.maxHeight * 0.01),
                child: Text(
                  'QUESTION ${widget.questionIndex}',
                  style: Theme.of(context).textTheme.button,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        widget.question,
                        style: Theme.of(context).textTheme.headline2?.copyWith(
                            fontSize: TextFontSize.getHeight(45, context)),
                      ),
                    ),
                    Flexible(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 3, horizontal: 5),
                        decoration: BoxDecoration(
                            color: AppColors.grey,
                            borderRadius: BorderRadius.circular(5)),
                        child: Text("$score / 1"),
                      ),
                    )
                  ],
                ),
              ),
              Column(
                children: [
                  ...widget.answers
                      .map((answers) => Container(
                          padding: const EdgeInsets.all(15),
                          margin: const EdgeInsets.all(5),
                          decoration: QuizData.showRightAnswers &&
                                  (answers.answers.correctAnswers ==
                                          CorrectAnswers.answer2 ||
                                      answers.answers.correctAnswers ==
                                          CorrectAnswers.answer4 ||
                                      answers.answers.correctAnswers ==
                                          CorrectAnswers.answer5)
                              ? DottedDecoration(
                                  shape: Shape.box,
                                  strokeWidth: 1,
                                  color: AppColors.greyDeep)
                              : null,
                          child: CheckboxText(
                            value: answers.answers.value,
                            text: Text(
                              answers.answers.text,
                              style: answers.isRight == null
                                  ? Theme.of(context).textTheme.bodyText1
                                  : answers.isRight!
                                      ? Theme.of(context)
                                          .textTheme
                                          .bodyText1
                                          ?.copyWith(color: Colors.green)
                                      : Theme.of(context)
                                          .textTheme
                                          .bodyText1
                                          ?.copyWith(color: Colors.red),
                            ),
                            onTap: (val) {
                              if (val) {
                                QuizData.usersAnswersForQ8.remove(answers);
                              } else {
                                QuizData.usersAnswersForQ8.add(answers);
                              }
                              setState(() {
                                answers.answers.value = !answers.answers.value;
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
