import 'package:flutter/material.dart';
import 'package:history_of_adventures/src/core/colors.dart';

import 'package:history_of_adventures/src/core/utils/styles.dart';
import 'package:history_of_adventures/src/features/quiz/data/quiz_model.dart';
import 'package:history_of_adventures/src/features/quiz/presentation/question_widgets/answer_model.dart';
import 'package:history_of_adventures/src/features/quiz/presentation/question_widgets/custom_widgets/draggable_circles_widget.dart';
import 'package:universal_html/html.dart';

class QuizDragDropCirclesWidget extends StatefulWidget {
  final int questionIndex;
  final String question;
  final int score;
  final bool quizWithImage;
  final List<DrowLineWidget> userAnswer;
  final List<DrowLineWidget> userAnswerWithCheck;

  final List<Answers<int>> answers;
  final List<Answers<int>> variants;

  const QuizDragDropCirclesWidget(
      {Key? key,
      required this.variants,
      required this.answers,
      required this.score,
      required this.userAnswer,
      required this.userAnswerWithCheck,
      this.quizWithImage = false,
      required this.question,
      required this.questionIndex})
      : super(key: key);

  @override
  _QuizDragDropCirclesWidgetState createState() =>
      _QuizDragDropCirclesWidgetState();
}

class _QuizDragDropCirclesWidgetState extends State<QuizDragDropCirclesWidget> {
  void removeAll(Answers toRemove) {
    widget.answers.removeWhere((answer) => answer.text == toRemove.text);
  }

  Offset lineOffsetStart = Offset.zero;
  Offset lineOffsetEnd = Offset.zero;
  Offset mousePosition = Offset.zero;

  Offset drowingLineStartOffset = Offset.zero;
  Offset drowingLineEndOffset = Offset.zero;

  int targetValue = 0;

  addUserAnswersWithCheck(int answerValue, int targetValue) {
    var newLine = DrowLineWidget(
      customPaint: CustomPaint(
        painter: DrowLine(
          isRightLine: QuizData.valueForDrowColoredLineFor,
          strat: lineOffsetStart,
          end: lineOffsetEnd,
        ),
      ),
      isRight: QuizData.valueForDrowColoredLineFor,
      value: answerValue,
      targetValue: targetValue,
    );

    if (widget.userAnswerWithCheck.isEmpty) {
      widget.userAnswerWithCheck.add(newLine);
    } else {
      for (var i = 0; i < widget.userAnswerWithCheck.length; i++) {
        if (widget.userAnswerWithCheck[i].value == answerValue ||
            widget.userAnswerWithCheck[i].targetValue == targetValue) {
          print(widget.userAnswerWithCheck[i].value);
          widget.userAnswerWithCheck
              .removeWhere((element) => element.value == answerValue);
          widget.userAnswerWithCheck
              .removeWhere((element) => element.targetValue == targetValue);
          widget.userAnswerWithCheck.add(newLine);
        } else {
          widget.userAnswerWithCheck.add(newLine);
        }
      }
    }
  }

  addUserAnswers(int answerValue, int targetValue) {
    print(answerValue);
    final newLine = DrowLineWidget(
      customPaint: CustomPaint(
        painter: DrowLine(
          isRightLine: null,
          strat: lineOffsetStart,
          end: lineOffsetEnd,
        ),
      ),
      isRight: null,
      value: answerValue,
      targetValue: targetValue,
    );

    if (widget.userAnswer.isEmpty) {
      widget.userAnswer.add(newLine);
    } else {
      //widget.userAnswer.add(newLine);
      for (var i = 0; i < widget.userAnswer.length; i++) {
        if (widget.userAnswer[i].value == answerValue ||
            widget.userAnswer[i].targetValue == targetValue) {
          print(widget.userAnswer[i].value);
          widget.userAnswer
              .removeWhere((element) => element.value == answerValue);
          widget.userAnswer
              .removeWhere((element) => element.targetValue == targetValue);
          widget.userAnswer.add(newLine);
        } else {
          widget.userAnswer.add(newLine);
        }
      }
    }
  }

  @override
  void initState() {
    super.initState();
    print(QuizData.rightAnswersForQ4);
    print(QuizData.rightAnswersForQ1);
    print(QuizData.rightAnswersForQ9);
  }

