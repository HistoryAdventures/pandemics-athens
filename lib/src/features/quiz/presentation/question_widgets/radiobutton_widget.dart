import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:history_of_adventures/src/core/colors.dart';
import 'package:history_of_adventures/src/core/utils/assets_path.dart';
import 'package:history_of_adventures/src/core/utils/audioplayer_utils.dart';
import 'package:history_of_adventures/src/core/utils/styles.dart';
import 'package:history_of_adventures/src/features/quiz/data/quiz_model.dart';
import 'package:history_of_adventures/src/features/quiz/presentation/question_widgets/answer_model.dart';

import 'drag_drop_widgets/circle_button.dart';
import 'drag_drop_widgets/drag_drop_models.dart';
import 'drag_drop_widgets/painter.dart';

class RadioButtonModel extends StatefulWidget {
  final String question;
  final List<Answers<int>> answers;
  final int questionIndex;
  static final GlobalKey<_RadioButtonModelState> radioButtonKey =
      GlobalKey<_RadioButtonModelState>();

  RadioButtonModel(
      {Key? key,
      required this.question,
      required this.answers,
      required this.questionIndex})
      : super(key: radioButtonKey);

  @override
  _RadioButtonModelState createState() => _RadioButtonModelState();
}

class _RadioButtonModelState extends State<RadioButtonModel> {
  @override
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
  // List<MapQuizItemModel> quizImages = [];
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
    savedLines.forEach((element) {
      element.color = Colors.green;
      element.strokeWidth = 4;
    });

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

    // //a
    // //b
    RightLine b = RightLine(
      startKey: questions[0].question.key,
      start: offsetForKey(questions[0].question.key),
      endKey: questions[1].target.key,
      end: offsetForKey(questions[1].target.key),
    );

    // // //b
    // // //c
    // RightLine c = RightLine(
    //   startKey: questions[2].question.key,
    //   start: offsetForKey(questions[2].question.key),
    //   endKey: questions[0].target.key,
    //   end: offsetForKey(questions[0].target.key),
    // );
    // RightLine d = RightLine(
    //   startKey: questions[3].question.key,
    //   start: offsetForKey(questions[3].question.key),
    //   endKey: questions[1].target.key,
    //   end: offsetForKey(questions[1].target.key),
    // );

    rightLines.add(a);
    // rightLines.add(b);
    // rightLines.add(c);
    // rightLines.add(d);
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
    Future.delayed(Duration(milliseconds: 1000)).then((v) {
      h = dropKey.currentContext!.size!.height;
      w = dropKey.currentContext!.size!.width;
      initalHeight = h;
      initialWidth = w;
      setState(() {});
    });

    super.initState();
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
    String image,
    Question question,
    int index,
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
              Image.asset(
                image,
                fit: BoxFit.cover,
              ),
              SizedBox(
                width: HW.getWidth(20, context),
              ),
              Draggable(
                data: "data",
                onDragUpdate: onDragUpdate,
                onDragStarted: () {
                  AudioPlayerUtil().playQuizSound(AssetsPath.quizQlick);
                  curentIndex = index;
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

              // Expanded(
              //   flex: 15,
              //   child: Container(),
              // ),
            ],
          ),
        ],
      );

  Widget _target(Target target, String image, int index) => Row(
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
          //   flex: 1,
          // ),
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                padding: EdgeInsets.only(left: HW.getHeight(24, context)),
                width: HW.getWidth(300, context),
                height: HW.getHeight(250, context),
                child: Image.asset(
                  image,
                  fit: BoxFit.contain,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 20.0),
                child: Image.asset(
                  index == 0
                      ? AssetsPath.nikosKeepGoing
                      : AssetsPath.nikosQuitMedicine,
                  width: HW.getWidth(index == 0 ? 150 : 160, context),
                  height: HW.getHeight(index == 0 ? 20 : 23, context),
                  fit: BoxFit.fill,
                ),
              )
            ],
          ),
          // Expanded(
          //   child: Container(),
          //   flex: 5,
          // ),
        ],
      );

  Widget divider38(BuildContext context) => SizedBox(
        height: HW.getHeight(38, context),
      );

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

    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(HW.getWidth(24, context),
                  HW.getHeight(24, context), 0, HW.getHeight(36, context)),
              child: Text(
                widget.question,
                style: Theme.of(context)
                    .textTheme
                    .subtitle1
                    ?.copyWith(fontSize: TextFontSize.getHeight(24, context)),
              ),
            ),
            Expanded(
              key: dropKey,
              child: Padding(
                padding: EdgeInsets.only(bottom: HW.getHeight(70.0, context)),
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: HW.getWidth(600, context),
                          height: HW.getHeight(450, context),
                          child: _draggable(widget.answers.first.image!,
                              questions[0].question, 0),
                        ),
                        SizedBox(
                          width: HW.getWidth(50, context),
                        ),
                        Container(
                          width: HW.getWidth(400, context),
                          height: HW.getHeight(500, context),
                          child: Column(
                            children: [
                              _target(questions[0].target,
                                  widget.answers[1].image!, 0),
                              _target(questions[1].target,
                                  widget.answers[2].image!, 1),
                              // SizedBox(height: HW.getHeight(100, context),)
                            ],
                          ),
                        ),
                      ],
                    ),
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
