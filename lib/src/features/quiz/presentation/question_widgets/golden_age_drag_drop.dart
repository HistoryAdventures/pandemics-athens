import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:history_of_adventures/src/core/utils/assets_path.dart';
import 'package:history_of_adventures/src/core/utils/styles.dart';
import 'package:history_of_adventures/src/features/quiz/data/map_quiz_model.dart';
import 'package:history_of_adventures/src/features/quiz/data/quiz_model.dart';
import 'package:history_of_adventures/src/features/quiz/presentation/question_widgets/drag_drop_widgets/circle_button.dart';
import 'package:history_of_adventures/src/features/quiz/presentation/question_widgets/drag_drop_widgets/drag_drop_models.dart';
import 'package:history_of_adventures/src/features/quiz/presentation/question_widgets/drag_drop_widgets/map_image_item.dart';
import 'package:history_of_adventures/src/features/quiz/presentation/question_widgets/drag_drop_widgets/painter.dart';

class GoldenAgeDragDrop extends StatefulWidget {
  static final GlobalKey<_GoldenAgeDragDropState> quizMapImageKey =
      GlobalKey<_GoldenAgeDragDropState>();
  GoldenAgeDragDrop({Key? key}) : super(key: quizMapImageKey);

  @override
  _GoldenAgeDragDropState createState() => _GoldenAgeDragDropState();
}

class _GoldenAgeDragDropState extends State<GoldenAgeDragDrop> {
  List<Line> lines = [];
  List<QuizItem> questions = [];
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
  List<MapQuizItemModel> quizImages = [];
  Size get _screenSize => Size(screenWidth, screenHeight);

  void resetQuiz() {
    savedLines.clear();
    lines.clear();
    rightLines.clear();
    checked = false;
    setState(() {});
  }

  double initialWidth = 0;
  double initalHeight = 0;

  void checkAnswers() {
    if (rightLines.isNotEmpty) {
      print("returninq");
      return;
    }
    setUpRightLines();

    savedLines.forEach((element) {
      element.color = Colors.red;
      element.strokeWidth = 4;
      print(element.toString());
    });
    int a = savedLines.indexWhere((element) =>
        element.line.startKey == questions[0].question.key &&
        element.line.endKey == questions[4].target.key);
    int b = savedLines.indexWhere((element) =>
        element.line.startKey == questions[1].question.key &&
        element.line.endKey == questions[2].target.key);
    int c = savedLines.indexWhere((element) =>
        element.line.startKey == questions[2].question.key &&
        element.line.endKey == questions[3].target.key);
    int d = savedLines.indexWhere((element) =>
        element.line.startKey == questions[3].question.key &&
        element.line.endKey == questions[7].target.key);
    int e = savedLines.indexWhere((element) =>
        element.line.startKey == questions[4].question.key &&
        element.line.endKey == questions[1].target.key);
    int f = savedLines.indexWhere((element) =>
        element.line.startKey == questions[5].question.key &&
        element.line.endKey == questions[5].target.key);
    int g = savedLines.indexWhere((element) =>
        element.line.startKey == questions[6].question.key &&
        element.line.endKey == questions[6].target.key);
    int h = savedLines.indexWhere((element) =>
        element.line.startKey == questions[7].question.key &&
        element.line.endKey == questions[0].target.key);
    if (a > -1) {
      print("code is here a");

      savedLines[a].color = Colors.green;
      QuizData.thirdDragResult += 1;
    }
    if (b > -1) {
      print("code is here c is right");
      savedLines[b].color = Colors.green;
      QuizData.thirdDragResult += 1;
    }
    if (c > -1) {
      print("code is here b");
      QuizData.thirdDragResult += 1;

      savedLines[c].color = Colors.green;
    }
    if (d > -1) {
      print("code is here b");
      QuizData.thirdDragResult += 1;

      savedLines[d].color = Colors.green;
    }
    if (e > -1) {
      print("code is here b");
      QuizData.thirdDragResult += 1;

      savedLines[e].color = Colors.green;
    }
    if (f > -1) {
      print("code is here b");
      QuizData.thirdDragResult += 1;

      savedLines[f].color = Colors.green;
    }
    if (g > -1) {
      print("code is here b");
      QuizData.thirdDragResult += 1;

      savedLines[g].color = Colors.green;
    }
    if (h > -1) {
      print("code is here b");
      QuizData.thirdDragResult += 1;

      savedLines[h].color = Colors.green;
    }
    checked = true;
    startOffset = Offset.zero;
    offset = Offset.zero;

    setState(() {});
  }

