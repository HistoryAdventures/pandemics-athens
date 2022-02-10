import 'dart:ui' as ui;

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:history_of_adventures/src/core/colors.dart';
import 'package:history_of_adventures/src/core/utils/styles.dart';
import 'package:history_of_adventures/src/features/quiz/data/quiz_model.dart';
import 'package:history_of_adventures/src/features/quiz/presentation/question_widgets/answer_model.dart';
import 'package:history_of_adventures/src/features/quiz/presentation/question_widgets/drag_drop_widgets/circle_button.dart';
import 'package:history_of_adventures/src/features/quiz/presentation/question_widgets/drag_drop_widgets/drag_drop_models.dart';
import 'package:history_of_adventures/src/features/quiz/presentation/question_widgets/drag_drop_widgets/painter.dart';

class QuizDragDropCirclesWidget extends StatefulWidget {
  final int questionIndex;
  final String question;
  final int score;

  final List<DrowLineWidget> userAnswer;
  final List<DrowLineWidget> userAnswerWithCheck;
  final List<DrowLineWidget> listCorrectrAnswers;

  final List<Answers<int>> answers;
  final List<Answers<int>> variants;
  final List<QuizItem> quizItemList;

  final List<String>? images;
  final double imageWidth;
  final double imageHeight;

  const QuizDragDropCirclesWidget({
    Key? key,
    required this.variants,
    required this.answers,
    required this.score,
    required this.userAnswer,
    required this.listCorrectrAnswers,
    required this.userAnswerWithCheck,
    required this.quizItemList,
    required this.question,
    required this.questionIndex,
    required this.imageHeight,
    required this.imageWidth,
    this.images,
  }) : super(key: key);

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

  String get _question => widget.question;
  late List<Answers<int>> _variants;
  late List<Answers<int>> _answers;
  List<QuizItem> get _quizItemList => widget.quizItemList;
  // List<String> get _images => widget.images!;

  @override
  void initState() {
    _answers = List.from(widget.answers);
    _variants = List.from(widget.variants);
    // print(_variants.length);
    // print(_answers.length);
    // print("---------");

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (!QuizData.showRightAnswers) {
      WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
        correctrAnswers();
      });
    }
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: DragDropQuizBody(
          question: _question,
          answers: _answers,
          variants: _variants,
          quizItemList: _quizItemList,
          imageWidth: widget.imageWidth,
          imageHeight: widget.imageHeight
          // images: _images
          ),
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
  final String question;
  final List<Answers<int>> answers;
  final List<Answers<int>> variants;
  bool? quizWithImage = false;
  final List<String>? images;
  final List<QuizItem> quizItemList;
  final double imageWidth;
  final double imageHeight;

  static final GlobalKey<__DragDropQuizBodyState> dragDropBodyKey =
      GlobalKey<__DragDropQuizBodyState>();
  DragDropQuizBody({
    Key? key,
    required this.question,
    required this.variants,
    required this.answers,
    required this.quizItemList,
    required this.imageWidth,
    required this.imageHeight,
    this.quizWithImage,
    this.images,
  }) : super(key: key);

  @override
  __DragDropQuizBodyState createState() => __DragDropQuizBodyState();
}

class __DragDropQuizBodyState extends State<DragDropQuizBody> {
  List<Line> lines = [];

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
  // GlobalKey dropKey1 = GlobalKey();
  // GlobalKey dropKey2 = GlobalKey();
  late GlobalKey dropKey = GlobalKey();
  double h = 0;
  double w = 0;
  bool checked = false;
  List<RightLine> rightLines = [];

  // Dragable and Target items Lists
  // List<Widget> dragalbeList = [];
  // List<Widget> targetList = [];

