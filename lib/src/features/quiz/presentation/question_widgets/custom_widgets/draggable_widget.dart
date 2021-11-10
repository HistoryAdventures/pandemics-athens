import 'package:flutter/material.dart';
import 'package:history_of_adventures/src/core/colors.dart';
import 'package:history_of_adventures/src/core/utils/styles.dart';
import 'package:history_of_adventures/src/features/quiz/presentation/question_widgets/answer_model.dart';

class DraggableWidget extends StatelessWidget {
  final Answers answers;
  final bool? isCorrect;
  final String? correctAnswer;
  const DraggableWidget(
      {required this.answers, this.isCorrect, this.correctAnswer});
  @override
  Widget build(BuildContext context) => Draggable<Answers>(
        data: answers,
        feedback: Material(
          color: AppColors.transpatent,
          child: buildText(context),
        ),
        child: buildText(context),
        //childWhenDragging: Container(height: size),
      );
  Widget buildText(BuildContext context) {
    return
        // isCorrect == null
        //     ?
        Container(
      child: Text(
        answers.text,
        style: Theme.of(context).textTheme.bodyText2?.copyWith(
            decoration: isCorrect == null
                ? TextDecoration.none
                : isCorrect!
                    ? TextDecoration.none
                    : TextDecoration.lineThrough,
            fontSize: TextFontSize.getHeight(16, context),
            color: AppColors.green),
      ),
    );
    // : isCorrect!
    //     ? Container(
    //         child: Text(
    //           answers.text,
    //           style: Theme.of(context).textTheme.bodyText2?.copyWith(
    //               fontSize: TextFontSize.getHeight(16, context),
    //               color: AppColors.green),
    //         ),
    //       )
    //     : ;
  }
}
