import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:history_of_adventures/src/core/colors.dart';
import 'package:history_of_adventures/src/core/utils/styles.dart';
import 'package:history_of_adventures/src/core/widgets/widgets.dart';
import 'package:history_of_adventures/src/features/quiz/data/quiz_model.dart';

class CheckboxText extends StatefulWidget {
  bool value;
  bool? isCorrect;
  final String text;
  final CheckBoxWidget<bool> answers;
  final Function(bool val) onTap;

  CheckboxText(
      {Key? key,
      required this.answers,
      required this.value,
      required this.text,
      required this.onTap,
      required this.isCorrect})
      : super(key: key);

  @override
  _CheckboxTextState createState() => _CheckboxTextState();
}

class _CheckboxTextState extends State<CheckboxText> {
  // Color? color;
  // @override
  // void initState() {
  //   if (QuizData.showRightAnswers &&
  //           widget.answers.answers.correctAnswers == CorrectAnswers.answer2 ||
  //       widget.answers.answers.correctAnswers == CorrectAnswers.answer4 ||
  //       widget.answers.answers.correctAnswers == CorrectAnswers.answer5) {
  //     color = AppColors.green;
  //   } else {
  //     color = AppColors.red;
  //   }
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Clickable(
      onPressed: () {
        widget.onTap(widget.value);
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 12),
            height: 16,
            width: 16,
            decoration: !QuizData.showRightAnswers
                ? BoxDecoration(
                    color:
                        widget.value ? AppColors.orange : AppColors.transpatent,
                    border: widget.value
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
              visible: widget.value,
              child: const Center(
                child: Icon(
                  Icons.done,
                  color: AppColors.white,
                  size: 12,
                ),
              ),
            ),
          ),
          Container(
            width: HW.getWidth(450, context),
            child: Text(
              widget.text,
              maxLines: 4,
              style: widget.isCorrect == null
                  ? Theme.of(context)
                      .textTheme
                      .bodyText1
                      ?.copyWith(fontSize: TextFontSize.getHeight(16, context))
                  : widget.isCorrect!
                      ? Theme.of(context).textTheme.bodyText1?.copyWith(
                          color: Colors.green,
                          fontSize: TextFontSize.getHeight(16, context))
                      : Theme.of(context).textTheme.bodyText1?.copyWith(
                          color: Colors.red,
                          fontSize: TextFontSize.getHeight(16, context)),
            ),
          ),
        ],
      ),
    );
  }
}
