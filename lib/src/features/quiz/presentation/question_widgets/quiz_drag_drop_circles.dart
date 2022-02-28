import 'dart:ui' as ui;

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:history_of_adventures/src/core/colors.dart';
import 'package:history_of_adventures/src/core/utils/assets_path.dart';
import 'package:history_of_adventures/src/core/utils/audioplayer_utils.dart';

import 'package:history_of_adventures/src/core/utils/styles.dart';
import 'package:history_of_adventures/src/features/quiz/data/quiz_model.dart';
import 'package:history_of_adventures/src/features/quiz/presentation/question_widgets/answer_model.dart';
import 'package:history_of_adventures/src/features/quiz/presentation/question_widgets/drag_drop_widgets/circle_button.dart';
import 'package:history_of_adventures/src/features/quiz/presentation/question_widgets/drag_drop_widgets/drag_drop_models.dart';
import 'package:history_of_adventures/src/features/quiz/presentation/question_widgets/drag_drop_widgets/painter.dart';

class QuizDragDropCirclesWidget extends StatefulWidget {
  final int questionIndex;

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
      required this.questionIndex})
      : super(key: key);

  @override
  _QuizDragDropCirclesWidgetState createState() =>
      _QuizDragDropCirclesWidgetState();
}

class _QuizDragDropCirclesWidgetState extends State<QuizDragDropCirclesWidget> {
  late List<Answers<int>> answers;
  late List<Answers<int>> variants;

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

  @override
  void initState() {
    super.initState();
  }

  @override
  void didUpdateWidget(covariant QuizDragDropCirclesWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
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
      child: DragDropQuizBody(
        answers: widget.answers,
        variants: widget.variants,
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
  final List<Answers<int>> answers;
  final List<Answers<int>> variants;

  static GlobalKey<__DragDropQuizBodyState> dragDropBodyKey =
      GlobalKey<__DragDropQuizBodyState>();

  DragDropQuizBody({
    Key? key,
    required this.answers,
    required this.variants,
  }) : super(key: dragDropBodyKey);

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
    // if (rightLines.isNotEmpty) {
    //   return;
    // }
    setUpRightLines();

    savedLines.forEach((element) async {
      element.color = Colors.red;
      element.strokeWidth = 4;
    });
    int a = savedLines.indexWhere((element) =>
        element.line.startKey == questions[0].question.key &&
        element.line.endKey == questions[2].target.key);
    int b = savedLines.indexWhere((element) =>
        element.line.startKey == questions[1].question.key &&
        element.line.endKey == questions[4].target.key);
    int c = savedLines.indexWhere((element) =>
        element.line.startKey == questions[2].question.key &&
        element.line.endKey == questions[3].target.key);
    int d = savedLines.indexWhere((element) =>
        element.line.startKey == questions[3].question.key &&
        element.line.endKey == questions[1].target.key);
    int e = savedLines.indexWhere((element) =>
        element.line.startKey == questions[4].question.key &&
        element.line.endKey == questions[0].target.key);

    if (a > -1) {
      QuizData.firstDragDropResult += 1;
      savedLines[a].color = Colors.green;
    }
    if (b > -1) {
      QuizData.firstDragDropResult += 1;
      savedLines[b].color = Colors.green;
    }
    if (c > -1) {
      QuizData.firstDragDropResult += 1;
      savedLines[c].color = Colors.green;
    }
    if (d > -1) {
      QuizData.firstDragDropResult += 1;
      savedLines[d].color = Colors.green;
    }
    if (e > -1) {
      QuizData.firstDragDropResult += 1;
      savedLines[e].color = Colors.green;
    }

    checked = true;
    startOffset = Offset.zero;
    offset = Offset.zero;

    setState(() {});
  }

  double initialWidth = 0;
  double initalHeight = 0;

  void setUpRightLines() {
    // if (rightLines.length == 2) {
    //   return;
    // }

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
      endKey: questions[4].target.key,
      end: offsetForKey(questions[4].target.key),
    );

    // //b
    // //c
    RightLine c = RightLine(
      startKey: questions[2].question.key,
      start: offsetForKey(questions[2].question.key),
      endKey: questions[3].target.key,
      end: offsetForKey(questions[3].target.key),
    );

    RightLine d = RightLine(
      startKey: questions[3].question.key,
      start: offsetForKey(questions[3].question.key),
      endKey: questions[1].target.key,
      end: offsetForKey(questions[1].target.key),
    );

    // //b
    // //c
    RightLine e = RightLine(
      startKey: questions[4].question.key,
      start: offsetForKey(questions[4].question.key),
      endKey: questions[0].target.key,
      end: offsetForKey(questions[0].target.key),
    );
    rightLines.add(a);
    rightLines.add(b);
    rightLines.add(c);
    rightLines.add(d);
    rightLines.add(e);
    checked = true;
    //c
  }

