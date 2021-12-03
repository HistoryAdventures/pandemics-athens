import 'package:flutter/material.dart';
import 'package:history_of_adventures/src/core/colors.dart';
import 'package:history_of_adventures/src/core/utils/styles.dart';
import 'package:history_of_adventures/src/features/quiz/data/quiz_model.dart';
import 'package:history_of_adventures/src/features/quiz/presentation/question_widgets/answer_model.dart';
import 'package:history_of_adventures/src/features/quiz/presentation/question_widgets/custom_widgets/draggable_widget.dart';
import 'package:history_of_adventures/src/features/quiz/presentation/question_widgets/custom_widgets/text_question_widget.dart';

class QuizDragDropWidget extends StatefulWidget {
  final int questionIndex;
  final String question;
  final int score;

  final List<Answers> answers;

  QuizDragDropWidget(
      {Key? key,
      required this.answers,
      required this.score,
      required this.question,
      required this.questionIndex})
      : super(key: key);

  @override
  _QuizDragDropWidgetState createState() => _QuizDragDropWidgetState();
}

class _QuizDragDropWidgetState extends State<QuizDragDropWidget> {
  @override
  void initState() {
    super.initState();
  }

  late List<dynamic> correctAnswers;
  late List<dynamic> usersAnswers;
  late List<dynamic> listQuestionBody;

  void removeAll(Answers toRemove) {
    widget.answers.removeWhere((answer) => answer.text == toRemove.text);
    QuizData.userAnswer1ForQ7
        .removeWhere((answer) => answer.text == toRemove.text);
    QuizData.userAnswer2ForQ7
        .removeWhere((answer) => answer.text == toRemove.text);
    QuizData.userAnswer3ForQ7
        .removeWhere((answer) => answer.text == toRemove.text);
    QuizData.userAnswer4ForQ7
        .removeWhere((answer) => answer.text == toRemove.text);
    QuizData.userAnswer5ForQ7
        .removeWhere((answer) => answer.text == toRemove.text);
    QuizData.userAnswer6ForQ7
        .removeWhere((answer) => answer.text == toRemove.text);

    QuizData.userAnswer1ForQ3
        .removeWhere((answer) => answer.text == toRemove.text);
    QuizData.userAnswer2ForQ3
        .removeWhere((answer) => answer.text == toRemove.text);
    QuizData.userAnswer3ForQ3
        .removeWhere((answer) => answer.text == toRemove.text);
    QuizData.userAnswer4ForQ3
        .removeWhere((answer) => answer.text == toRemove.text);
    QuizData.userAnswer5ForQ3
        .removeWhere((answer) => answer.text == toRemove.text);
    QuizData.userAnswer6ForQ3
        .removeWhere((answer) => answer.text == toRemove.text);
    QuizData.userAnswer7ForQ3
        .removeWhere((answer) => answer.text == toRemove.text);
    QuizData.userAnswer8ForQ3
        .removeWhere((answer) => answer.text == toRemove.text);
  }

