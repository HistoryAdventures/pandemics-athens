import 'package:flutter/material.dart';
import 'package:history_of_adventures/src/core/colors.dart';
import 'package:history_of_adventures/src/core/utils/styles.dart';
import 'package:history_of_adventures/src/core/widgets/widgets.dart';
import 'package:history_of_adventures/src/features/quiz/data/quiz_model.dart';

class SelectImage extends StatefulWidget {
  final String image;
  int value;
  int groupValue;
  final CheckBoxWidget<int> answers;
  final Function(int val) onTap;
  SelectImage(
      {Key? key,
      required this.answers,
      required this.image,
      required this.value,
      required this.onTap,
      required this.groupValue})
      : super(key: key);

  @override
  _SelectImageState createState() => _SelectImageState();
}

class _SelectImageState extends State<SelectImage> {
  @override
  Widget build(BuildContext context) {
    return Clickable(
      onPressed: () {
        widget.onTap(widget.value);
      },
      child: Container(
        height: HW.getHeight(160, context),
        width: HW.getWidth(160, context),
        decoration: QuizData.showRightAnswers
            ? BoxDecoration(
                color: AppColors.white,
                boxShadow: widget.groupValue == widget.value
                    ? widget.value == 1
                        ? Shadows.allBordersGreen
                        : Shadows.allBordersRed
                    : null,
                border: Border.all(
                    color: widget.groupValue == widget.value
                        ? widget.value == 1
                            ? AppColors.linearGradientGreenBox
                            : AppColors.linearGradientRedBox
                        : AppColors.grey))
            : widget.value == widget.groupValue
                ? BoxDecoration(
                    color: AppColors.white,
                    boxShadow: Shadows.allBordersBlue,
                    border: Border.all(color: AppColors.orange, width: 3),
                  )
                : BoxDecoration(
                    border: Border.all(color: AppColors.grey, width: 1),
                  ),
        padding: EdgeInsets.symmetric(
            vertical: HW.getWidth(36, context),
            horizontal: HW.getHeight(36, context)),
        // decoration: widget.decoration,
        child: Container(
          height: HW.getHeight(88, context),
          width: HW.getWidth(88, context),
          child: Image.asset(widget.image),
        ),
      ),
    );
  }
}
