import 'package:flutter/material.dart';
import 'package:history_of_adventures/src/core/colors.dart';
import 'package:history_of_adventures/src/features/quiz/presentation/question_widgets/answer_model.dart';

class StaticCircle extends StatefulWidget {
  final Answers answer;
  final Offset offset;
  final Function(Offset) getStartLineOffset;
  final Function(Offset) getEndLineOffset;
  final Function() onDragCompleted;
  final Function(DraggableDetails) onDragEnd;

  StaticCircle(
      {required this.answer,
      required this.offset,
      required this.onDragEnd,
      required this.onDragCompleted,
      required this.getStartLineOffset,
      required this.getEndLineOffset});

  @override
  _StaticCircleState createState() => _StaticCircleState();
}

class _StaticCircleState extends State<StaticCircle> {
  @override
  Widget build(BuildContext context) => Container(
        height: 20,
        width: 20,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: AppColors.grey, width: 1.5),
          color: widget.answer.circleColor,
        ),
      );
}