  void setUpRightLines() {
    if (rightLines.length == 7) {
      return;
    }
    //a
    shouldPaint = true;
    RightLine a = RightLine(
      startKey: questions[0].question.key,
      start: offsetForKey(questions[0].question.key),
      endKey: questions[4].target.key,
      end: offsetForKey(questions[4].target.key),
    );

    //a
    //b
    RightLine b = RightLine(
      startKey: questions[1].question.key,
      start: offsetForKey(questions[1].question.key),
      endKey: questions[2].target.key,
      end: offsetForKey(questions[2].target.key),
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
      endKey: questions[7].target.key,
      end: offsetForKey(questions[7].target.key),
    );
    RightLine e = RightLine(
      startKey: questions[4].question.key,
      start: offsetForKey(questions[4].question.key),
      endKey: questions[1].target.key,
      end: offsetForKey(questions[1].target.key),
    );
    /////////////////
    RightLine f = RightLine(
      startKey: questions[5].question.key,
      start: offsetForKey(questions[5].question.key),
      endKey: questions[5].target.key,
      end: offsetForKey(questions[5].target.key),
    );
    RightLine g = RightLine(
      startKey: questions[6].question.key,
      start: offsetForKey(questions[6].question.key),
      endKey: questions[6].target.key,
      end: offsetForKey(questions[6].target.key),
    );
    RightLine h = RightLine(
      startKey: questions[7].question.key,
      start: offsetForKey(questions[7].question.key),
      endKey: questions[0].target.key,
      end: offsetForKey(questions[0].target.key),
    );
    rightLines.add(a);
    rightLines.add(b);
    rightLines.add(c);
    rightLines.add(d);
    rightLines.add(e);
    rightLines.add(f);
    rightLines.add(g);
    rightLines.add(h);

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

    Future.delayed(Duration(milliseconds: 1000)).then((v) {
      h = dropKey.currentContext!.size!.height;
      w = dropKey.currentContext!.size!.width;
      initalHeight = h;
      initialWidth = w;
      setState(() {});
    });

    super.initState();
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
    if (lines.isNotEmpty) {
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
                  "The 5th century BC was the 'Golden Age' of Athens, when culture flourished in the ancient polis and the city was dominant in the Greek world. Match the individual to their achievement below.",
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
          SizedBox(
            height: HW.getHeight(20, context),
          ),
          Expanded(
            flex: 30,
            key: dropKey,
            child: AbsorbPointer(
              absorbing: checked,
              child: CustomPaint(
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
                child: Column(
                  children: [
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                _draggable(
                                  questions[0].question,
                                  0,
                                  "Themistocles",
                                ),
                                _draggable(
                                  questions[1].question,
                                  1,
                                  "Thucydides",
                                ),
                                _draggable(
                                  questions[2].question,
                                  2,
                                  "Aeschylus",
                                ),
                                _draggable(
                                  questions[3].question,
                                  3,
                                  "Iktinos,Kallikrates and Phidas",
                                ),
                                _draggable(
                                  questions[4].question,
                                  4,
                                  "Sophocles",
                                ),
                                _draggable(
                                  questions[5].question,
                                  5,
                                  "Euripides",
                                ),
                                _draggable(
                                  questions[6].question,
                                  6,
                                  "Plato",
                                ),
                                _draggable(
                                  questions[7].question,
                                  7,
                                  "Herodotus",
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
                                  "Histories",
                                ),
                                _target(
                                  questions[1].target,
                                  "Antigone",
                                ),
                                _target(
                                  questions[2].target,
                                  "History of the Peloponnesian War",
                                ),
                                _target(
                                  questions[3].target,
                                  "The orestia(the Agammemnon Libation Bearers,and Eumenides)",
                                ),
                                _target(
                                  questions[4].target,
                                  "Victory at the Battle of Salamis",
                                ),
                                _target(
                                  questions[5].target,
                                  "Medea",
                                ),
                                _target(
                                  questions[6].target,
                                  "The Allegory of the Cave",
                                ),
                                _target(
                                  questions[7].target,
                                  "The Parthenon",
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Expanded(child: Container()),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget get _imagesView => Expanded(
        flex: 10,
        child: Container(
          height: double.maxFinite,
          padding: EdgeInsets.only(
            right: HW.getWidth(76, context),
            left: HW.getWidth(76, context),
          ),
          child: Row(
            children: quizImages
                .map((e) => Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: MapImageItem(
                              model: e,
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(),
                          ),
                        ],
                      ),
                    ))
                .toList(),
          ),
        ),
      );

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
            flex: 5,
            child: Container(),
          ),
          Expanded(
            flex: 60,
            child: Container(
              alignment: Alignment.centerLeft,
              height: HW.getHeight(40, context),
              padding: EdgeInsets.only(left: HW.getWidth(24, context)),
              child: AutoSizeText(
                questionText,
                maxLines: 1,
                textAlign: TextAlign.left,
              ),
            ),
          ),
          Expanded(
            flex: 15,
            child: Container(),
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
              alignment: Alignment.centerLeft,
              height: HW.getHeight(40, context),
              padding: EdgeInsets.only(left: HW.getWidth(24, context)),
              child: AutoSizeText(
                answerText,
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
