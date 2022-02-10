import 'package:flutter/material.dart';
import 'package:history_of_adventures/src/core/colors.dart';
import 'package:history_of_adventures/src/core/utils/styles.dart';
import 'package:history_of_adventures/src/features/quiz/data/quiz_model.dart';
import 'package:history_of_adventures/src/features/quiz/presentation/question_widgets/answer_model.dart';

class RadioButtonModel extends StatefulWidget {
  final String question;
  final List<Answers<int>> answers;
  final int questionIndex;

  const RadioButtonModel(
      {Key? key,
      required this.question,
      required this.answers,
      required this.questionIndex})
      : super(key: key);

  @override
  _RadioButtonModelState createState() => _RadioButtonModelState();
}

class _RadioButtonModelState extends State<RadioButtonModel> {
  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: QuizData.showRightAnswers,
      child: LayoutBuilder(builder: (context, constraints) {
        return Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(HW.getWidth(24, context),
                    HW.getHeight(24, context), 0, HW.getHeight(36, context)),
                child: Text(
                  widget.question,
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1
                      ?.copyWith(fontSize: TextFontSize.getHeight(24, context)),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  left: HW.getWidth(24, context),
                ),
                child: Flexible(
                  child: AbsorbPointer(
                    absorbing: QuizData.showRightAnswers,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              widget.answers.first.image!,
                              width: 550,
                              height: 450,
                            ),
                            Container(
                              padding: EdgeInsets.only(
                                  right: HW.getHeight(10, context)),
                              margin: EdgeInsets.only(
                                  bottom: HW.getHeight(24, context)),
                              // decoration: QuizData.showRightAnswers &&
                              //         e.value == 4
                              //     ? BoxDecoration(
                              //         color: AppColors.white,
                              //         border: Border.all(
                              //             color: AppColors
                              //                 .underlineInputBorderColor,
                              //             width: 0.5),
                              //         boxShadow: Shadows.quizShadows,
                              //       )
                              //     : null,
                              child: Radio<bool>(
                                value: widget.answers.first.checked!,
                                groupValue: QuizData.valueQ13,
                                onChanged: (bool? value) {
                                  setState(() {
                                    widget.answers.forEach((element) {
                                      element.checked == false
                                          ? element.checked = true
                                          : null;
                                    });

                                    widget.answers.first.checked =
                                        !widget.answers.first.checked!;
                                  });
                                },
                                activeColor: AppColors.orange,
                              ),
                            )
                          ],
                        ),
                        Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            // mainAxisSize: MainAxisSize.min,
                            children: widget.answers
                                .map((e) => e.value != 1
                                    ? Row(
                                        children: [
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                padding: EdgeInsets.only(
                                                    right: HW.getHeight(
                                                        10, context)),
                                                margin: EdgeInsets.only(
                                                    bottom: HW.getHeight(
                                                        24, context)),
                                                // decoration: QuizData.showRightAnswers &&
                                                //         e.value == 4
                                                //     ? BoxDecoration(
                                                //         color: AppColors.white,
                                                //         border: Border.all(
                                                //             color: AppColors
                                                //                 .underlineInputBorderColor,
                                                //             width: 0.5),
                                                //         boxShadow: Shadows.quizShadows,
                                                //       )
                                                //     : null,
                                                child: Radio<bool>(
                                                  value: e.checked!,
                                                  groupValue: QuizData.valueQ13,
                                                  onChanged: (bool? value) {
                                                    setState(() {
                                                      widget.answers
                                                          .forEach((element) {
                                                        element.checked == false
                                                            ? element.checked =
                                                                true
                                                            : null;
                                                      });

                                                      e.checked = !e.checked!;
                                                    });
                                                  },
                                                  activeColor: AppColors.orange,
                                                ),
                                              ),
                                              Column(
                                                children: [
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Image.asset(
                                                    e.image!,
                                                    width: HW.getWidth(
                                                        300, context),
                                                    height: HW.getHeight(
                                                        250, context),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                width: 20,
                                              )
                                            ],
                                          ),
                                        ],
                                      )
                                    : Row())
                                .toList()),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