  Widget score() {
    switch (widget.questionIndex) {
      case 1:
        return Text("${QuizData.rightAnswersForQ1} / ${widget.answers.length}");
      case 4:
        return Text("${QuizData.rightAnswersForQ4} / ${widget.answers.length}");
      case 9:
        return Text("${QuizData.rightAnswersForQ9} / ${widget.answers.length}");
      default:
        return Text("${QuizData.rightAnswersForQ1} / ${widget.answers.length}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: QuizData.showRightAnswers,
      child: LayoutBuilder(builder: (context, constraints) {
        return MouseRegion(
          onHover: (e) {
            setState(() {
              mousePosition = e.position;
            });
          },
          child: SingleChildScrollView(
            child: Container(
              height: constraints.maxHeight,
              child: Stack(
                children: [
                  ...widget.userAnswer
                      .map((customPaint) => customPaint.customPaint),
                  if (QuizData.showRightAnswers)
                    ...widget.userAnswerWithCheck
                        .map((customPaint) => customPaint.customPaint),
                  CustomPaint(
                    painter: DrowLine(
                      strat: drowingLineStartOffset,
                      end: drowingLineEndOffset,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(80),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                      flex: 5,
                                      child: Text(widget.question,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline2
                                              ?.copyWith(
                                                fontSize:
                                                    TextFontSize.getHeight(
                                                        45, context),
                                              ))),
                                  Flexible(
                                      child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 3, horizontal: 5),
                                    decoration: BoxDecoration(
                                        color: AppColors.grey,
                                        borderRadius: BorderRadius.circular(5)),
                                    child: score(),
                                  ))
                                ])),
                        Expanded(
                          child: Row(
                            children: <Widget>[
                              Flexible(
                                child: Column(children: [
                                  ...widget.answers
                                      .map(
                                        (answer) => Expanded(
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                  flex: 3,
                                                  child: Text(answer.text)),
                                              Flexible(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                    bottom: 8,
                                                  ),
                                                  child: buildTarget(
                                                    onDragCompleted: () {
                                                      setState(() {
                                                        drowingLineEndOffset =
                                                            Offset.zero;
                                                        drowingLineStartOffset =
                                                            Offset.zero;
                                                      });
                                                      addUserAnswers(
                                                          answer.value,
                                                          targetValue);
                                                      addUserAnswersWithCheck(
                                                          answer.value,
                                                          targetValue);
                                                    },
                                                    targetIsImage: false,
                                                    getStartLineOffset:
                                                        (mousePosition) {
                                                      drowingLineStartOffset =
                                                          mousePosition;

                                                      lineOffsetStart =
                                                          mousePosition;
                                                    },
                                                    getEndLineOffset:
                                                        (mousePosition) {
                                                      setState(() {
                                                        lineOffsetEnd =
                                                            mousePosition;

                                                        drowingLineEndOffset =
                                                            mousePosition;
                                                      });
                                                    },
                                                    onWillAccept: false,
                                                    onMove: (data) {
                                                      setState(() {
                                                        lineOffsetEnd =
                                                            data.offset;

                                                        drowingLineEndOffset =
                                                            data.offset;
                                                      });
                                                    },
                                                    context: context,
                                                    answers: [answer],
                                                    onAccept: (data) {
                                                      print(data.value);
                                                    },
                                                    onDragEnd: () {
                                                      drowingLineEndOffset =
                                                          Offset.zero;
                                                      drowingLineStartOffset =
                                                          Offset.zero;
                                                      // print(
                                                      //     drowingLineEndOffset);
                                                      // print(
                                                      //     drowingLineStartOffset);
                                                    },
                                                    mouseOffset: mousePosition,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                      .toList(),
                                ]),
                              ),
                              Expanded(
                                child: Column(
                                  children: <Widget>[
                                    ...widget.variants
                                        .map(
                                          (variant) => Expanded(
                                            child: buildTarget(
                                              targetIsImage:
                                                  widget.quizWithImage,
                                              onWillAccept: true,
                                              onMove: (data) {
                                                setState(() {
                                                  // lineOffsetEnd = data.offset;
                                                  //  print(data.offset);
                                                });
                                              },
                                              isDraging: false,
                                              correctAnswers: [
                                                variant.correctAnswers!
                                              ],
                                              context: context,
                                              answers: [variant],
                                              onAccept: (data) {
                                                if (variant.correctAnswers! ==
                                                    data.correctAnswers) {
                                                  QuizData.valueForDrowColoredLineFor =
                                                      true;
                                                  targetValue = variant.value;
                                                  print(
                                                      'It is write :::TargetValue $targetValue');
                                                } else {
                                                  QuizData.valueForDrowColoredLineFor =
                                                      false;
                                                  targetValue = variant.value;

                                                  print(
                                                      'It is  wrong :::TargetValue $targetValue');
                                                }
                                              },
                                              mouseOffset: mousePosition,
                                            ),
                                          ),
                                        )
                                        .toList(),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}

Widget buildTarget(
        {bool isDraging = true,
        required BuildContext context,
        required List<Answers<int>> answers,
        List<CorrectAnswers>? correctAnswers,
        required bool onWillAccept,
        required Offset mouseOffset,
        bool targetIsImage = false,
        required DragTargetAccept<Answers<int>> onAccept,
        required DragTargetMove<Answers> onMove,
        Function(Offset)? getEndLineOffset,
        Function(Offset)? getStartLineOffset,
        Function()? onDragCompleted,
        Function()? onDragEnd}) =>
    Container(
      child: DragTarget<Answers<int>>(
        onMove: (data) {
          onMove(data);
        },
        builder: (context, candidateData, rejectedData) => Stack(
          children: answers
              .map((answer) => isDraging
                  ? DraggableCirclesWidget(
                      answer: answer,
                      offset: mouseOffset,
                      getStartLineOffset: (mouseOffset) {
                        getStartLineOffset!(mouseOffset);
                      },
                      getEndLineOffset: (mouseOffset) {
                        getEndLineOffset!(mouseOffset);
                      },
                      onDragCompleted: () {
                        onDragCompleted!();
                      },
                      onDragEnd: (draggableDetails) {
                        onDragEnd!();
                      },
                    )
                  : Container(
                      padding: const EdgeInsets.only(bottom: 8),
                      height: double.infinity,
                      child: Row(
                        children: [
                          Flexible(
                            child: Container(
                              height: 35,
                              width: 35,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border:
                                    Border.all(color: Colors.blue, width: 3),
                                color: Colors.white,
                              ),
                              child: Center(
                                child: Text('${answer.value}'),
                              ),
                            ),
                          ),
                          const Flexible(
                            child: SizedBox(
                              width: 30,
                            ),
                          ),
                          if (targetIsImage)
                            Flexible(
                              child: SizedBox(
                                  width: 200,
                                  child: Image.asset(
                                    answer.text,
                                    fit: BoxFit.cover,
                                  )),
                            )
                          else
                            Flexible(child: Text(answer.text))
                        ],
                      ),
                    ))
              .toList(),
        ),
        onWillAccept: (data) => onWillAccept,
        onAccept: (data) {
          // if (correctAnswers!.contains(data.correctAnswers)) {
          //   QuizData.valueForDrowColoredLineFor = true;
          //   print('It is write,target value:::${data.value} ');
          // } else {
          //   QuizData.valueForDrowColoredLineFor = false;
          //   print('It is  wrong,target value:::${data.value} ');
          // }
          onAccept(data);
        },
      ),
    );

class DrowLine extends CustomPainter {
  final Offset strat;
  final Offset end;
  final bool? isRightLine;

  DrowLine({
    //required this.color,
    required this.strat,
    required this.end,
    this.isRightLine,
    // required this.currentColor,
  });
  @override
  void paint(Canvas canvas, Size size) {
    final p1 = strat;
    final p2 = end;
    final paint = Paint()
      ..color = isRightLine == null
          ? AppColors.blueDeep
          : isRightLine!
              ? AppColors.green
              : AppColors.red
      ..strokeWidth = 2.5;
    canvas.drawLine(p1, p2, paint);
  }

  @override
  bool shouldRepaint(DrowLine oldDelegate) => true;
}

class DrowLineWidget {
  final int value;
  final int targetValue;
  bool? isRight;
  final Widget customPaint;

  DrowLineWidget(
      {required this.customPaint,
      required this.isRight,
      required this.value,
      required this.targetValue});
}
