import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:history_of_adventures/src/core/utils/assets_path.dart';
import 'package:history_of_adventures/src/core/utils/audioplayer_utils.dart';
import 'package:history_of_adventures/src/core/utils/styles.dart';
import 'package:history_of_adventures/src/features/quiz/data/map_quiz_model.dart';
import 'package:history_of_adventures/src/features/quiz/data/quiz_model.dart';
import 'package:history_of_adventures/src/features/quiz/presentation/question_widgets/drag_drop_widgets/circle_button.dart';
import 'package:history_of_adventures/src/features/quiz/presentation/question_widgets/drag_drop_widgets/drag_drop_models.dart';
import 'package:history_of_adventures/src/features/quiz/presentation/question_widgets/drag_drop_widgets/map_image_item.dart';
import 'package:history_of_adventures/src/features/quiz/presentation/question_widgets/drag_drop_widgets/painter.dart';

class QuizMapImage extends StatefulWidget {
  static final GlobalKey<_QuizMapImageState> quizMapImageKey =
      GlobalKey<_QuizMapImageState>();
  QuizMapImage({Key? key}) : super(key: quizMapImageKey);

  @override
  _QuizMapImageState createState() => _QuizMapImageState();
}

class _QuizMapImageState extends State<QuizMapImage> {
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

    print("Check answers ${rightLines.length}");

    savedLines.forEach((element) {
      element.color = Colors.red;
      element.strokeWidth = 4;
      print(element.toString());
    });
    int a = savedLines.indexWhere((element) =>
        element.line.startKey == questions[0].question.key &&
        element.line.endKey == questions[0].target.key);
    int b = savedLines.indexWhere((element) =>
        element.line.startKey == questions[1].question.key &&
        element.line.endKey == questions[3].target.key);
    int c = savedLines.indexWhere((element) =>
        element.line.startKey == questions[2].question.key &&
        element.line.endKey == questions[2].target.key);
    int d = savedLines.indexWhere((element) =>
        element.line.startKey == questions[3].question.key &&
        element.line.endKey == questions[1].target.key);
    // int e = savedLines.indexWhere((element) =>
    //     element.line.startKey == questions[4].question.key &&
    //     element.line.endKey == questions[3].target.key);
    if (a > -1) {
      print("code is here a");

      savedLines[a].color = Colors.green;
      QuizData.secondDragDropResult += 1;
    }
    if (b > -1) {
      print("code is here c is right");
      savedLines[b].color = Colors.green;
      QuizData.secondDragDropResult += 1;
    }
    if (c > -1) {
      print("code is here b");
      QuizData.secondDragDropResult += 1;

      savedLines[c].color = Colors.green;
    }
    if (d > -1) {
      print("code is here b");
      QuizData.secondDragDropResult += 1;

      savedLines[d].color = Colors.green;
    }
    // if (e > -1) {
    //   print("code is here b");
    //   QuizData.secondDragDropResult += 1;

    //   savedLines[e].color = Colors.green;
    // }
    checked = true;
    startOffset = Offset.zero;
    offset = Offset.zero;

