import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:history_of_adventures/src/core/colors.dart';

import 'package:history_of_adventures/src/core/utils/styles.dart';
import 'package:history_of_adventures/src/core/widgets/widgets.dart';
import 'package:history_of_adventures/src/features/quiz/data/quiz_model.dart';
import 'package:history_of_adventures/src/features/quiz/presentation/question_widgets/answer_model.dart';
import 'package:history_of_adventures/src/features/quiz/presentation/question_widgets/custom_widgets/dialog_map_image.dart';
import 'package:history_of_adventures/src/features/quiz/presentation/question_widgets/custom_widgets/draggable_circles_widget.dart';
import 'package:universal_html/html.dart';

class QuizDragDropCirclesWidget extends StatefulWidget {
  final int questionIndex;
  final String question;
  final int score;
  final bool quizWithImage;
  final List<DrowLineWidget> userAnswer;
  final List<DrowLineWidget> userAnswerWithCheck;
  final List<DrowLineWidget> listCorrectrAnswers;

  final List<Answers<int>> answers;
  final List<Answers<int>> variants;

  const QuizDragDropCirclesWidget(
      {Key? key,
      required this.variants,
      required this.answers,
      required this.score,
      required this.userAnswer,
      required this.listCorrectrAnswers,
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

  final ScrollController _verticalController = ScrollController();
  final ScrollController _horizontalController = ScrollController();

  int targetValue = 0;

  void addUserAnswersWithCheck(int answerValue, int targetValue) {
    final lineOffsetEndUpdate = Offset(lineOffsetEnd.dx, lineOffsetEnd.dy);
    final newLine = DrowLineWidget(
      customPaint: CustomPaint(
        painter: DrowLine(
          color: AppColors.blueDeep,
          isRightLine: QuizData.valueForDrowColoredLineFor,
          strat: lineOffsetStart,
          end: lineOffsetEndUpdate,
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

  void addUserAnswers(int answerValue, int targetValue) {
    final lineOffsetEndUpdate = Offset(lineOffsetEnd.dx, lineOffsetEnd.dy);

    final newLine = DrowLineWidget(
      customPaint: CustomPaint(
        painter: DrowLine(
          color: AppColors.blueDeep,
          isRightLine: null,
          strat: lineOffsetStart,
          end: lineOffsetEndUpdate,
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

  void correctrAnswers() {
    widget.answers.forEach((answers) {
      widget.variants.forEach((variants) {
        if (answers.correctAnswers == variants.correctAnswers) {
          final RenderBox startRenderBox = answers.globalKey?.currentContext
              ?.findRenderObject() as RenderBox;
          final Offset startposition =
              startRenderBox.localToGlobal(const Offset(20, 20));
          final RenderBox endRenderBox = variants.globalKey?.currentContext
              ?.findRenderObject() as RenderBox;
          final Offset endposition =
              endRenderBox.localToGlobal(const Offset(15, 15));
          widget.listCorrectrAnswers.add(DrowLineWidget(
              customPaint: CustomPaint(
                painter: DrowLine(
                  strat: startposition,
                  end: endposition,
                  color: AppColors.grey,
                ),
              ),
              isRight: false,
              value: 0,
              targetValue: targetValue));
        }
      });
    });
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
    if (!QuizData.showRightAnswers) {
      WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
        correctrAnswers();
      });
    }
    return LayoutBuilder(builder: (context, constraints) {
      return MouseRegion(
        onHover: (e) {
          setState(() {
            final position = Offset(
                e.position.dx + _horizontalController.offset,
                e.position.dy + _verticalController.offset);
            mousePosition = position;
          });
        },
        child: SingleChildScrollView(
          controller: _verticalController,
          scrollDirection: Axis.vertical,
          child: Container(
            alignment: Alignment.centerLeft,
            width: ui.window.physicalSize.width,
            height: 1000,
            child: SingleChildScrollView(
              controller: _horizontalController,
              scrollDirection: Axis.horizontal,
              child: Container(
                width: 1300,
                height: 1000,
                child: Stack(
                  children: [
                    ...widget.userAnswer
                        .map((customPaint) => customPaint.customPaint),
                    if (QuizData.showRightAnswers)
                      ...widget.listCorrectrAnswers
                          .map((customPaint) => customPaint.customPaint),
                    if (QuizData.showRightAnswers)
                      ...widget.userAnswerWithCheck
                          .map((customPaint) => customPaint.customPaint),
                    CustomPaint(
                      painter: DrowLine(
                        color: AppColors.blueDeep,
                        strat: drowingLineStartOffset,
                        end: drowingLineEndOffset,
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: AbsorbPointer(
                        absorbing: QuizData.showRightAnswers,
                        child: Container(
                          height: 1000,
                          margin: const EdgeInsets.only(
                              top: 120, left: 20, right: 20),
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
                                                maxLines: 2,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline2
                                                    ?.copyWith(
                                                      fontSize: TextFontSize
                                                          .getHeight(
                                                              45, context),
                                                    ))),
                                        Flexible(
                                            child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 3, horizontal: 5),
                                          decoration: BoxDecoration(
                                              color: AppColors.grey,
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: score(),
                                        ))
                                      ])),
                              Row(
                                children: <Widget>[
                                  Container(
                                    width: 700,
                                    child: Column(children: [
                                      ...widget.answers
                                          .map(
                                            (answer) => Container(
                                              width: 700,
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Container(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      width: 500,
                                                      height:
                                                          widget.quizWithImage
                                                              ? 110
                                                              : 50,
                                                      child: Text(answer.text)),
                                                  Container(
                                                    key: answer.globalKey,
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    height: 50,
                                                    width: 150,
                                                    child: buildTarget(
                                                      onDragCompleted: () {
                                                        print(
                                                            'onDragCompleted');
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
                                                          lineOffsetEnd = mousePosition +
                                                              Offset(
                                                                  _horizontalController
                                                                      .offset,
                                                                  _verticalController
                                                                      .offset);

                                                          drowingLineEndOffset =
                                                              mousePosition +
                                                                  Offset(
                                                                      _horizontalController
                                                                          .offset,
                                                                      _verticalController
                                                                          .offset);
                                                        });
                                                      },
                                                      onWillAccept: false,
                                                      onMove: (data) {
                                                        setState(() {
                                                          var withScroolOfset = data
                                                                  .offset +
                                                              Offset(
                                                                  _horizontalController
                                                                      .offset,
                                                                  _verticalController
                                                                      .offset);
                                                          lineOffsetEnd =
                                                              withScroolOfset;

                                                          drowingLineEndOffset =
                                                              withScroolOfset;
                                                        });
                                                      },
                                                      context: context,
                                                      answers: [answer],
                                                      onAccept: (data) {
                                                        print('onAccept');
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
                                                      mouseOffset:
                                                          mousePosition,
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
                                    child: Container(
                                      width: 400,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          ...widget.variants
                                              .map(
                                                (variant) => Container(
                                                  width: 700,
                                                  child: Row(
                                                    children: [
                                                      Container(
                                                        key: variant.globalKey,
                                                        alignment: Alignment
                                                            .centerLeft,
                                                        height: 50,
                                                        width: 50,
                                                        child: buildTarget(
                                                          targetIsImage: widget
                                                              .quizWithImage,
                                                          onWillAccept: true,
                                                          onMove: (data) {
                                                            setState(() {
                                                              // lineOffsetEnd = data.offset;
                                                              //  print(data.offset);
                                                            });
                                                          },
                                                          isDraging: false,
                                                          correctAnswers: [
                                                            variant
                                                                .correctAnswers!
                                                          ],
                                                          context: context,
                                                          answers: [variant],
                                                          onAccept: (data) {
                                                            if (variant
                                                                    .correctAnswers! ==
                                                                data.correctAnswers) {
                                                              QuizData.valueForDrowColoredLineFor =
                                                                  true;
                                                              targetValue =
                                                                  variant.value;
                                                              print(
                                                                  'It is write :::TargetValue $targetValue');
                                                            } else {
                                                              QuizData.valueForDrowColoredLineFor =
                                                                  false;
                                                              targetValue =
                                                                  variant.value;

                                                              print(
                                                                  'It is  wrong :::TargetValue $targetValue');
                                                            }
                                                          },
                                                          mouseOffset:
                                                              mousePosition,
                                                        ),
                                                      ),
                                                      if (widget.quizWithImage)
                                                        Clickable(
                                                          onPressed: () {
                                                            showDialog(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (context) {
                                                                  return DialoigMapImage(
                                                                    image: variant
                                                                        .text,
                                                                  );
                                                                });
                                                          },
                                                          child: Container(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      bottom:
                                                                          8),
                                                              width: 200,
                                                              height: 110,
                                                              child:
                                                                  Image.asset(
                                                                variant.text,
                                                                fit: BoxFit
                                                                    .cover,
                                                              )),
                                                        )
                                                      else
                                                        Flexible(
                                                          child: Container(
                                                              alignment: Alignment
                                                                  .centerLeft,
                                                              height: 50,
                                                              child: Text(
                                                                "  ${variant.text}",
                                                                maxLines: 2,
                                                              )),
                                                        ),
                                                    ],
                                                  ),
                                                ),
                                              )
                                              .toList(),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
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
                      height: double.infinity,
                      child: Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.blue, width: 3),
                          color: Colors.white,
                        ),
                      ),
                    ))
              .toList(),
        ),
        onWillAccept: (data) {
          return onWillAccept;
        },
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
  final Color color;

  DrowLine(
      {
      //required this.color,
      required this.strat,
      required this.end,
      this.isRightLine,
      required this.color
      // required this.currentColor,
      });
  @override
  void paint(Canvas canvas, Size size) {
    final p1 = strat;
    final p2 = end;
    final paint = Paint()
      ..strokeCap = StrokeCap.round
      ..color = isRightLine == null
          ? color
          : isRightLine!
              ? AppColors.green
              : AppColors.red
      ..strokeWidth = 2.5;

    canvas.drawLine(strat, end, paint);
  }

  void _drawDashedLine(Canvas canvas, Offset start, Offset end, Paint paint) {
    // Chage to your preferred size
    const int dashWidth = 4;
    const int dashSpace = 4;

    // Start to draw from left size.
    // Of course, you can change it to match your requirement.
    double startX = start.dx;
    double startY = start.dy;
    double y = 10;

    // Repeat drawing until we reach the right edge.
    // In our example, size.with = 300 (from the SizedBox)

    // Draw a small line.
    while (startX < end.dx) {
      // Draw a small line.
      canvas.drawLine(Offset(startX, start.dy),
          Offset(startX + dashWidth, end.dy + dashWidth), paint);

      // Update the starting X
      startX += dashWidth + dashSpace;
    }
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
