import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:history_of_adventures/src/core/colors.dart';
import 'package:history_of_adventures/src/core/utils/assets_path.dart';
import 'package:history_of_adventures/src/core/utils/styles.dart';
import 'package:history_of_adventures/src/features/quiz/data/quiz_model.dart';
import 'package:history_of_adventures/src/features/quiz/presentation/question_widgets/answer_model.dart';
import 'package:history_of_adventures/src/features/quiz/presentation/question_widgets/custom_widgets/check_box.dart';

class QuizCheckBox extends StatefulWidget {
  final int questionIndex;
  final String question;
  bool withImages;
  final List<CheckBoxWidget<bool>> answers;
  final List<CheckBoxWidget<bool>> userAnswers;

  QuizCheckBox(
      {Key? key,
      required this.questionIndex,
      required this.question,
      required this.userAnswers,
      this.withImages = false,
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
                            fontSize: TextFontSize.getHeight(45, context)),
                      ),
                    ),
                  ],
                ),
              ),
              AbsorbPointer(
                absorbing: QuizData.showRightAnswers,
                child: Wrap(
                  direction: Axis.horizontal,
                  children: [
                    ...widget.answers
                        .map((answers) => Container(
                            width: constraints.maxWidth * 0.4,
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
                              image: answers.answers.text,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: answers.isRight == null
                                          ? Colors.transparent
                                          : answers.isRight!
                                              ? Colors.green
                                              : Colors.red)),
                              isImage: widget.withImages,
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
                                  widget.userAnswers.remove(answers);
                                } else {
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
              Align(
                child: Image.asset(AssetsPath.quizImage8),
                alignment: Alignment.center,
              )
            ],
          ),
        ),
      );
    });
  }
}