    setState(() {});
  }

  void setUpRightLines() {
    if (rightLines.length == 4) {
      return;
    }
    //a
    shouldPaint = true;
    RightLine a = RightLine(
      startKey: questions[0].question.key,
      start: offsetForKey(questions[0].question.key),
      endKey: questions[0].target.key,
      end: offsetForKey(questions[0].target.key),
    );

    //a
    //b
    RightLine b = RightLine(
      startKey: questions[1].question.key,
      start: offsetForKey(questions[1].question.key),
      endKey: questions[3].target.key,
      end: offsetForKey(questions[3].target.key),
    );

    // //b
    // //c
    RightLine c = RightLine(
      startKey: questions[2].question.key,
      start: offsetForKey(questions[2].question.key),
      endKey: questions[2].target.key,
      end: offsetForKey(questions[2].target.key),
    );
    RightLine d = RightLine(
      startKey: questions[3].question.key,
      start: offsetForKey(questions[3].question.key),
      endKey: questions[1].target.key,
      end: offsetForKey(questions[1].target.key),
    );

    rightLines.add(a);
    rightLines.add(b);
    rightLines.add(c);
    rightLines.add(d);
    // rightLines.add(e);

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

    quizImages.addAll([
      const MapQuizItemModel(assets: AssetsPath.mapQuizImage1, title: "A"),
      const MapQuizItemModel(assets: AssetsPath.mapQuizImage2, title: "B"),
      const MapQuizItemModel(assets: AssetsPath.mapQuizImage3, title: "C"),
      const MapQuizItemModel(assets: AssetsPath.mapQuizImage4, title: "D"),
      // const MapQuizItemModel(assets: AssetsPath.mapQuizImage5, title: "E"),
    ]);
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
                  "What happened where? Match the Description to the Correct Map",
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: HW.getHeight(24, context),
                      ),
                  maxLines: 1,
                  textAlign: TextAlign.start,
                ),
                // AutoSizeText(
                //   "*drag nodes from one column to another, to match the anwsers",
                //   textAlign: TextAlign.start,
                //   style: Theme.of(context).textTheme.bodyText2!.copyWith(
                //         color: Colors.black,
                //         fontWeight: FontWeight.w400,
                //         fontSize: HW.getHeight(12, context),
                //       ),
                //   maxLines: 1,
                // ),
              ],
            ),
          ),
          // _imagesView,
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: HW.getWidth(500, context),
                          height: HW.getHeight(500, context),
                          child: ListView(
                            children: [
                              _draggable(
                                  questions[0].question,
                                  0,
                                  "490 BC Battle of Marathon",
                                  AssetsPath.map490),
                              _draggable(
                                questions[1].question,
                                1,
                                "399 BC City of Athens",
                                AssetsPath.map491,
                              ),
                              _draggable(
                                questions[2].question,
                                2,
                                "430 BC Port of Piraeus",
                                AssetsPath.map430,
                              ),
                              _draggable(
                                questions[3].question,
                                3,
                                "461 BC Battle of Oenoe’",
                                AssetsPath.map461,
                              ),
                              // SizedBox(
                              //   height: 400,
                              // ),
                              // SizedBox(
                              //   height: 400,
                              // ),

                              // _draggable(
                              //   questions[4].question,
                              //   4,
                              //   "End of Peloponnesian War",
                              // ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: HW.getWidth(50, context),
                        ),
                        Container(
                          width: HW.getWidth(600, context),
                          height: HW.getHeight(500, context),
                          child: ListView(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    top: HW.getHeight(30, context)),
                                child: _target(
                                  questions[0].target,
                                  "Combined Greek forces defeat the Persian invaders, led by Darius, at this location. Famous for the myth of Athenian runner, Pheidippides, who ran from the battleground to Athens to announce the Greek victory.",
                                ),
                              ),
                              _target(
                                questions[1].target,
                                "First Peloponnesian War begins here. Spartan forces are defeated by an alliance of two city states. Pericles emerges as leading political figure. ",
                              ),
                              _target(
                                questions[2].target,
                                "The malady spread quickly from here. In a matter of weeks, the disease had spread to the heart of the city and was affecting people of all ages and backgrounds in alarmingly high numbers.",
                              ),
                              _target(
                                questions[3].target,
                                "The trial and death of Socrates occurs here; the philosopher was convicted of corrupting the minds of the youth; rather than renounce his beliefs, he died willingly, discoursing on the immortality of the soul before drinking poisonous hemlock. ",
                              ),
                            ],
                          ),
                        ),
                      ],
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

  // Widget get _imagesView => Expanded(
  //       flex: 10,
  //       child: Container(
  //         height: double.maxFinite,
  //         padding: EdgeInsets.only(
  //           right: HW.getWidth(76, context),
  //           left: HW.getWidth(76, context),
  //         ),
  //         child: Row(
  //           children: quizImages
  //               .map((e) => Expanded(
  //                     child: Row(
  //                       children: [
  //                         Expanded(
  //                           flex: 2,
  //                           child: MapImageItem(
  //                             model: e,
  //                           ),
  //                         ),
  //                         Container(
  //                           width: 10,
  //                         )
  //                         // Expanded(
  //                         //   flex: 1,
  //                         //   child: Container(),
  //                         // ),
  //                       ],
  //                     ),
  //                   ))
  //               .toList(),
  //         ),
  //       ),
  //     );

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
    String image,
  ) =>
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Expanded(
              //   flex: 5,
              //   child: Container(),
              // ),
              Container(
                padding: EdgeInsets.only(left: HW.getHeight(24, context)),
                width: HW.getWidth(200, context),
                height: HW.getHeight(110, context),
                child: Image.asset(
                  image,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                height: HW.getHeight(120, context),
              )

              // Expanded(
              //   flex: 15,
              //   child: Container(),
              // ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                alignment: Alignment.center,
                height: HW.getHeight(50, context),
                width: HW.getWidth(200, context),
                //padding: EdgeInsets.only(left: HW.getWidth(24, context)),
                child: Text(
                  questionText,
                  style:
                      TextStyle(fontSize: TextFontSize.getHeight(16, context)),
                  maxLines: 1,
                  textAlign: TextAlign.center,
                ),
              ),
              Draggable(
                data: "data",
                onDragUpdate: onDragUpdate,
                onDragStarted: () {
                  AudioPlayerUtil().playSound(AssetsPath.quizQlick);
                  curentIndex = index;
                  onDragStart();
                },
                onDragEnd: (_) {
                  startOffset = Offset.zero;
                  offset = Offset.zero;
                  setState(() {});
                },
                onDraggableCanceled: (_, o) {
                  AudioPlayerUtil().playSound(AssetsPath.quizQlickErase);
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
          ),
        ],
      );

  Widget _target(Target target, String answerText) => Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
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
              AudioPlayerUtil().playSound(AssetsPath.quizQlickRelease);
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
            flex: 1,
          ),
          Container(
            alignment: Alignment.centerLeft,
            height: HW.getHeight(105, context),
            width: HW.getWidth(500, context),
            padding: EdgeInsets.only(left: HW.getWidth(10, context)),
            child: Text(
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
          Expanded(
            child: Container(),
            flex: 5,
          ),
        ],
      );

  Widget divider38(BuildContext context) => SizedBox(
        height: HW.getHeight(38, context),
      );
}
