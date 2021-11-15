import 'dart:ui' as ui;

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:history_of_adventures/src/core/colors.dart';

import 'package:history_of_adventures/src/core/utils/styles.dart';
import 'package:history_of_adventures/src/core/widgets/widgets.dart';
import 'package:history_of_adventures/src/features/quiz/data/quiz_model.dart';
import 'package:history_of_adventures/src/features/quiz/presentation/question_widgets/answer_model.dart';
import 'package:history_of_adventures/src/features/quiz/presentation/question_widgets/circle_widget.dart';
import 'package:history_of_adventures/src/features/quiz/presentation/question_widgets/custom_widgets/dialog_map_image.dart';
import 'package:history_of_adventures/src/features/quiz/presentation/question_widgets/custom_widgets/draggable_circles_widget.dart';
import 'package:history_of_adventures/src/features/quiz/presentation/question_widgets/drag_drop_widgets/circle_button.dart';
import 'package:history_of_adventures/src/features/quiz/presentation/question_widgets/drag_drop_widgets/drag_drop_models.dart';
import 'package:history_of_adventures/src/features/quiz/presentation/question_widgets/drag_drop_widgets/drag_object.dart';
import 'package:history_of_adventures/src/features/quiz/presentation/question_widgets/drag_drop_widgets/painter.dart';

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
          color: AppColors.grey,
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

  // Widget score() {
  //   switch (widget.questionIndex) {
  //     case 1:
  //       return Text("${QuizData.rightAnswersForQ1} / ${widget.answers.length}");
  //     case 4:
  //       return Text("${QuizData.rightAnswersForQ4} / ${widget.answers.length}");
  //     case 9:
  //       return Text("${QuizData.rightAnswersForQ9} / ${widget.answers.length}");
  //     default:
  //       return Text("${QuizData.rightAnswersForQ1} / ${widget.answers.length}");
  //   }
  // }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // if (!QuizData.showRightAnswers) {
    //   WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
    //     correctrAnswers();
    //   });
    // }
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: DragDropQuizBody(),
    );
  }
}

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
      ..strokeWidth = 1.5;

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

////////..............////////
////////// NEW QUIZ UI////////
///...................///////
class DragDropQuizBody extends StatefulWidget {
  static final GlobalKey<__DragDropQuizBodyState> dragDropBodyKey =
      GlobalKey<__DragDropQuizBodyState>();
  DragDropQuizBody({Key? key}) : super(key: dragDropBodyKey);

  @override
  __DragDropQuizBodyState createState() => __DragDropQuizBodyState();
}

class __DragDropQuizBodyState extends State<DragDropQuizBody> {
  List<Line> lines = [];
  static List<QuizItem> questions = [];
  List<LineToSave> savedLines = [];
  Line? drawingLine;

  double circleButtonWidth = 0;
  Offset offset = Offset(0, 0);
  Offset startOffset = Offset(0, 0);

  double canvasWidth = 0;
  double canvasHeight = 0;
  double screenWidth = 0;
  double screenHeight = 0;
  bool shouldPaint = false;
  bool accepted = false;
  int curentIndex = 0;
  double smallScreenWidthFactor = 0;
  double smallScreenHeightFactor = 0;
  GlobalKey dropKey = GlobalKey();
  double h = 0;
  double w = 0;
  bool checked = false;
  List<RightLine> rightLines = [];
  Size get _screenSize => Size(screenWidth, screenHeight);

  void resetQuiz() {
    savedLines.clear();
    lines.clear();
    rightLines.clear();
    checked = false;
    setState(() {});
  }

  void checkAnswers() {
    if (rightLines.isNotEmpty) {
      print("returninq");
      return;
    }
    setUpRightLines();

    print("Check answers ${rightLines.length}");

    savedLines.forEach((element) {
      element.color = Colors.red;
      element.strokeWidth = 4;
      print(element.toString());
    });
    int a = savedLines.indexWhere((element) =>
        element.line.startKey == questions[0].question.key &&
        element.line.endKey == questions[2].target.key);
    int b = savedLines.indexWhere((element) =>
        element.line.startKey == questions[1].question.key &&
        element.line.endKey == questions[1].target.key);
    int c = savedLines.indexWhere((element) =>
        element.line.startKey == questions[2].question.key &&
        element.line.endKey == questions[0].target.key);
    if (a > -1) {
      print("code is here a");
      QuizData.firstDragDropResult += 1;
      savedLines[a].color = Colors.green;
    }
    if (b > -1) {
      print("code is here");
      QuizData.firstDragDropResult += 1;

      savedLines[b].color = Colors.green;
    }
    if (c > -1) {
      print("code is here b");
      QuizData.firstDragDropResult += 1;

      savedLines[c].color = Colors.green;
    }
    checked = true;
    startOffset = Offset.zero;
    offset = Offset.zero;

    setState(() {});
  }

