import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:history_of_adventures/src/core/colors.dart';
import 'package:history_of_adventures/src/core/utils/assets_path.dart';
import 'package:history_of_adventures/src/core/utils/styles.dart';
import 'package:history_of_adventures/src/features/quiz/data/model/quiz_model.dart';
import 'package:history_of_adventures/src/features/quiz/presentation/question_widgets/answer_model.dart';
import 'package:history_of_adventures/src/features/quiz/presentation/question_widgets/custom_widgets/draggable_circles_widget.dart';
import 'package:history_of_adventures/src/features/quiz/presentation/question_widgets/custom_widgets/draggable_widget.dart';
import 'package:history_of_adventures/src/features/quiz/presentation/question_widgets/custom_widgets/text_question_widget.dart';

class QuizDragDropCirclesWidget extends StatefulWidget {
  final int questionIndex;
  final String question;

  final List<Answers> answers;
  final List<Answers> variants;

  QuizDragDropCirclesWidget(
      {Key? key,
      required this.variants,
      required this.answers,
      required this.question,
      required this.questionIndex})
      : super(key: key);

  @override
  _QuizDragDropCirclesWidgetState createState() =>
      _QuizDragDropCirclesWidgetState();
}

class _QuizDragDropCirclesWidgetState extends State<QuizDragDropCirclesWidget> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  void removeAll(Answers toRemove) {
    widget.answers.removeWhere((answer) => answer.text == toRemove.text);
  }

  // void _getWidgetInfo(_) {
  //   final RenderBox renderBox =
  //       globalKeyStack.currentContext?.findRenderObject() as RenderBox;

  //   final Size size = renderBox.size; // or _widgetKey.currentContext?.size
  //   print('Size: ${size.width}, ${size.height}');

  //   final Offset offset = renderBox.localToGlobal(Offset.zero);
  //   print('Offset: ${offset.dx}, ${offset.dy}');
  //   print(
  //       'Position: ${(offset.dx + size.width) / 2}, ${(offset.dy + size.height) / 2}');
  // }

  Offset lineOffsetStart = Offset.zero;
  Offset lineOffsetEnd = Offset.zero;
  Offset mousePosition = Offset.zero;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return MouseRegion(
        onHover: (e) {
          setState(() {
            mousePosition = e.position;
          });
        },
        child: Stack(
          children: [
            CustomPaint(
              painter: DrowLine(
                strat: lineOffsetStart,
                end: lineOffsetEnd,
              ),
            ),
            Container(
              height: constraints.maxHeight,
              margin: EdgeInsets.symmetric(
                horizontal: constraints.maxWidth * 0.05,
                vertical: 50,
              ),
              child: SingleChildScrollView(
                child: Container(
                  height: 500,
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
                      Text(
                        widget.question,
                        style: Theme.of(context).textTheme.headline2?.copyWith(
                            fontSize: TextFontSize.getHeight(45, context)),
                      ),
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
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Flexible(
                                                flex: 4,
                                                child: Text(answer.text)),
                                            Expanded(
                                              child: Container(
                                                child: buildTarget(
                                                    getStartLineOffset:
                                                        (mousePosition) {
                                                      lineOffsetStart =
                                                          mousePosition;
                                                    },
                                                    getEndLineOffset:
                                                        (mousePosition) {
                                                      setState(() {
                                                        lineOffsetEnd =
                                                            mousePosition;
                                                      });
                                                    },
                                                    onWillAccept: false,
                                                    onMove: (data) {
                                                      setState(() {
                                                        lineOffsetEnd =
                                                            data.offset;
                                                      });
                                                    },
                                                    context: context,
                                                    answers: [answer],
                                                    onAccept: (data) {},
                                                    mouseOffset: mousePosition),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                    .toList(),
                              ]),
                            ),
                            Flexible(
                              child: Column(
                                children: <Widget>[
                                  ...widget.variants
                                      .map(
                                        (variant) => Expanded(
                                          child: buildTarget(
                                            onWillAccept: true,
                                            onMove: (data) {
                                              setState(() {
                                                //  lineOffsetEnd = data.offset;
                                                //  print(data.offset);
                                              });
                                            },
                                            isDraging: false,
                                            correctAnswers: [
                                              variant.correctAnswers!
                                            ],
                                            context: context,
                                            answers: [variant],
                                            onAccept: (data) {},
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
              ),
            ),
          ],
        ),
      );
    });
  }
}

Widget buildTarget({
  bool isDraging = true,
  required BuildContext context,
  required List<Answers> answers,
  List<CorrectAnswers>? correctAnswers,
  required bool onWillAccept,
  required Offset mouseOffset,
  required DragTargetAccept<Answers> onAccept,
  required DragTargetMove<Answers> onMove,
  Function(Offset)? getEndLineOffset,
  Function(Offset)? getStartLineOffset,
}) =>
    Container(
      child: DragTarget<Answers>(
        onMove: (data) {
          onMove(data);
          // getEndLineOffset!(mouseOffset);
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
                    )
                  : Row(
                      children: [
                        Container(
                          height: 35,
                          width: 35,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.blue, width: 3),
                            color: Colors.white,
                          ),
                          child: Center(
                            child: Text('${answer.value}'),
                          ),
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        Text(answer.text)
                      ],
                    ))
              .toList(),
        ),
        onWillAccept: (data) => onWillAccept,
        onAccept: (data) {
          if (correctAnswers!.contains(data.correctAnswers)) {
            print('It is write ');
          } else {
            print('It is  wrong');
          }

          onAccept(data);
        },
      ),
    );

enum CorrectAnswers {
  answer1,
  answer2,
  answer3,
  answer4,
  answer5,
  answer6,
  answer7,
}

class DrowLine extends CustomPainter {
  final Offset strat;
  final Offset end;

  DrowLine({
    //required this.color,
    required this.strat,
    required this.end,
    // required this.currentColor,
  });
  @override
  void paint(Canvas canvas, Size size) {
    final p1 = strat;
    final p2 = end;
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 1;
    canvas.drawLine(p1, p2, paint);
  }

  @override
  bool shouldRepaint(DrowLine oldDelegate) => true;
}