  @override
  void didChangeDependencies() {
    if (widget.questionIndex == 3) {
      correctAnswers = QuizData.correctAnswersForQ3;
      usersAnswers = QuizData.usersAnswersForQ3;
      listQuestionBody = QuizData.listQuestionBody3;
    } else {
      correctAnswers = QuizData.correctAnswersForQ7;
      usersAnswers = QuizData.usersAnswersForQ7;
      listQuestionBody = QuizData.listQuestionBody7;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(
                HW.getWidth(24, context),
                HW.getHeight(24, context),
                HW.getWidth(24, context),
                HW.getHeight(36, context),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.question,
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1
                            ?.copyWith(fontSize: HW.getHeight(24, context)),
                      ),
                      Text(
                        '*helper text',
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            fontSize: HW.getHeight(12, context),
                            color: AppColors.grey),
                      ),
                    ],
                  )
                ],
              ),
            ),
            AbsorbPointer(
              absorbing: QuizData.showRightAnswers,
              child: Container(
                margin:
                    EdgeInsets.symmetric(horizontal: HW.getWidth(48, context)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                        width: MediaQuery.of(context).size.width,
                        margin:
                            EdgeInsets.only(bottom: HW.getHeight(63, context)),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: AppColors.underlineInputBorderColor)),
                        child: Row(children: [
                          ...widget.answers
                              .map(
                                (answer) => Expanded(
                                  child: InkWell(
                                    child: buildTarget(
                                      inTopContainer: true,
                                      context: context,
                                      answers: [answer],
                                      onAccept: (data) => setState(() {
                                        // if (widget.answers.contains(
                                        //     Answers(value: 0, text: ''))) {
                                        print("List ${widget.answers}");
                                        //   }
                                        print(data.text);
                                        removeAll(data);
                                        widget.answers.add(data);
                                      }),
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                        ])),
                    Container(
                      child: Wrap(
                        direction: Axis.horizontal,
                        crossAxisAlignment: WrapCrossAlignment.start,
                        children: QuizData.showRightAnswers
                            ? [
                                ...usersAnswers.map(
                                  (element) {
                                    if (element is DragWordsWidget) {
                                      return buildTarget(
                                        correctAnswer: element.correctAnswer,
                                        context: context,
                                        answers: element.answers,
                                        onAccept: (data) => setState(() {
                                          removeAll(data);
                                          // print(data.text);
                                          element.answers.add(data);
                                        }),
                                        isCorrect: element.isRight,
                                      );
                                    } else {
                                      return TextQuestion(
                                          text: element as String);
                                    }
                                  },
                                )
                              ]
                            : [
                                ...listQuestionBody.map((element) {
                                  if (element is DragWordsWidget) {
                                    return buildTarget(
                                      isCorrect: element.isRight,
                                      context: context,
                                      answers: element.answers,
                                      onAccept: (data) => setState(() {
                                        removeAll(data);
                                        if (element.answers.isEmpty) {
                                          element.answers.add(data);
                                        } else {
                                          widget.answers
                                              .add(element.answers.last);
                                          element.answers.removeLast();
                                          element.answers.add(data);
                                        }
                                        if (widget.answers.isEmpty) {
                                          widget.answers.add(Answers(
                                            value: data.value,
                                            text: '',
                                          ));
                                        }
                                      }),
                                    );
                                  } else {
                                    return TextQuestion(
                                        text: element as String);
                                  }
                                })
                              ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Visibility(
            //   visible: QuizData.showRightAnswers,
            //   child: Container(
            //     margin: const EdgeInsets.only(top: 100),
            //     padding: EdgeInsets.all(10),
            //     decoration: BoxDecoration(
            //       border: Border.all(color: AppColors.black100, width: 1),
            //     ),
            //     child: Wrap(
            //       direction: Axis.horizontal,
            //       children: [
            //         ...correctAnswers.map((element) {
            //           if (element is List<String>) {
            //             return Text(
            //               element.first,
            //               style: TextStyle(
            //                   decoration: TextDecoration.underline,
            //                   fontSize: TextFontSize.getHeight(35, context)),
            //             );
            //           } else {
            //             return Text(
            //               element as String,
            //               style: TextStyle(
            //                   fontSize: TextFontSize.getHeight(35, context)),
            //             );
            //           }
            //         })
            //       ],
            //     ),
            //   ),
            // )
          ],
        ),
      );
    });
  }
}

Widget _buildCheckdTarget({
  required Answers answers,
  required bool? isCorrect,
  required String? correctAnswer,
  required BuildContext context,
}) {
  return Container(
    width: HW.getWidth(100, context),
    decoration: const BoxDecoration(
      // color: AppColors.red,
      border: Border(
        bottom:
            BorderSide(width: 1, color: AppColors.underlineInputBorderColor),
      ),
      // color: inTopContainer ? null : AppColors.white,
    ),
    child: Container(
        child: answers.text == ""
            ? Column(
                children: [
                  Text(
                    correctAnswer!,
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                        color: AppColors.blueDeep,
                        fontSize: TextFontSize.getHeight(12, context)),
                  ),
                  Text(
                    '*empty*',
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                        color: AppColors.red,
                        fontSize: TextFontSize.getHeight(12, context),
                        decoration: TextDecoration.lineThrough),
                  )
                ],
              )
            : Column(
                children: [
                  Text(
                    correctAnswer!,
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                        color: AppColors.blueDeep,
                        fontSize: TextFontSize.getHeight(12, context)),
                  ),
                  Text(
                    answers.text,
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                        color: AppColors.red,
                        fontSize: TextFontSize.getHeight(16, context),
                        decoration: TextDecoration.lineThrough),
                  )
                ],
              )),
  );
}

Widget buildTarget({
  bool inTopContainer = false,
  bool? isCorrect,
  String? correctAnswer,
  required BuildContext context,
  required List<Answers> answers,
  List<CorrectAnswers>? correctAnswers,
  required DragTargetAccept<Answers> onAccept,
}) {
  return isCorrect != null && isCorrect == false
      ? Stack(
          children: answers
              .map((answer) => _buildCheckdTarget(
                    correctAnswer: correctAnswer,
                    answers: answer,
                    isCorrect: isCorrect,
                    context: context,
                  ))
              .toList(),
        )
      : Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            border: inTopContainer
                ? null
                : const Border(
                    bottom: BorderSide(
                        width: 1, color: AppColors.underlineInputBorderColor),
                  ),
            // color: inTopContainer ? null : AppColors.white,
          ),
          width: inTopContainer ? null : HW.getWidth(100, context),
          height: HW.getHeight(22.5, context),
          alignment: Alignment.center,
          child: InkWell(
            onTap: () {},
            child: DragTarget<Answers>(
              builder: (context, candidateData, rejectedData) => Stack(
                children: answers
                    .map((answer) => DraggableWidget(
                          correctAnswer: correctAnswer,
                          answers: answer,
                          isCorrect: isCorrect,
                        ))
                    .toList(),
              ),
              onWillAccept: (data) => true,
              onAccept: (data) {
                //    print(data.text);
                onAccept(data);
              },
              onLeave: (data) {
                //  print(data);
              },
            ),
          ),
        );
}