  void setUpRightLines() {
    if (rightLines.length == 2) {
      return;
    }
    //a
    shouldPaint = true;
    RightLine a = RightLine(
      startKey: questions[0].question.key,
      start: offsetForKey(questions[0].question.key),
      endKey: questions[2].target.key,
      end: offsetForKey(questions[2].target.key),
    );

    //a
    //b
    RightLine b = RightLine(
      startKey: questions[1].question.key,
      start: offsetForKey(questions[1].question.key),
      endKey: questions[1].target.key,
      end: offsetForKey(questions[1].target.key),
    );

    // //b
    // //c
    RightLine c = RightLine(
      startKey: questions[2].question.key,
      start: offsetForKey(questions[2].question.key),
      endKey: questions[0].target.key,
      end: offsetForKey(questions[0].target.key),
    );
    rightLines.add(a);
    rightLines.add(b);
    rightLines.add(c);
    checked = true;
    //c
  }

  @override
  void initState() {
    questions.add(
      QuizItem(
        question: Question(key: GlobalKey()),
        target: Target(
          key: GlobalKey(),
        ),
      ),
    );
    questions.add(
      QuizItem(
        question: Question(key: GlobalKey()),
        target: Target(
          key: GlobalKey(),
        ),
      ),
    );

    questions.add(
      QuizItem(
        question: Question(
          key: GlobalKey(),
        ),
        target: Target(
          key: GlobalKey(),
        ),
      ),
    );

    super.initState();
    Future.delayed(Duration(milliseconds: 1000)).then((v) {
      h = dropKey.currentContext!.size!.height;
      w = dropKey.currentContext!.size!.width;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    smallScreenWidthFactor =
        (screenWidth - w + (HW.getWidth(1200, context) - w)) / 2;
    smallScreenHeightFactor =
        (screenHeight - h + (HW.getHeight(788, context) - h)) / 2;
    circleButtonWidth = HW.getWidth(18, context);
    canvasHeight = screenHeight * 0.3;
    canvasWidth = screenHeight * 0.3;
    if (lines.length > 0) {
      lines[0].start = offsetForKey(lines[0].startKey);
      lines[0].end = offsetForKey(lines[0].endKey);
    }
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(HW.getHeight(24, context)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeText(
                  "What happened during the Golden Age of Athens?",
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: HW.getHeight(24, context),
                      ),
                  maxLines: 1,
                  textAlign: TextAlign.start,
                ),
                AutoSizeText(
                  "*drag nodes from one column to another, to match the anwsers",
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: HW.getHeight(12, context),
                      ),
                  maxLines: 1,
                ),
              ],
            ),
          ),
          Expanded(
            key: dropKey,
            child: AbsorbPointer(
              absorbing: checked,
              child: Stack(
                children: [
                  CustomPaint(
                    painter: MyPainter(
                      checked: checked,
                      smallScreenHeightFactor: smallScreenHeightFactor,
                      smallScreenWidthFactor: smallScreenWidthFactor,
                      accepted: accepted,
                      circleButtonWidth: circleButtonWidth,
                      lines: lines,
                      startOffset: startOffset,
                      endOffset: offset,
                      shouldPaint: shouldPaint,
                      quizItem: questions[curentIndex],
                      savedLines: savedLines,
                      rightLines: rightLines,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              _draggable(
                                questions[0].question,
                                0,
                                "Battke of Thermopylae",
                              ),
                              divider38(context),
                              _draggable(
                                questions[1].question,
                                1,
                                "Birth of Socrates",
                              ),
                              divider38(context),
                              _draggable(
                                questions[2].question,
                                2,
                                "The Plague arrives in Athens",
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: HW.getWidth(210, context),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              _target(
                                questions[0].target,
                                "Battke of Thermopylae",
                              ),
                              divider38(context),
                              _target(
                                questions[1].target,
                                "Birth of Socrates",
                              ),
                              divider38(context),
                              _target(
                                questions[2].target,
                                "The Plague arrives in Athens",
                              ),
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
        ],
      ),
    );
  }

  void onDragUpdate(DragUpdateDetails d) {
    offset = Offset(
      d.globalPosition.dx - smallScreenWidthFactor,
      d.globalPosition.dy - smallScreenHeightFactor,
    );

    setState(() {});
  }

  void onDragStart() {
    startOffset = _startOffset();
    offset = _startOffset();
    lines.clear();
    int indexInSaved = savedLines.indexWhere(
      (element) => element.line.startKey == questions[curentIndex].question.key,
    );
    if (indexInSaved > -1) {
      savedLines.removeAt(indexInSaved);
    }
    accepted = true;
    setState(() {});
    shouldPaint = true;
  }

  Offset _startOffset() {
    RenderBox box = questions[curentIndex]
        .question
        .key
        .currentContext!
        .findRenderObject() as RenderBox;
    Offset position = box.localToGlobal(
      Offset(
        smallScreenWidthFactor * -1,
        smallScreenHeightFactor * -1,
      ),
    ); //this is global position
    double y = position.dy + circleButtonWidth / 2;
    double x = position.dx + circleButtonWidth / 2;
    return Offset(x, y);
  }

  Offset offsetForKey(GlobalKey key) {
    RenderBox box = key.currentContext!.findRenderObject() as RenderBox;
    Offset position = box.localToGlobal(Offset.zero); //this is global position
    double y = position.dy + circleButtonWidth / 2;
    double x = position.dx + circleButtonWidth / 2;
    return Offset(x, y);
  }

  Widget _draggable(
    Question question,
    int index,
    String questionText,
  ) =>
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(),
            flex: 5,
          ),
          Expanded(
            flex: 60,
            child: Container(
              constraints: const BoxConstraints(
                minHeight: 15,
              ),
              alignment: Alignment.centerLeft,
              height: circleButtonWidth * 2,
              padding: EdgeInsets.only(left: HW.getWidth(24, context)),
              child: AutoSizeText(
                questionText,
                minFontSize: 10,
                maxLines: 1,
                textAlign: TextAlign.left,
              ),
            ),
          ),
          Expanded(
            child: Container(),
            flex: 15,
          ),
          Draggable(
            data: "data",
            onDragUpdate: onDragUpdate,
            onDragStarted: () {
              curentIndex = index;
              onDragStart();
            },
            onDragEnd: (_) {
              startOffset = Offset.zero;
              offset = Offset.zero;
              setState(() {});
            },
            onDraggableCanceled: (_, o) {},
            dragAnchorStrategy: (_, c, o) {
              return Offset(
                  0 + circleButtonWidth / 2, 0 + circleButtonWidth / 2);
            },
            feedback: CircleButton(
              color: Colors.white,
              width: circleButtonWidth,
            ),
            child: CircleButton(
              key: question.key,
              color: savedLines.indexWhere(
                        (element) => element.line.startKey == question.key,
                      ) ==
                      -1
                  ? Colors.white
                  : Colors.orange[800]!,
              width: circleButtonWidth,
            ),
          ),
        ],
      );

  Widget _target(Target target, String answerText) => Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          DragTarget(
            onMove: (_) {
              drawingLine = Line(
                startOffset,
                offset,
                Size(screenWidth, screenHeight),
                questions[curentIndex].question.key,
                target.key,
                false,
              );
              lines.add(drawingLine!);
              accepted = false;
              setState(() {});
            },
            onLeave: (_) {
              lines.removeWhere(
                (element) =>
                    element.startKey == questions[curentIndex].question.key,
              );

              accepted = true;
              setState(() {});
            },
            onAccept: (d) {
              savedLines.removeWhere(
                (element) => element.line.endKey == drawingLine!.endKey,
              );
              savedLines.add(
                LineToSave(
                  line: drawingLine!,
                  curveOffset: MyPainter.curveChangingOffset,
                ),
              );

              lines.clear();
              startOffset = Offset.zero;
              offset = Offset.zero;
              setState(() {});
            },
            builder: (
              c,
              obj,
              dyn,
            ) {
              return CircleButton(
                key: target.key,
                color: savedLines.indexWhere(
                          (element) => element.line.endKey == target.key,
                        ) ==
                        -1
                    ? Colors.white
                    : Colors.orange[800]!,
                width: circleButtonWidth,
              );
            },
          ),
          Expanded(
            child: Container(),
            flex: 3,
          ),
          Expanded(
            flex: 70,
            child: Container(
              constraints: const BoxConstraints(
                minHeight: 15,
              ),
              alignment: Alignment.centerLeft,
              height: circleButtonWidth * 2,
              padding: EdgeInsets.only(left: HW.getWidth(24, context)),
              child: AutoSizeText(
                answerText,
                minFontSize: 10,
                maxLines: 1,
                textAlign: TextAlign.left,
              ),
            ),
          ),
          Expanded(
            child: Container(),
            flex: 30,
          ),
        ],
      );

  Widget divider38(BuildContext context) => SizedBox(
        height: HW.getHeight(38, context),
      );
}

class SecondPainter extends CustomPainter {
  @override
  void paint(ui.Canvas canvas, ui.Size size) {
    // TODO: implement paint
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
