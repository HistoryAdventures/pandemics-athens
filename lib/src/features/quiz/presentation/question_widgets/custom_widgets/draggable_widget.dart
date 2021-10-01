import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:history_of_adventures/src/core/colors.dart';
import 'package:history_of_adventures/src/features/quiz/presentation/question_widgets/answer_model.dart';

class DraggableWidget extends StatelessWidget {
  final Answers answer;

  const DraggableWidget({
    required this.answer,
  });

  @override
  Widget build(BuildContext context) => Container(
        child: Draggable<Answers>(
          data: answer,
          feedback: Material(
            color: Colors.transparent,
            child: Container(
              decoration:
                  BoxDecoration(border: Border.all(color: AppColors.black100)),
              child: buildText(context),
            ),
          ),
          child: buildText(context),
          //childWhenDragging: Container(height: size),
        ),
      );

  Widget buildText(BuildContext context) => Container(
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: Colors.transparent,
        ),
        child: AutoSizeText(
          answer.text,
          maxLines: 1,
          textAlign: TextAlign.center,
        ),
      );
}
