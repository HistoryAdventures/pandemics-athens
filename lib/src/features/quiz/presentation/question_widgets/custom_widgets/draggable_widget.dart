import 'package:flutter/material.dart';
import 'package:history_of_adventures/src/core/colors.dart';
import 'package:history_of_adventures/src/features/quiz/presentation/question_widgets/answer_model.dart';
import 'package:history_of_adventures/src/features/quiz/presentation/widgets_demo/answer.dart';

class DraggableWidget extends StatelessWidget {
  final Answers answers;
  const DraggableWidget({
    required this.answers,
  });
  @override
  Widget build(BuildContext context) => Draggable<Answers>(
        data: answers,
        feedback: Material(
          color: AppColors.transpatent,
          child: buildText(),
        ),
        child: buildText(),
        //childWhenDragging: Container(height: size),
      );
  Widget buildText() => Container(
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: Colors.transparent,
        ),
        child: Text(
          answers.text,
          textAlign: TextAlign.center,
        ),
      );
}