  List<QuizItem> get questions => widget.quizItemList;

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
        element.line.endKey == questions[questions.length - 1].target.key);
    int b = savedLines.indexWhere((element) =>
        element.line.startKey == questions[1].question.key &&
        element.line.endKey == questions[1].target.key);
    int c = savedLines.indexWhere((element) =>
        element.line.startKey == questions[questions.length - 1].question.key &&
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

  double initialWidth = 0;
  double initalHeight = 0;

  List<Widget> targetList = [];
  List<Widget> dragabletList = [];

  void setUpRightLines() {
    if (rightLines.length == questions.length) {
      return;
    }
    //a
    shouldPaint = true;

    questions.forEach((element) {
      var rightAnswerIndex = rightLines.add(
        RightLine(
            startKey: element.question.key,
            start: offsetForKey(element.question.key),
            endKey: element.target.key,
            end: offsetForKey(element.target.key)),
      );
    });

    checked = true;
    //c
  }

  // late List<Answers<int>> variants;
  //late List<Widget> targetListNew;

  @override
  void initState() {
    // for (var i = 0; i < widget.variants.length; i++) {
    //   questions.add(
    //     QuizItem(
    //     question: Question(key: GlobalKey()),
    //     target: Target(
    //       key: GlobalKey(),
    //     ),
    //   )

    //   );
    // }
    // dropKey = widget.answers.first.correctAnswers == CorrectAnswers.answer1
    //     ? dropKey1
    //     : dropKey2;

    super.initState();
    Future.delayed(Duration(milliseconds: 1000)).then((v) {
      h = dropKey.currentContext!.size!.height;
      w = dropKey.currentContext!.size!.width;
      initalHeight = h;
      initialWidth = w;

      // Creating dragable list for variants

      widget.answers.forEach((element) {
        dragabletList.add(
          _draggable(
              questionKey:
                  questions[widget.answers.indexOf(element)].question.key,
              isQuestionWithImage: widget.quizWithImage,
              index: widget.answers.indexOf(element),
              image: element.image,
              questionText: element.text),
        );
      });

      // variants = List.from(widget.variants);
      // targetListNew = List.from(targetList);

      widget.variants.forEach((element) {
        targetList.add(
          _target(
            targetKey: questions[widget.variants.indexOf(element)].target.key,
            answerText: element.text,
          ),
        );
      });

      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      h = dropKey.currentContext!.size!.height;
      w = dropKey.currentContext!.size!.width;
      if (initialWidth != w || initalHeight != h) {
        setState(() {});
      }
      initalHeight = h;
      initialWidth = w;
    });

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
    return Expanded(
      child: Container(
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
                    widget.question,
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
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              widget.quizWithImage == true
                                  ? Column(
                                      children: [
                                        ...widget.images!
                                            .map((e) => Image.asset(
                                                  e,
                                                  width: 150,
                                                  height: 100,
                                                ))
                                      ],
                                    )
                                  : Container(),
                              Expanded(
                                child: Column(
                                  children: [...dragabletList],
                                ),
                              ),
                              // SizedBox(
                              //   width: HW.getWidth(100, context),
                              // ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ...targetList,
                                    //  Spacer(flex: 2,)
                                    SizedBox(
                                      height: HW.getHeight(100, context),
                                    )
                                  ],
                                ),
                              ),
                            ])),
                  ],
                ),
              ),
            ),
          ],
        ),
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
          {GlobalKey? questionKey,
          int? index,
          String? questionText,
          String? image,
          bool? isQuestionWithImage = false}) =>
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // Expanded(
          //   child: Container(),
          //   flex: 5,
          // ),
          Container(
              constraints: BoxConstraints(
                minHeight: HW.getHeight(50, context),
              ),
              width: HW.getWidth(widget.imageWidth, context),
              height: HW.getHeight(widget.imageHeight, context),
              alignment: Alignment.centerLeft,
              //height: circleButtonWidth * 2,
              padding: EdgeInsets.only(
                left: HW.getWidth(24, context),
              ),
              child:
                  // isQuestionWithImage == true
                  //     ?
                  Image.asset(
                image!,
                // width: HW.getWidth(90, context),
                //height: HW.getHeight(105, context),
                fit: BoxFit.cover,
              )
              // : AutoSizeText(
              //     questionText!,
              //     minFontSize: 5,
              //     maxLines: 5,
              //     textAlign: TextAlign.left,
              //   ),
              ),
          SizedBox(
            width: HW.getWidth(10, context),
          ),
          Container(
            width: widget.imageWidth < HW.getWidth(120, context)
                ? HW.getWidth(25, context)
                : HW.getWidth(200, context),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                questionText != null
                    ? Padding(
                        padding: EdgeInsets.only(bottom: 8.0),
                        child: Text(questionText),
                      )
                    : Container(),
                Draggable(
                  data: "data",
                  onDragUpdate: onDragUpdate,
                  onDragStarted: () {
                    curentIndex = index!;
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
                    key: questionKey,
                    color: savedLines.indexWhere(
                              (element) => element.line.startKey == questionKey,
                            ) ==
                            -1
                        ? Colors.white
                        : Colors.orange[800]!,
                    width: circleButtonWidth,
                  ),
                ),
              ],
            ),
          ),
        ],
      );

  Widget _target({
    GlobalKey? targetKey,
    String? answerText,
  }) =>
      Container(
        constraints: BoxConstraints(
          minHeight: HW.getHeight(50, context),
        ),
        width: HW.getWidth(600, context),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            DragTarget(
              onMove: (_) {
                drawingLine = Line(
                  startOffset,
                  offset,
                  Size(screenWidth, screenHeight),
                  questions[curentIndex].question.key,
                  targetKey!,
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
                  key: targetKey,
                  color: savedLines.indexWhere(
                            (element) => element.line.endKey == targetKey,
                          ) ==
                          -1
                      ? Colors.white
                      : Colors.orange[800]!,
                  width: circleButtonWidth,
                );
              },
            ),
            // Expanded(
            //   child: Container(),
            //   flex: 1,
            // ),
            Container(
              constraints: BoxConstraints(
                minHeight: widget.imageHeight > HW.getHeight(120, context)
                    ? HW.getHeight(100, context)
                    : HW.getHeight(60, context),
              ),
              width: HW.getWidth(550, context),
              alignment: Alignment.centerLeft,
              height: circleButtonWidth * 2,
              padding: EdgeInsets.only(
                  left: HW.getWidth(10, context),
                  right: HW.getWidth(10, context)),
              child:
                  // isquestionwithimage == true
                  //     ? Image.asset(image!)
                  //     :

                  AutoSizeText(
                answerText!,
                minFontSize: 10,
                maxLines: 4,
                maxFontSize: 16,
                textAlign: TextAlign.left,
              ),
            ),
          ],
        ),
      );
}
