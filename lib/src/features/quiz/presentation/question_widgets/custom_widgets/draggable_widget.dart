import 'package:flutter/material.dart';
import 'package:history_of_adventures/src/core/colors.dart';
import 'package:history_of_adventures/src/features/quiz/presentation/question_widgets/answer_model.dart';

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
        child: Text(
          answers.text,
        ),
      );
}
