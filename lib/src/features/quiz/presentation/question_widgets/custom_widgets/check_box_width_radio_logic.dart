import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:history_of_adventures/src/core/colors.dart';
import 'package:history_of_adventures/src/core/utils/styles.dart';

import 'package:history_of_adventures/src/core/widgets/clickable_widget.dart';
import 'package:history_of_adventures/src/features/quiz/data/quiz_model.dart';

class CheckBoxTextWithRadioLogic extends StatefulWidget {
  final bool? value;
  final bool? isCorrect;
  final Function(bool val)? onTap;
  const CheckBoxTextWithRadioLogic({
    Key? key,
    this.value,
    this.onTap,
    this.isCorrect,
  }) : super(key: key);

  @override
  _CheckBoxTextWithRadioLogicState createState() =>
      _CheckBoxTextWithRadioLogicState();
}

class _CheckBoxTextWithRadioLogicState
    extends State<CheckBoxTextWithRadioLogic> {
  @override
  Widget build(BuildContext context) {
    return Clickable(
      onPressed: () {
        widget.onTap!(!widget.value!);
      },
      child: Container(
        margin: const EdgeInsets.only(right: 12),
        height: 16,
        width: 16,
        decoration: !QuizData.showRightAnswers
            ? BoxDecoration(
                color: widget.value! ? AppColors.orange : AppColors.transpatent,
                border: widget.value!
                    ? null
                    : Border.all(color: Colors.black, width: 1),
                borderRadius: BorderRadius.circular(2))
            : BoxDecoration(
                color: widget.isCorrect == null
                    ? AppColors.transpatent
                    : widget.isCorrect!
                        ? AppColors.green
                        : AppColors.red,
                border: widget.isCorrect == null
                    ? Border.all(color: Colors.black, width: 1)
                    : null,
                borderRadius: BorderRadius.circular(2)),
        child: Visibility(
          visible: widget.value!,
          child: const Center(
            child: Icon(
              Icons.done,
              color: AppColors.white,
              size: 12,
            ),
          ),
        ),
      ),
    );
  }
}