  @override
  void initState() {
    print("init state");
    Future.delayed(Duration(milliseconds: 1000)).then((v) {
      h = dropKey.currentContext!.size!.height;
      w = dropKey.currentContext!.size!.width;
      initalHeight = h;
      initialWidth = w;
      setState(() {});
    });
    for (var i = 0; i < widget.answers.length; i++) {
      // final key = GlobalKey();
      questions.add(
        QuizItem(
          question: Question(key: GlobalKey()),
          target: Target(
            key: GlobalKey(),
          ),
        ),
      );
    }
    // questions.add(
    //   QuizItem(
    //     question: Question(key: GlobalKey()),
    //     target: Target(
    //       key: GlobalKey(),
    //     ),
    //   ),
    // );
    // questions.add(
    //   QuizItem(
    //     question: Question(key: GlobalKey()),
    //     target: Target(
    //       key: GlobalKey(),
    //     ),
    //   ),
    // );

    // questions.add(
    //   QuizItem(
    //     question: Question(
    //       key: GlobalKey(),
    //     ),
    //     target: Target(
    //       key: GlobalKey(),
    //     ),
    //   ),
    // );

    super.initState();
  }

  @override
  void dispose() {
    questions = [];
    super.dispose();
  }

  @override
  Future<void> didChangeDependencies() async {
    h = await dropKey.currentContext!.size!.height;
    w = await dropKey.currentContext!.size!.width;
    initalHeight = h;
    initialWidth = w;
    setState(() {});

    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant DragDropQuizBody oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(milliseconds: 1000)).then((v) {
      h = dropKey.currentContext!.size!.height;
      w = dropKey.currentContext!.size!.width;
      if (initialWidth != w || initalHeight != h) {
        setState(() {});
      }
      initalHeight = h;
      initialWidth = w;
      setState(() {});
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
                // AutoSizeText(
                //   "Match the Glossary Term to the Definition",
                //   style: Theme.of(context).textTheme.bodyText2!.copyWith(
                //         color: Colors.black,
                //         fontWeight: FontWeight.w400,
                //         fontSize: HW.getHeight(24, con     //       ),
                //   maxLines: 1,
                //   textAlign: TextAlign.start,
                // ),
                RichText(
                  text: TextSpan(children: <TextSpan>[
                    TextSpan(
                      text: "Match the",
                      style: Theme.of(context).textTheme.subtitle1?.copyWith(
                          fontSize: TextFontSize.getHeight(24, context)),
                    ),
                    TextSpan(
                        text: " Glossary Term ",
                        style: Theme.of(context).textTheme.subtitle1?.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: TextFontSize.getHeight(24, context))),
                    TextSpan(
                      text: "to the Definition",
                      style: Theme.of(context).textTheme.subtitle1?.copyWith(
                          fontSize: TextFontSize.getHeight(24, context)),
                    ),
                  ]),
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
            // width: HW.getWidth(1000, context),
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
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              _draggable(
                                question: questions[0].question,
                                index: 0,
                                image: AssetsPath.democracy,
                              ),
                              _draggable(
                                question: questions[1].question,
                                index: 1,
                                image: AssetsPath.humours,
                              ),
                              _draggable(
                                question: questions[2].question,
                                index: 2,
                                image: AssetsPath.ostracism,
                              ),
                              _draggable(
                                question: questions[3].question,
                                index: 3,
                                image: AssetsPath.philosophy,
                              ),
                              _draggable(
                                question: questions[4].question,
                                index: 4,
                                image: AssetsPath.typhus,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: HW.getWidth(10, context),
                        ),
                        Container(
                          width: HW.getWidth(600, context),
                          height: HW.getHeight(500, context),
                          child: ListView(
                            children: [
                              _target(
                                questions[0].target,
                                "A infectious disease often carried by fleas, lice, or mites, which are themselves carried by small animals… and people. ",
                              ),
                              _target(
                                questions[1].target,
                                "Meaning literally “the love of wisdom,” the pursuit of answers to big questions, such as what it mean to lead a good life. ",
                              ),
                              _target(
                                questions[2].target,
                                "A type of politics invented in Athens in the 5th Century. It allowed citizens to decide how their city would be governed. ",
                              ),
                              _target(
                                questions[3].target,
                                "A democratic vote that could expel a citizen from Athens for up to ten years. Though designed to prevent a citizen from becoming a tyrant, was often abused in factional politics.",
                              ),
                              _target(
                                questions[4].target,
                                "Thought to determine a person’s health and temperment; an imbalance could lead a person to become ill. ",
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

  Widget _draggable({
    Question? question,
    int? index,
    String? questionText,
    String? image,
  }) =>
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Expanded(
          //   child: Container(),
          //   flex: 5,
          // ),
          if (questionText == null)
            Container(
                constraints: BoxConstraints(
                  minHeight: HW.getHeight(50, context),
                ),
                width: HW.getWidth(105, context),
                height: HW.getHeight(105, context),
                alignment: Alignment.centerLeft,
                //height: circleButtonWidth * 2,
                padding: EdgeInsets.only(
                    left: HW.getWidth(24, context),
                    bottom: HW.getHeight(10, context)),
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
                )
          else
            Container(
              constraints: const BoxConstraints(
                minHeight: 50,
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

          Container(
            width: HW.getWidth(25, context),
            padding: EdgeInsets.only(bottom: HW.getHeight(10, context)),
            child: Draggable(
              data: "data",
              onDragUpdate: onDragUpdate,
              onDragStarted: () {
                AudioPlayerUtil().playQuizSound(AssetsPath.quizQlick);
                curentIndex = index!;
                onDragStart();
              },
              onDragEnd: (_) {
                startOffset = Offset.zero;
                offset = Offset.zero;
                setState(() {});
              },
              onDraggableCanceled: (_, o) {
                AudioPlayerUtil().playQuizSound(AssetsPath.quizQlickErase);
              },
              dragAnchorStrategy: (_, c, o) {
                return Offset(
                    0 + circleButtonWidth / 2, 0 + circleButtonWidth / 2);
              },
              feedback: CircleButton(
                color: Colors.white,
                width: circleButtonWidth,
              ),
              child: CircleButton(
                key: question!.key,
                color: savedLines.indexWhere(
                          (element) => element.line.startKey == question.key,
                        ) ==
                        -1
                    ? Colors.white
                    : Colors.orange[800]!,
                width: circleButtonWidth,
              ),
            ),
          ),
        ],
      );

  Widget _target(Target target, String answerText) => Container(
        constraints: BoxConstraints(
          minHeight: HW.getHeight(50, context),
        ),
        width: HW.getWidth(700, context),
        child: Row(
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
                AudioPlayerUtil().playQuizSound(AssetsPath.quizQlickRelease);
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
            // Expanded(
            //   child: Container(),
            //   flex: 3,
            // ),
            Container(
              constraints:
                  BoxConstraints(minHeight: HW.getHeight(100, context)),
              width: HW.getWidth(500, context),
              alignment: Alignment.centerLeft,
              height: circleButtonWidth * 2,
              padding: EdgeInsets.only(
                  left: HW.getWidth(10, context),
                  right: HW.getWidth(10, context)),
              child:
                  // isquestionwithimage == true
                  //     ? Image.asset(image!)
                  //     :

                  Text(
                answerText,
                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                      color: Colors.black,
                      fontSize: HW.getHeight(18, context),
                    ),
                // minFontSize: 10,
                maxLines: 4,
                // maxFontSize: 16,
                textAlign: TextAlign.left,
              ),
            ),

            // Expanded(
            //   child: Container(),
            //   flex: 30,
            // ),
          ],
        ),
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
