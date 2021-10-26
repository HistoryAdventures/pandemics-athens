import 'package:flutter/material.dart';
import 'package:history_of_adventures/src/core/colors.dart';
import 'package:history_of_adventures/src/features/quiz/data/quiz_model.dart';
import 'package:history_of_adventures/src/features/quiz/presentation/question_widgets/answer_model.dart';
import 'package:history_of_adventures/src/features/quiz/presentation/question_widgets/custom_widgets/ctatic_circle_widget.dart';
import 'package:history_of_adventures/src/features/quiz/presentation/question_widgets/custom_widgets/draggable_circles_widget.dart';

class CircleWidget extends StatefulWidget {
  bool? isDraging = true;
  final BuildContext context;
  final List<Answers<int>> answers;
  List<CorrectAnswers>? correctAnswers;
  final bool onWillAccept;
  final Offset mouseOffset;
  bool? targetIsImage = false;
  final DragTargetAccept<Answers<int>> onAccept;
  final DragTargetMove<Answers> onMove;
  Function(Offset)? getEndLineOffset;
  Function(Offset)? getStartLineOffset;
  Function()? onDragCompleted;
  Function()? onDragEnd;

  CircleWidget(
      {Key? key,
      required this.context,
      this.correctAnswers,
      this.targetIsImage,
      this.isDraging,
      required this.answers,
      required this.onWillAccept,
      required this.mouseOffset,
      required this.onAccept,
      this.getEndLineOffset,
      this.onDragCompleted,
      this.getStartLineOffset,
      this.onDragEnd,
      required this.onMove})
      : super(key: key);

  @override
  _CircleWidgetState createState() => _CircleWidgetState();
}

class _CircleWidgetState extends State<CircleWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: DragTarget<Answers<int>>(
        onMove: (data) {
          widget.onMove(data);
        },
        builder: (context, candidateData, rejectedData) => Stack(
          children: widget.answers
              .map((answer) => widget.isDraging!
                  ? DraggableCirclesWidget(
                      answer: answer,
                      offset: widget.mouseOffset,
                      getStartLineOffset: (mouseOffset) {
                        widget.getStartLineOffset!(mouseOffset);
                      },
                      getEndLineOffset: (mouseOffset) {
                        widget.getEndLineOffset!(mouseOffset);
                        print("object1121212");
                        setState(() {
                          answer.circleColor = AppColors.orange;
                        });
                      },
                      onDragCompleted: () {
                        widget.onDragCompleted!();
                      },
                      onDragEnd: (draggableDetails) {
                        widget.onDragEnd!();
                      },
                    )
                  : StaticCircle(
                      answer: answer,
                      offset: widget.mouseOffset,
                      getStartLineOffset: (mouseOffset) {
                        widget.getStartLineOffset!(mouseOffset);
                      },
                      getEndLineOffset: (mouseOffset) {
                        widget.getEndLineOffset!(mouseOffset);
                        print("object1121212");
                        setState(() {
                          answer.circleColor = AppColors.orange;
                        });
                      },
                      onDragCompleted: () {
                        widget.onDragCompleted!();
                      },
                      onDragEnd: (draggableDetails) {
                        widget.onDragEnd!();
                      },
                    ))
              .toList(),
        ),
        onWillAccept: (data) {
          return widget.onWillAccept;
        },
        onAccept: (data) {
          widget.onAccept(data);
        },
      ),
    );
  }
}
