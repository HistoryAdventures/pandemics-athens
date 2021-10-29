import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
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
        height: constraints.maxHeight,
        margin: EdgeInsets.symmetric(
          horizontal: constraints.maxWidth * 0.05,
          vertical: 100,
        ),
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
                      flex: 5,
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
                        child: widget.questionIndex == 3
                            ? Text(
                                "${QuizData.rightAnswersForQ3} / ${widget.score}")
                            : Text(
                                "${QuizData.rightAnswersForQ7} / ${widget.score}"),
                      ),
                    )
                  ],
                ),
              ),
              AbsorbPointer(
                absorbing: QuizData.showRightAnswers,
                child: Container(
                  margin: const EdgeInsets.only(top: 50),
                  child: Column(
                    children: <Widget>[
                      Container(
                          width: MediaQuery.of(context).size.width,
                          // padding: const EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                              border: Border.all(color: AppColors.blueDeep)),
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
                      const SizedBox(
                        height: 60,
                      ),
                      Wrap(
                        direction: Axis.horizontal,
                        crossAxisAlignment: WrapCrossAlignment.start,
                        children: QuizData.showRightAnswers
                            ? [
                                ...usersAnswers.map(
                                  (element) {
                                    if (element is DragWordsWidget) {
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 0),
                                        child: buildTarget(
                                          context: context,
                                          answers: element.answers,
                                          onAccept: (data) => setState(() {
                                            removeAll(data);
                                            // print(data.text);
                                            element.answers.add(data);
                                          }),
                                          isCorrect: element.isRight,
                                        ),
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
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8.0),
                                      child: buildTarget(
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
                                            widget.answers.add(
                                                Answers(value: 0, text: ''));
                                          }
                                        }),
                                      ),
                                    );
                                  } else {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8.0),
                                      child:
                                          TextQuestion(text: element as String),
                                    );
                                  }
                                })
                              ],
                      ),
                    ],
                  ),
                ),
              ),
              Visibility(
                visible: QuizData.showRightAnswers,
                child: Container(
                  margin: const EdgeInsets.only(top: 100),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.black100, width: 1),
                  ),
                  child: Wrap(
                    direction: Axis.horizontal,
                    children: [
                      ...correctAnswers.map((element) {
                        if (element is List<String>) {
                          return Text(
                            element.first,
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontSize: TextFontSize.getHeight(35, context)),
                          );
                        } else {
                          return Text(
                            element as String,
                            style: TextStyle(
                                fontSize: TextFontSize.getHeight(35, context)),
                          );
                        }
                      })
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}

Widget buildTarget({
  bool inTopContainer = false,
  bool? isCorrect,
  required BuildContext context,
  required List<Answers> answers,
  List<CorrectAnswers>? correctAnswers,
  required DragTargetAccept<Answers> onAccept,
}) =>
    Container(
      decoration: BoxDecoration(
        border: inTopContainer
            ? null
            : Border.all(
                color: isCorrect == null
                    ? AppColors.blueDeep
                    : isCorrect
                        ? AppColors.green
                        : AppColors.red),
        boxShadow: inTopContainer
            ? null
            : const [
                BoxShadow(
                    blurRadius: 1,
                    offset: Offset(1, 1),
                    color: AppColors.black25),
              ],
        borderRadius: inTopContainer ? null : BorderRadius.circular(5),
        color: inTopContainer ? null : AppColors.white,
      ),
      width: inTopContainer ? null : 100,
      height: 35,
      alignment: Alignment.center,
      child: InkWell(
        onTap: () {},
        child: DragTarget<Answers>(
          builder: (context, candidateData, rejectedData) => Stack(
            children: answers
                .map((answer) => DraggableWidget(answers: answer))
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