import 'dart:math';

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
import 'package:history_of_adventures/src/features/quiz/presentation/widgets_demo/answer.dart';

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
    // print(answer1.first.text);
    // print(answer2.first.text);
    // print(answer3.first.text);
    // print(answer4.first.text);
    // print(answer5.first.text);
    // print(answer6.first.text);
    // print(answer7.first.text);
    // print(answer8.first.text);
    super.dispose();
  }

  final List<Answers> answer1 = [];
  final List<Answers> answer2 = [];
  final List<Answers> answer3 = [];
  final List<Answers> answer4 = [];
  final List<Answers> answer5 = [];
  final List<Answers> answer6 = [];
  final List<Answers> answer7 = [];
  final List<Answers> answer8 = [];

  @override
  void initState() {
    super.initState();
  }

  void removeAll(Answers toRemove) {
    widget.answers.removeWhere((answer) => answer.text == toRemove.text);
    answer1.removeWhere((answer) => answer.text == toRemove.text);
    answer2.removeWhere((answer) => answer.text == toRemove.text);
    answer3.removeWhere((answer) => answer.text == toRemove.text);
    answer4.removeWhere((answer) => answer.text == toRemove.text);
    answer5.removeWhere((answer) => answer.text == toRemove.text);
    answer6.removeWhere((answer) => answer.text == toRemove.text);
    answer7.removeWhere((answer) => answer.text == toRemove.text);
    answer8.removeWhere((answer) => answer.text == toRemove.text);
  }

  Offset lineOffset = const Offset(0, 0);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
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
                  style: Theme.of(context)
                      .textTheme
                      .headline2
                      ?.copyWith(fontSize: TextFontSize.getHeight(45, context)),
                ),
                Expanded(
                  child: MouseRegion(
                    onHover: (e) {
                      setState(() {
                        lineOffset = e.position;
                      });
                    },
                    child: Stack(
                      children: [
                        Row(
                          children: <Widget>[
                            Expanded(
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
                                            Flexible(
                                              child: buildTarget(
                                                context: context,
                                                answers: [answer],
                                                onAccept: (data) =>
                                                    setState(() {
                                                  //print(widget.answers);
                                                }),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                    .toList(),
                              ]),
                            ),
                            const SizedBox(
                              width: 100,
                            ),
                            Flexible(
                              child: Column(
                                children: <Widget>[
                                  ...widget.variants
                                      .map(
                                        (variant) => Expanded(
                                          child: buildTarget(
                                            isDraging: false,
                                            correctAnswers: [
                                              variant.correctAnswers!
                                            ],
                                            context: context,
                                            answers: [variant],
                                            onAccept: (data) => setState(() {
                                              print(widget.answers);
                                            }),
                                          ),
                                        ),
                                      )
                                      .toList(),
                                ],
                              ),
                            ),
                          ],
                        ),
                        CustomPaint(
                          painter:
                              DrowLine(end: lineOffset, strat: Offset(0, 0)),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
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
  required DragTargetAccept<Answers> onAccept,
}) =>
    Container(
      child: DragTarget<Answers>(
        hitTestBehavior: HitTestBehavior.deferToChild,
        builder: (context, candidateData, rejectedData) => Stack(
          children: answers
              .map((answer) => isDraging
                  ? DraggableCirclesWidget(answer: answer)
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
        onWillAccept: (data) => true,
        onAccept: (data) {
          if (correctAnswers!.contains(data.correctAnswers)) {
            print('It is write ');
          } else {
            print('It is  wrong');
          }

          onAccept(data);
        },
        onLeave: (data) {
          //  print(data);
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
