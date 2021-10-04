import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:history_of_adventures/src/core/colors.dart';
import 'package:history_of_adventures/src/features/quiz/presentation/question_widgets/answer_model.dart';

class DraggableCirclesWidget extends StatelessWidget {
  final Answers answer;

  const DraggableCirclesWidget({
    required this.answer,
  });

  @override
  Widget build(BuildContext context) => Container(
        child: Draggable<Answers>(
          data: answer,
          feedback: Material(
            color: Colors.transparent,
            child: Container(
              child: buildText(context, answer.text, false),
            ),
          ),
          child: buildText(context, answer.text, true),
          //childWhenDragging: Container(height: size),
        ),
      );

  Widget buildText(BuildContext context, String text, bool isFeedBak) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 35,
            width: 35,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.blue, width: 3),
              color: Colors.white,
            ),
          ),
        ],
      );
}
